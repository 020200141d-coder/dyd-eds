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

            if (esServidorLocal()) {
                // En XAMPP no hay correo saliente, asi que el enlace se
                // muestra en pantalla para poder completar y revisar el
                // flujo. Solo aqui: ver abajo por que.
                $respuesta['enlace'] = $enlace;
            } else {
                // Publicado en internet, mostrar el enlace seria regalar el
                // panel: cualquiera escribiria el correo del administrador y
                // entraria. Se intenta mandar por correo y, si el hosting no
                // lo permite (los gratuitos suelen tener mail() desactivado),
                // no se muestra nada.
                $completo = direccionDelSitio() . '/admin/nueva-clave.php?token=' . $token;
                $cuerpo = "Para poner una contrasena nueva, abre este enlace:\n\n"
                    . $completo . "\n\nVence en una hora y sirve una sola vez. "
                    . "Si no pediste esto, ignora el mensaje.";
                if (function_exists('mail')) {
                    @mail(
                        $usuario['email'],
                        'Restablecer tu contrasena',
                        $cuerpo,
                        "From: no-responder@" . ($_SERVER['HTTP_HOST'] ?? 'localhost') . "\r\n"
                        . "Content-Type: text/plain; charset=utf-8\r\n"
                    );
                }
            }
        }

        // Ojo: este mensaje es el mismo exista o no la cuenta, y tampoco
        // cambia segun si el correo salio o no. Si cambiara, esta pantalla
        // serviria para averiguar que correos estan registrados.
        if (!esServidorLocal()) {
            $respuesta['mensaje'] = 'Si ese correo está registrado, se envió un enlace para '
                . 'restablecer la contraseña. Si no llega, pídeselo al administrador del sitio.';
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
