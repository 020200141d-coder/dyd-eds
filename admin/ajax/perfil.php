<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Usuario.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';
$id = (int) usuarioActual()['id'];

switch ($accion) {
    case 'obtener':
        respuestaJson(['ok' => true, 'datos' => Usuario::obtener($id)]);

    case 'actualizar':
        $nombre = trim($_POST['nombre_completo'] ?? '');
        $email = trim($_POST['email'] ?? '');
        $clave = $_POST['clave'] ?? '';

        if ($nombre === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            respuestaJson(['ok' => false, 'error' => 'Nombre y email válido son obligatorios.']);
        }
        if (Usuario::emailExiste($email, $id)) {
            respuestaJson(['ok' => false, 'error' => 'Ese email ya está en uso.']);
        }

        Usuario::actualizarPerfil($id, ['nombre_completo' => $nombre, 'email' => $email, 'clave' => $clave]);

        $_SESSION['usuario'] = Usuario::obtener($id);
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
