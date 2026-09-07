<?php

function e(?string $value): string
{
    return htmlspecialchars($value ?? '', ENT_QUOTES, 'UTF-8');
}

function redirect(string $path): void
{
    header('Location: ' . $path);
    exit;
}

function flash(string $type, string $message): void
{
    $_SESSION['flash'][] = ['type' => $type, 'message' => $message];
}

function getFlashes(): array
{
    $flashes = $_SESSION['flash'] ?? [];
    unset($_SESSION['flash']);
    return $flashes;
}

function formatDate(?string $date): string
{
    if (!$date) return '';
    $ts = strtotime($date);
    return $ts ? date('d/m/Y', $ts) : $date;
}

/**
 * Sube un archivo desde $_FILES[$field] a $destDir, validando extensión.
 * Devuelve el nombre de archivo generado o null si no se subió nada.
 */
function handleUpload(string $field, string $destDir, array $allowedExt): ?string
{
    if (empty($_FILES[$field]) || $_FILES[$field]['error'] === UPLOAD_ERR_NO_FILE) {
        return null;
    }
    if ($_FILES[$field]['error'] !== UPLOAD_ERR_OK) {
        throw new RuntimeException('Error al subir el archivo.');
    }

    $originalName = $_FILES[$field]['name'];
    $ext = strtolower(pathinfo($originalName, PATHINFO_EXTENSION));
    if (!in_array($ext, $allowedExt, true)) {
        throw new RuntimeException('Extensión de archivo no permitida (' . e($ext) . ').');
    }

    if (!is_dir($destDir)) {
        mkdir($destDir, 0775, true);
    }

    $newName = bin2hex(random_bytes(8)) . '.' . $ext;
    $destPath = rtrim($destDir, '/') . '/' . $newName;

    if (!move_uploaded_file($_FILES[$field]['tmp_name'], $destPath)) {
        throw new RuntimeException('No se pudo guardar el archivo subido.');
    }

    return $newName;
}

function deleteUploadedFile(string $relativeDir, ?string $filename): void
{
    if (!$filename) return;
    $path = rtrim($relativeDir, '/') . '/' . $filename;
    if (is_file($path)) {
        @unlink($path);
    }
}
