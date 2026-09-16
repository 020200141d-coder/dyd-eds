<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../config/imagen.php';
require_once __DIR__ . '/../modelos/Noticia.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';
$carpeta = __DIR__ . '/../files/noticias';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Noticia::listar()]);

    case 'obtener':
        $noticia = Noticia::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($noticia ? ['ok' => true, 'datos' => $noticia] : ['ok' => false, 'error' => 'Noticia no encontrada.']);

    case 'crear':
    case 'actualizar':
        $id = (int) ($_POST['id'] ?? 0);
        $titulo = trim($_POST['titulo'] ?? '');
        if ($titulo === '') {
            respuestaJson(['ok' => false, 'error' => 'El título es obligatorio.']);
        }

        try {
            $fotoNueva = subirArchivo('foto', $carpeta, ['jpg', 'jpeg', 'png', 'webp'], 'noticias');
            // solo se aceptan los dos estados validos; cualquier otra cosa se toma
            // como borrador para no publicar nada por accidente
            $estado = ($_POST['estado'] ?? '') === 'publicado' ? 'publicado' : 'borrador';

            $datos = [
                'estado' => $estado,
                'titulo' => $titulo,
                'link_externo' => trim($_POST['link_externo'] ?? '') ?: null,
                'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
                'usuario_id' => usuarioActual()['id'],
            ];

            if ($accion === 'crear') {
                $datos['foto'] = $fotoNueva;
                $id = Noticia::crear($datos);
            } else {
                $actual = Noticia::obtener($id);
                if (!$actual) {
                    respuestaJson(['ok' => false, 'error' => 'Noticia no encontrada.']);
                }
                if ($fotoNueva) {
                    borrarArchivo($carpeta, $actual['foto']);
                }
                $datos['foto'] = $fotoNueva ?: $actual['foto'];
                Noticia::actualizar($id, $datos);
            }
            respuestaJson(['ok' => true, 'id' => $id]);
        } catch (RuntimeException $e) {
            respuestaJson(['ok' => false, 'error' => $e->getMessage()]);
        }

    case 'destacar':
        $id = (int) ($_POST['id'] ?? 0);
        $registro = Noticia::obtener($id);
        if (!$registro) {
            respuestaJson(['ok' => false, 'error' => 'Noticia no encontrada.']);
        }
        // Un borrador no puede abrir la portada: ahi no se veria.
        if ($registro['estado'] !== 'publicado' && $registro['es_destacado'] != 1) {
            respuestaJson(['ok' => false, 'error' => 'Publica la noticia antes de destacarlo.']);
        }
        if ($registro['es_destacado'] == 1) {
            Noticia::quitarDestacado($id);
            respuestaJson(['ok' => true, 'destacado' => false]);
        }
        Noticia::marcarDestacado($id);
        respuestaJson(['ok' => true, 'destacado' => true]);

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        $noticia = Noticia::obtener($id);
        if ($noticia) {
            Noticia::eliminar($id);
            borrarArchivo($carpeta, $noticia['foto']);
        }
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
