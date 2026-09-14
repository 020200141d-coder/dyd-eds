<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../config/imagen.php';
require_once __DIR__ . '/../modelos/Boletin.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';
$carpetaPortada = __DIR__ . '/../files/boletines/portada';
$carpetaPdf = __DIR__ . '/../files/boletines/pdf';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Boletin::listar()]);

    case 'obtener':
        $boletin = Boletin::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($boletin ? ['ok' => true, 'datos' => $boletin] : ['ok' => false, 'error' => 'Boletín no encontrado.']);

    case 'crear':
    case 'actualizar':
        $id = (int) ($_POST['id'] ?? 0);
        $numero = trim($_POST['numero_boletin'] ?? '');
        if ($numero === '') {
            respuestaJson(['ok' => false, 'error' => 'El número de boletín es obligatorio.']);
        }
        if (Boletin::numeroExiste($numero, $accion === 'actualizar' ? $id : null)) {
            respuestaJson(['ok' => false, 'error' => 'Ese número de boletín ya existe.']);
        }
        if ($accion === 'crear' && empty($_FILES['archivo_pdf']['name'])) {
            respuestaJson(['ok' => false, 'error' => 'Debes adjuntar el PDF del boletín.']);
        }

        try {
            $portadaNueva = subirArchivo('foto_portada', $carpetaPortada, ['jpg', 'jpeg', 'png', 'webp'], 'boletines');
            $pdfNuevo = subirArchivo('archivo_pdf', $carpetaPdf, ['pdf']);

            // solo se aceptan los dos estados validos; cualquier otra cosa se toma
            // como borrador para no publicar nada por accidente
            $estado = ($_POST['estado'] ?? '') === 'publicado' ? 'publicado' : 'borrador';

            $datos = [
                'estado' => $estado,
                'numero_boletin' => $numero,
                'resumen' => trim($_POST['resumen'] ?? '') ?: null,
                'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
                'usuario_id' => usuarioActual()['id'],
            ];

            if ($accion === 'crear') {
                $datos['foto_portada'] = $portadaNueva;
                $datos['archivo_pdf'] = $pdfNuevo;
                $id = Boletin::crear($datos);
            } else {
                $actual = Boletin::obtener($id);
                if (!$actual) {
                    respuestaJson(['ok' => false, 'error' => 'Boletín no encontrado.']);
                }
                if ($portadaNueva) {
                    borrarArchivo($carpetaPortada, $actual['foto_portada']);
                }
                if ($pdfNuevo) {
                    borrarArchivo($carpetaPdf, $actual['archivo_pdf']);
                }
                $datos['foto_portada'] = $portadaNueva ?: $actual['foto_portada'];
                $datos['archivo_pdf'] = $pdfNuevo ?: $actual['archivo_pdf'];
                Boletin::actualizar($id, $datos);
            }
            respuestaJson(['ok' => true, 'id' => $id]);
        } catch (RuntimeException $e) {
            respuestaJson(['ok' => false, 'error' => $e->getMessage()]);
        }

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        $boletin = Boletin::obtener($id);
        if ($boletin) {
            Boletin::eliminar($id);
            borrarArchivo($carpetaPortada, $boletin['foto_portada']);
            borrarArchivo($carpetaPdf, $boletin['archivo_pdf']);
        }
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
