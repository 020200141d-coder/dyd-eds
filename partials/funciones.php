<?php
/**
 * Ayudas de presentacion para las paginas publicas. No consultan la base de
 * datos: solo dan formato a lo que la pagina ya cargo.
 */

/**
 * Imagen de portada de un video o podcast a partir de su enlace.
 *
 * YouTube publica la miniatura de cada video en una direccion fija, asi que
 * se arma con el identificador del enlace. Spotify no ofrece algo parecido
 * sin pedir permiso a su API, por eso ahi se devuelve null y la vista usa la
 * imagen de siempre.
 */
function miniaturaDeEnlace(string $urlEmbed): ?string
{
    if (preg_match('~youtube\.com/embed/([A-Za-z0-9_-]{11})~', $urlEmbed, $coincidencia)) {
        return 'https://img.youtube.com/vi/' . $coincidencia[1] . '/hqdefault.jpg';
    }
    return null;
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
