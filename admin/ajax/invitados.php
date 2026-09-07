<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../config/imagen.php';
require_once __DIR__ . '/../modelos/Invitado.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';
$carpeta = __DIR__ . '/../files/invitados';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Invitado::listar()]);

    case 'obtener':
        $invitado = Invitado::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($invitado ? ['ok' => true, 'datos' => $invitado] : ['ok' => false, 'error' => 'Invitado no encontrado.']);

    case 'crear':
    case 'actualizar':
        $id = (int) ($_POST['id'] ?? 0);
        $nombre = trim($_POST['nombre'] ?? '');
        if ($nombre === '') {
            respuestaJson(['ok' => false, 'error' => 'El nombre es obligatorio.']);
        }

        try {
            $fotoNueva = subirArchivo('foto', $carpeta, ['jpg', 'jpeg', 'png', 'webp']);
            $datos = [
                'nombre' => $nombre,
                'cargo' => trim($_POST['cargo'] ?? '') ?: null,
            ];

            if ($accion === 'crear') {
                $datos['foto'] = $fotoNueva;
                $id = Invitado::crear($datos);
            } else {
                $actual = Invitado::obtener($id);
                if (!$actual) {
                    respuestaJson(['ok' => false, 'error' => 'Invitado no encontrado.']);
                }
                if ($fotoNueva) {
                    borrarArchivo($carpeta, $actual['foto']);
                }
                $datos['foto'] = $fotoNueva ?: $actual['foto'];
                Invitado::actualizar($id, $datos);
            }
            respuestaJson(['ok' => true, 'id' => $id]);
        } catch (RuntimeException $e) {
            respuestaJson(['ok' => false, 'error' => $e->getMessage()]);
        }

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        $invitado = Invitado::obtener($id);
        if ($invitado) {
            Invitado::eliminar($id);
            borrarArchivo($carpeta, $invitado['foto']);
        }
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
