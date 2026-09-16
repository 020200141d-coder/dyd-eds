<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Podcast.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Podcast::listar()]);

    case 'obtener':
        $podcast = Podcast::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($podcast ? ['ok' => true, 'datos' => $podcast] : ['ok' => false, 'error' => 'Podcast no encontrado.']);

    case 'crear':
    case 'actualizar':
        $titulo = trim($_POST['titulo'] ?? '');
        $urlEmbed = trim($_POST['url_embed'] ?? '');
        if ($titulo === '' || $urlEmbed === '') {
            respuestaJson(['ok' => false, 'error' => 'Título y URL son obligatorios.']);
        }

        // solo se aceptan los dos estados validos; cualquier otra cosa se toma
        // como borrador para no publicar nada por accidente
        $estado = ($_POST['estado'] ?? '') === 'publicado' ? 'publicado' : 'borrador';

        $datos = [
            'estado' => $estado,
            'titulo' => $titulo,
            'url_embed' => urlParaIncrustar($urlEmbed),
            'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
            'usuario_id' => usuarioActual()['id'],
        ];

        if ($accion === 'crear') {
            $id = Podcast::crear($datos);
        } else {
            $id = (int) ($_POST['id'] ?? 0);
            Podcast::actualizar($id, $datos);
        }
        respuestaJson(['ok' => true, 'id' => $id]);

    case 'destacar':
        $id = (int) ($_POST['id'] ?? 0);
        $registro = Podcast::obtener($id);
        if (!$registro) {
            respuestaJson(['ok' => false, 'error' => 'Podcast no encontrado.']);
        }
        // Un borrador no puede abrir la portada: ahi no se veria.
        if ($registro['estado'] !== 'publicado' && $registro['es_destacado'] != 1) {
            respuestaJson(['ok' => false, 'error' => 'Publica el podcast antes de destacarlo.']);
        }
        if ($registro['es_destacado'] == 1) {
            Podcast::quitarDestacado($id);
            respuestaJson(['ok' => true, 'destacado' => false]);
        }
        Podcast::marcarDestacado($id);
        respuestaJson(['ok' => true, 'destacado' => true]);

    case 'eliminar':
        Podcast::eliminar((int) ($_POST['id'] ?? 0));
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
