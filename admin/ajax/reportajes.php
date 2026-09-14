<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../config/html.php';
require_once __DIR__ . '/../config/imagen.php';
require_once __DIR__ . '/../modelos/Reportaje.php';
require_once __DIR__ . '/../modelos/Autor.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';
$carpetaReportajes = __DIR__ . '/../files/reportajes';
$carpetaFotos = __DIR__ . '/../files/reportajes_fotos';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Reportaje::listar()]);

    case 'autoresDisponibles':
        respuestaJson(['ok' => true, 'datos' => Autor::listar()]);

    case 'obtener':
        $reportaje = Reportaje::obtener((int) ($_GET['id'] ?? 0));
        if (!$reportaje) {
            respuestaJson(['ok' => false, 'error' => 'Reportaje no encontrado.']);
        }
        $reportaje['fotos'] = Reportaje::listarFotos($reportaje['id']);
        respuestaJson(['ok' => true, 'datos' => $reportaje]);

    case 'crear':
    case 'actualizar':
        $id = (int) ($_POST['id'] ?? 0);
        $titulo = trim($_POST['titulo'] ?? '');
        $desarrollo = limpiarHtml($_POST['desarrollo'] ?? '');

        if ($titulo === '' || trim(strip_tags($desarrollo)) === '') {
            respuestaJson(['ok' => false, 'error' => 'Título y desarrollo son obligatorios.']);
        }

        try {
            $fotoNueva = subirArchivo('foto_principal', $carpetaReportajes, ['jpg', 'jpeg', 'png', 'webp']);
            $pdfNuevo = subirArchivo('pdf_adjunto', $carpetaReportajes, ['pdf']);

            // solo se aceptan los dos estados validos; cualquier otra cosa se toma
            // como borrador para no publicar nada por accidente
            $estado = ($_POST['estado'] ?? '') === 'publicado' ? 'publicado' : 'borrador';

            $datos = [
                'estado' => $estado,
                'titulo' => $titulo,
                'resumen_corto' => trim($_POST['resumen_corto'] ?? '') ?: null,
                'desarrollo' => $desarrollo,
                'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
                'es_destacado' => !empty($_POST['es_destacado']) ? 1 : 0,
                'autor_id' => !empty($_POST['autor_id']) ? (int) $_POST['autor_id'] : null,
                'usuario_id' => usuarioActual()['id'],
            ];

            if ($accion === 'crear') {
                $datos['foto_principal'] = $fotoNueva;
                $datos['pdf_adjunto'] = $pdfNuevo;
                $id = Reportaje::crear($datos);
            } else {
                $actual = Reportaje::obtener($id);
                if (!$actual) {
                    respuestaJson(['ok' => false, 'error' => 'Reportaje no encontrado.']);
                }
                if ($fotoNueva) {
                    borrarArchivo($carpetaReportajes, $actual['foto_principal']);
                }
                if ($pdfNuevo) {
                    borrarArchivo($carpetaReportajes, $actual['pdf_adjunto']);
                }
                $datos['foto_principal'] = $fotoNueva ?: $actual['foto_principal'];
                $datos['pdf_adjunto'] = $pdfNuevo ?: $actual['pdf_adjunto'];
                Reportaje::actualizar($id, $datos);
            }
            respuestaJson(['ok' => true, 'id' => $id]);
        } catch (RuntimeException $e) {
            respuestaJson(['ok' => false, 'error' => $e->getMessage()]);
        }

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        $reportaje = Reportaje::obtener($id);
        if ($reportaje) {
            $fotos = Reportaje::listarFotos($id);
            Reportaje::eliminar($id);
            borrarArchivo($carpetaReportajes, $reportaje['foto_principal']);
            borrarArchivo($carpetaReportajes, $reportaje['pdf_adjunto']);
            foreach ($fotos as $foto) {
                borrarArchivo($carpetaFotos, $foto['url_foto']);
            }
        }
        respuestaJson(['ok' => true]);

    case 'listarFotos':
        respuestaJson(['ok' => true, 'datos' => Reportaje::listarFotos((int) ($_GET['reportaje_id'] ?? 0))]);

    case 'agregarFoto':
        $reportajeId = (int) ($_POST['reportaje_id'] ?? 0);
        try {
            $nombreArchivo = subirArchivo('foto', $carpetaFotos, ['jpg', 'jpeg', 'png', 'webp']);
            if (!$nombreArchivo) {
                respuestaJson(['ok' => false, 'error' => 'Selecciona una imagen para subir.']);
            }
            $descripcion = trim($_POST['descripcion'] ?? '') ?: null;
            Reportaje::agregarFoto($reportajeId, $nombreArchivo, $descripcion);
            respuestaJson(['ok' => true, 'datos' => Reportaje::listarFotos($reportajeId)]);
        } catch (RuntimeException $e) {
            respuestaJson(['ok' => false, 'error' => $e->getMessage()]);
        }

    case 'eliminarFoto':
        $fotoId = (int) ($_POST['foto_id'] ?? 0);
        $foto = Reportaje::obtenerFoto($fotoId);
        if ($foto) {
            Reportaje::eliminarFoto($fotoId);
            borrarArchivo($carpetaFotos, $foto['url_foto']);
        }
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
