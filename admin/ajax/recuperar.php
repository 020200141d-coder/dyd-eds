<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Recuperacion.php';

// Este es el unico ajax sin sesion: justamente lo usa quien no puede entrar.

$accion = $_POST['accion'] ?? '';

switch ($accion) {
    case 'solicitar':
        $email = trim($_POST['email'] ?? '');
        if ($email === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            respuestaJson(['ok' => false, 'error' => 'Escribe un correo válido.']);
        }

        $usuario = Recuperacion::usuarioPorEmail($email);

        // La respuesta es la misma exista o no la cuenta: si cambiara, esta
        // pantalla serviria para averiguar que correos estan registrados.
        $respuesta = [
            'ok' => true,
            'mensaje' => 'Si ese correo está registrado, se generó un enlace para restablecer la contraseña.',
        ];

        if ($usuario) {
            $token = Recuperacion::crear((int) $usuario['id']);
            $enlace = BASE . '/admin/nueva-clave.php?token=' . $token;

            // En un servidor con correo saliente esto se enviaria por mail.
            // En XAMPP no hay, asi que el enlace se muestra en pantalla para
            // que el flujo se pueda completar y revisar.
            $respuesta['enlace'] = $enlace;
        }

        respuestaJson($respuesta);

    case 'restablecer':
        $token = trim($_POST['token'] ?? '');
        $clave = (string) ($_POST['clave'] ?? '');
        $repetida = (string) ($_POST['clave_repetida'] ?? '');

        if (strlen($clave) < 8) {
            respuestaJson(['ok' => false, 'error' => 'La contraseña debe tener al menos 8 caracteres.']);
        }
        if ($clave !== $repetida) {
            respuestaJson(['ok' => false, 'error' => 'Las dos contraseñas no coinciden.']);
        }

        $pedido = Recuperacion::buscarVigente($token);
        if (!$pedido) {
            respuestaJson(['ok' => false, 'error' => 'El enlace ya se usó o venció. Pide uno nuevo.']);
        }

        Recuperacion::aplicar((int) $pedido['id'], (int) $pedido['usuario_id'], $clave);
        respuestaJson(['ok' => true, 'mensaje' => 'Contraseña actualizada. Ya puedes iniciar sesión.']);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
