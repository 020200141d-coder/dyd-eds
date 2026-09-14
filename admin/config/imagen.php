<?php
// Ayuda para subir y borrar archivos (fotos y PDFs) desde los ajax.
// No toca la base de datos, solo el disco.

// Medidas con las que la redaccion arma sus imagenes. Toda foto que se sube
// se lleva a la medida de su seccion para que la grilla salga pareja, sin
// importar con que camara o recorte venga.
const MEDIDAS_IMAGEN = [
    'reportajes' => [720, 500],
    'reportajes_fotos' => [720, 500],
    'noticias' => [526, 526],
    'boletines' => [520, 600],
];

const CALIDAD_JPEG = 88;

function subirArchivo(string $campo, string $carpetaDestino, array $extensionesValidas, ?string $medida = null): ?string
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

    if ($medida !== null && isset(MEDIDAS_IMAGEN[$medida])) {
        [$ancho, $alto] = MEDIDAS_IMAGEN[$medida];
        ajustarImagen($rutaDestino, $ancho, $alto);
    }

    return $nombreNuevo;
}

/**
 * Deja la imagen exactamente en el tamano pedido.
 *
 * Recorta centrado lo que sobra del lado mas largo y recien ahi redimensiona,
 * que es lo mismo que hace el sitio al mostrarla: asi lo que se guarda es lo
 * que se ve, y no hay sorpresas de encuadre.
 *
 * Si algo falla (formato raro, GD sin soporte, imagen enorme que no entra en
 * memoria) se deja el archivo original tal como se subio: es preferible una
 * foto sin ajustar que un reportaje sin foto.
 */
function ajustarImagen(string $ruta, int $anchoDestino, int $altoDestino): void
{
    if (!extension_loaded('gd')) {
        return;
    }

    $info = @getimagesize($ruta);
    if (!$info) {
        return;
    }
    [$anchoOriginal, $altoOriginal] = $info;
    $tipo = $info[2];

    $origen = match ($tipo) {
        IMAGETYPE_JPEG => @imagecreatefromjpeg($ruta),
        IMAGETYPE_PNG => @imagecreatefrompng($ruta),
        IMAGETYPE_WEBP => @imagecreatefromwebp($ruta),
        default => null,
    };
    if (!$origen) {
        return;
    }

    // Las fotos de celular guardan la orientacion aparte; sin esto saldrian
    // acostadas.
    if ($tipo === IMAGETYPE_JPEG && function_exists('exif_read_data')) {
        $exif = @exif_read_data($ruta);
        $rotacion = match ($exif['Orientation'] ?? 1) { 3 => 180, 6 => -90, 8 => 90, default => 0 };
        if ($rotacion !== 0) {
            $girada = @imagerotate($origen, $rotacion, 0);
            if ($girada) {
                imagedestroy($origen);
                $origen = $girada;
                $anchoOriginal = imagesx($origen);
                $altoOriginal = imagesy($origen);
            }
        }
    }

    // Recorte centrado: se toma la porcion mas grande que respete la
    // proporcion de destino.
    $proporcionDestino = $anchoDestino / $altoDestino;
    $proporcionOriginal = $anchoOriginal / $altoOriginal;

    if ($proporcionOriginal > $proporcionDestino) {
        $altoCorte = $altoOriginal;
        $anchoCorte = (int) round($altoOriginal * $proporcionDestino);
    } else {
        $anchoCorte = $anchoOriginal;
        $altoCorte = (int) round($anchoOriginal / $proporcionDestino);
    }
    $x = (int) round(($anchoOriginal - $anchoCorte) / 2);
    $y = (int) round(($altoOriginal - $altoCorte) / 2);

    $destino = imagecreatetruecolor($anchoDestino, $altoDestino);

    // Sin esto un PNG con transparencia saldria con el fondo en negro.
    if ($tipo === IMAGETYPE_PNG || $tipo === IMAGETYPE_WEBP) {
        imagealphablending($destino, false);
        imagesavealpha($destino, true);
        imagefill($destino, 0, 0, imagecolorallocatealpha($destino, 0, 0, 0, 127));
    }

    // imagecopyresampled interpola; la version sin "resampled" deja bordes
    // dentados y es justo lo que arruinaria la calidad.
    imagecopyresampled($destino, $origen, 0, 0, $x, $y, $anchoDestino, $altoDestino, $anchoCorte, $altoCorte);

    match ($tipo) {
        IMAGETYPE_JPEG => imagejpeg($destino, $ruta, CALIDAD_JPEG),
        IMAGETYPE_PNG => imagepng($destino, $ruta, 6),
        IMAGETYPE_WEBP => imagewebp($destino, $ruta, CALIDAD_JPEG),
    };

    imagedestroy($origen);
    imagedestroy($destino);
}

function borrarArchivo(string $carpeta, ?string $nombreArchivo): void
{
    if (!$nombreArchivo) return;
    $ruta = rtrim($carpeta, '/') . '/' . $nombreArchivo;
    if (is_file($ruta)) {
        @unlink($ruta);
    }
}
