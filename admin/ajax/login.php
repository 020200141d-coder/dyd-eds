<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Usuario.php';

$email = trim($_POST['email'] ?? '');
$clave = $_POST['clave'] ?? '';

if ($email === '' || $clave === '') {
    respuestaJson(['ok' => false, 'error' => 'Ingresa tu correo y contraseña.']);
}

$usuario = Usuario::verificarLogin($email, $clave);

if (!$usuario) {
    respuestaJson(['ok' => false, 'error' => 'Credenciales incorrectas.']);
}

$_SESSION['usuario'] = $usuario;
respuestaJson(['ok' => true]);
