<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/functions.php';

function currentUser(): ?array
{
    return $_SESSION['user'] ?? null;
}

function requireLogin(): void
{
    if (!currentUser()) {
        $base = basePath();
        redirect($base . '/login.php');
    }
}

function requireAdmin(): void
{
    requireLogin();
    if (currentUser()['rol'] !== 'admin') {
        flash('error', 'No tienes permisos para acceder a esa sección.');
        redirect(basePath() . '/index.php');
    }
}

/**
 * Calcula la ruta base del proyecto (para que los enlaces funcionen
 * tanto en http://localhost/dyd-eds/ como en un dominio propio).
 */
function basePath(): string
{
    $scriptDir = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
    // Si estamos dentro de una subcarpeta (usuarios/, reportajes/, etc.) subimos un nivel
    $parts = explode('/', trim($scriptDir, '/'));
    $lastPart = end($parts);
    $knownSubfolders = ['usuarios', 'autores', 'invitados', 'reportajes', 'noticias', 'boletines', 'podcasts', 'videos'];
    if (in_array($lastPart, $knownSubfolders, true)) {
        array_pop($parts);
    }
    $base = '/' . implode('/', $parts);
    return rtrim($base, '/');
}
