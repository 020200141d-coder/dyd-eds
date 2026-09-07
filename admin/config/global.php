<?php
// Arranque de sesión y utilidades comunes al panel (config, no modelo ni vista).

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/Conexion.php';

function usuarioActual(): ?array
{
    return $_SESSION['usuario'] ?? null;
}

// Para usar al inicio de cada vista del panel.
function exigirSesion(): void
{
    if (!usuarioActual()) {
        header('Location: /dyd-eds/admin/login.php');
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

function respuestaJson($datos): void
{
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($datos);
    exit;
}
