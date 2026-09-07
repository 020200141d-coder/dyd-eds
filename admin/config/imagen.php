<?php
// Ayuda para subir y borrar archivos (fotos y PDFs) desde los ajax.
// No toca la base de datos, solo el disco.

function subirArchivo(string $campo, string $carpetaDestino, array $extensionesValidas): ?string
{
    if (empty($_FILES[$campo]) || $_FILES[$campo]['error'] === UPLOAD_ERR_NO_FILE) {
        return null;
    }
    if ($_FILES[$campo]['error'] !== UPLOAD_ERR_OK) {
        throw new RuntimeException('Error al subir el archivo.');
    }

    $extension = strtolower(pathinfo($_FILES[$campo]['name'], PATHINFO_EXTENSION));
    if (!in_array($extension, $extensionesValidas, true)) {
        throw new RuntimeException('Extensión no permitida (' . $extension . ').');
    }

    if (!is_dir($carpetaDestino)) {
        mkdir($carpetaDestino, 0775, true);
    }

    $nombreNuevo = bin2hex(random_bytes(8)) . '.' . $extension;
    $rutaDestino = rtrim($carpetaDestino, '/') . '/' . $nombreNuevo;

    if (!move_uploaded_file($_FILES[$campo]['tmp_name'], $rutaDestino)) {
        throw new RuntimeException('No se pudo guardar el archivo.');
    }

    return $nombreNuevo;
}

function borrarArchivo(string $carpeta, ?string $nombreArchivo): void
{
    if (!$nombreArchivo) return;
    $ruta = rtrim($carpeta, '/') . '/' . $nombreArchivo;
    if (is_file($ruta)) {
        @unlink($ruta);
    }
}
