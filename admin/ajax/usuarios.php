<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Usuario.php';

exigirAdminAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Usuario::listar()]);

    case 'obtener':
        $usuario = Usuario::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($usuario ? ['ok' => true, 'datos' => $usuario] : ['ok' => false, 'error' => 'Usuario no encontrado.']);

    case 'crear':
    case 'actualizar':
        $id = (int) ($_POST['id'] ?? 0);
        $nombre = trim($_POST['nombre_completo'] ?? '');
        $email = trim($_POST['email'] ?? '');
        $rol = $_POST['rol'] ?? 'redactor';
        $clave = $_POST['clave'] ?? '';

        if ($nombre === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            respuestaJson(['ok' => false, 'error' => 'Nombre y email válido son obligatorios.']);
        }
        if (!in_array($rol, ['admin', 'editor', 'redactor'], true)) {
            respuestaJson(['ok' => false, 'error' => 'Rol no válido.']);
        }
        if ($accion === 'crear' && $clave === '') {
            respuestaJson(['ok' => false, 'error' => 'La contraseña es obligatoria para un usuario nuevo.']);
        }
        if (Usuario::emailExiste($email, $accion === 'actualizar' ? $id : null)) {
            respuestaJson(['ok' => false, 'error' => 'Ese email ya está registrado.']);
        }

        $datos = ['nombre_completo' => $nombre, 'email' => $email, 'rol' => $rol, 'clave' => $clave];

        if ($accion === 'crear') {
            $id = Usuario::crear($datos);
        } else {
            Usuario::actualizar($id, $datos);
        }
        respuestaJson(['ok' => true, 'id' => $id]);

    case 'eliminar':
        $id = (int) ($_POST['id'] ?? 0);
        if ($id === (int) usuarioActual()['id']) {
            respuestaJson(['ok' => false, 'error' => 'No puedes eliminar tu propio usuario.']);
        }
        if (Usuario::eliminar($id)) {
            respuestaJson(['ok' => true]);
        }
        respuestaJson(['ok' => false, 'error' => 'No se puede eliminar: el usuario tiene contenido publicado asociado.']);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
