<?php
/**
 * Ayudas de presentacion para las paginas publicas. No consultan la base de
 * datos: solo dan formato a lo que la pagina ya cargo.
 */

/**
 * Imagenes de portada de un video o podcast a partir de su enlace.
 *
 * YouTube publica varias miniaturas del mismo video en direcciones fijas, de
 * mayor a menor calidad. Se devuelven en ese orden para que la vista intente
 * primero la buena y baje de calidad solo si esa no existe: no todos los
 * videos tienen la version grande, y pedir directo la chica se ve pixelada.
 *
 * Spotify no ofrece algo parecido sin pedir permiso a su API, asi que ahi se
 * devuelve una lista vacia y la vista usa la imagen de siempre.
 */
function miniaturasDeEnlace(string $urlEmbed): array
{
    if (preg_match('~youtube\.com/embed/([A-Za-z0-9_-]{11})~', $urlEmbed, $coincidencia)) {
        $id = $coincidencia[1];
        return [
            "https://img.youtube.com/vi/$id/maxresdefault.jpg",  // 1280x720
            "https://img.youtube.com/vi/$id/sddefault.jpg",      // 640x480
            "https://img.youtube.com/vi/$id/hqdefault.jpg",      // 480x360
        ];
    }
    return [];
}

/**
 * Etiqueta <img> que va probando las miniaturas hasta dar con una que cargue,
 * y termina en la imagen local si ninguna responde (por ejemplo, sin internet).
 */
function etiquetaMiniatura(string $urlEmbed, string $respaldo, string $alt): string
{
    $opciones = miniaturasDeEnlace($urlEmbed);
    $opciones[] = $respaldo;

    $primera = array_shift($opciones);
    // Cada fallo pasa a la siguiente de la lista; la ultima ya no reintenta.
    $siguientes = json_encode(array_values($opciones), JSON_UNESCAPED_SLASHES);

    return sprintf(
        '<img src="%s" alt="%s" data-respaldos=\'%s\' onerror="siguienteMiniatura(this)">',
        htmlspecialchars($primera),
        htmlspecialchars($alt),
        htmlspecialchars($siguientes, ENT_QUOTES)
    );
}

/**
 * Recorta un texto largo sin cortar una palabra por la mitad.
 */
function resumir(?string $texto, int $largo = 160): string
{
    $texto = trim(preg_replace('/\s+/', ' ', strip_tags((string) $texto)));
    if ($texto === '' || mb_strlen($texto) <= $largo) {
        return $texto;
    }
    $corte = mb_substr($texto, 0, $largo);
    $ultimoEspacio = mb_strrpos($corte, ' ');
    if ($ultimoEspacio !== false) {
        $corte = mb_substr($corte, 0, $ultimoEspacio);
    }
    return $corte . '…';
}

/**
 * Cuerpo de la nota listo para mostrar.
 *
 * Lo que se escribe con el editor del panel ya viene como HTML y ya paso por
 * limpiarHtml() al guardarse, asi que se muestra tal cual. Las notas viejas,
 * cargadas como texto plano, se escapan y se parten en parrafos por las
 * lineas en blanco; de lo contrario se verian como un solo bloque corrido.
 */
function cuerpoComoHtml(?string $texto): string
{
    $texto = (string) $texto;
    if (trim($texto) === '') {
        return '';
    }

    if (preg_match('~<(p|h2|h3|h4|ul|ol|blockquote|br)\b~i', $texto)) {
        return $texto;
    }

    // Segun como se cargo la nota, los parrafos vienen separados por una
    // linea en blanco o por un solo salto; se prueba primero lo mas explicito.
    $bloques = preg_split('/\n\s*\n/', trim($texto));
    if (count($bloques) < 2) {
        $bloques = preg_split('/\n/', trim($texto));
    }

    $html = '';
    foreach ($bloques as $bloque) {
        $bloque = trim($bloque);
        if ($bloque !== '') {
            $html .= '<p>' . htmlspecialchars($bloque) . '</p>';
        }
    }
    return $html;
}
