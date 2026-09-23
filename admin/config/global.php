<?php
// Arranque de sesión y utilidades comunes al panel (config, no modelo ni vista).

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../base.php';
require_once __DIR__ . '/Conexion.php';

function usuarioActual(): ?array
{
    return $_SESSION['usuario'] ?? null;
}

// Para usar al inicio de cada vista del panel.
function exigirSesion(): void
{
    if (!usuarioActual()) {
        header('Location: ' . BASE . '/admin/login.php');
        exit;
    }
}

// Para usar al inicio de cada ajax del panel: corta con un JSON de error
// en vez de redirigir, porque quien llama es fetch(), no el navegador.
function exigirSesionAjax(): void
{
    if (!usuarioActual()) {
        http_response_code(401);
        echo json_encode(['ok' => false, 'error' => 'Sesión expirada, vuelve a iniciar sesión.']);
        exit;
    }
}

function exigirAdminAjax(): void
{
    exigirSesionAjax();
    if (usuarioActual()['rol'] !== 'admin') {
        http_response_code(403);
        echo json_encode(['ok' => false, 'error' => 'No tienes permisos para esta acción.']);
        exit;
    }
}

// YouTube y Spotify no permiten incrustar la URL que uno copia del navegador:
// el iframe queda en blanco con un aviso de conexion rechazada. Hay que usar
// su direccion de incrustar. Aqui se convierte sola, para que quien publica
// pueda pegar el enlace tal como lo copio.
function urlParaIncrustar(string $url): string
{
    $url = trim($url);

    if (preg_match('~(?:youtube\.com/(?:watch\?(?:.*&)?v=|embed/|shorts/|live/)|youtu\.be/)([A-Za-z0-9_-]{11})~', $url, $m)) {
        return 'https://www.youtube.com/embed/' . $m[1];
    }

    if (preg_match('~open\.spotify\.com/(?:embed/)?(episode|show|track|playlist|album)/([A-Za-z0-9]+)~', $url, $m)) {
        return 'https://open.spotify.com/embed/' . $m[1] . '/' . $m[2];
    }

    return $url;
}

/**
 * Si el proyecto se esta viendo en la propia computadora o ya esta publicado.
 *
 * Hay cosas que ayudan mientras uno desarrolla y que en internet serian un
 * agujero: mostrar en pantalla el enlace para restablecer una contrasena es
 * comodo en XAMPP, donde no hay correo saliente, pero publicado dejaria
 * entrar al panel a cualquiera que escriba el correo del administrador.
 */
function esServidorLocal(): bool
{
    $host = strtolower($_SERVER['HTTP_HOST'] ?? '');
    $host = explode(':', $host)[0];          // sin el puerto

    if (in_array($host, ['localhost', '127.0.0.1', '::1', ''], true)) {
        return true;
    }
    // dominios que solo existen en la maquina de uno
    return (bool) preg_match('/\.(local|test|localhost)$/', $host);
}

/**
 * Direccion completa del sitio (https://midominio.com/carpeta), que es lo que
 * hace falta para armar un enlace que viaje por correo: BASE sola es relativa.
 */
function direccionDelSitio(): string
{
    $esquema = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    return $esquema . '://' . ($_SERVER['HTTP_HOST'] ?? 'localhost') . BASE;
}

function respuestaJson($datos): void
{
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($datos);
    exit;
}
