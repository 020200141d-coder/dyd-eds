<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Autor.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Autor::listar()]);

    case 'obtener':
        $autor = Autor::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($autor ? ['ok' => true, 'datos' => $autor] : ['ok' => false, 'error' => 'Autor no encontrado.']);

    case 'crear':
    case 'actualizar':
        $nombre = trim($_POST['nombre'] ?? '');
        if ($nombre === '') {
            respuestaJson(['ok' => false, 'error' => 'El nombre es obligatorio.']);
        }
        if ($accion === 'crear') {
            $id = Autor::crear(['nombre' => $nombre]);
        } else {
            $id = (int) ($_POST['id'] ?? 0);
            Autor::actualizar($id, ['nombre' => $nombre]);
        }
        respuestaJson(['ok' => true, 'id' => $id]);

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        if (Autor::eliminar($id)) {
            respuestaJson(['ok' => true]);
        }
        respuestaJson(['ok' => false, 'error' => 'No se puede eliminar: el autor tiene reportajes asociados.']);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
