<?php
/**
 * Limpieza del HTML que llega del editor del panel.
 *
 * El editor entrega el texto con formato (negritas, listas, enlaces), pero
 * nunca se guarda tal cual: se recorre el documento y se deja unicamente lo
 * de la lista blanca. Asi un pegado desde Word no arrastra basura y, sobre
 * todo, nadie puede colar un <script> o un enlace "javascript:" que despues
 * se ejecutaria en el sitio publico.
 */

const ETIQUETAS_PERMITIDAS = [
    'p' => [], 'br' => [], 'strong' => [], 'b' => [], 'em' => [], 'i' => [],
    'u' => [], 'h2' => [], 'h3' => [], 'h4' => [], 'blockquote' => [],
    'ul' => [], 'ol' => [], 'li' => [], 'a' => ['href', 'title', 'target', 'rel'],
];

function limpiarHtml(string $html): string
{
    $html = trim($html);
    if ($html === '') {
        return '';
    }

    $doc = new DOMDocument();
    $antes = libxml_use_internal_errors(true);
    // El envoltorio con charset evita que DOMDocument rompa los acentos.
    $doc->loadHTML(
        '<?xml encoding="UTF-8"><div id="raiz">' . $html . '</div>',
        LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD
    );
    libxml_clear_errors();
    libxml_use_internal_errors($antes);

    $raiz = $doc->getElementById('raiz');
    if (!$raiz) {
        return '';
    }

    limpiarNodo($raiz);

    $salida = '';
    foreach ($raiz->childNodes as $hijo) {
        $salida .= $doc->saveHTML($hijo);
    }
    return trim($salida);
}

function limpiarNodo(DOMNode $nodo): void
{
    // Se recorre al reves porque quitar un hijo reordena la lista.
    for ($i = $nodo->childNodes->length - 1; $i >= 0; $i--) {
        $hijo = $nodo->childNodes->item($i);

        if ($hijo instanceof DOMText) {
            continue;
        }

        if (!$hijo instanceof DOMElement) {
            $nodo->removeChild($hijo);
            continue;
        }

        $etiqueta = strtolower($hijo->nodeName);

        // De estas no se rescata nada: su contenido tampoco es texto legible.
        if (in_array($etiqueta, ['script', 'style', 'iframe', 'object', 'embed'], true)) {
            $nodo->removeChild($hijo);
            continue;
        }

        if (!array_key_exists($etiqueta, ETIQUETAS_PERMITIDAS)) {
            // La etiqueta no vale, pero su texto si: se conserva el contenido.
            limpiarNodo($hijo);
            while ($hijo->firstChild) {
                $nodo->insertBefore($hijo->firstChild, $hijo);
            }
            $nodo->removeChild($hijo);
            continue;
        }

        $permitidos = ETIQUETAS_PERMITIDAS[$etiqueta];
        for ($j = $hijo->attributes->length - 1; $j >= 0; $j--) {
            $atributo = $hijo->attributes->item($j);
            $nombre = strtolower($atributo->nodeName);

            if (!in_array($nombre, $permitidos, true)) {
                $hijo->removeAttribute($atributo->nodeName);
                continue;
            }

            if ($nombre === 'href' && !enlaceSeguro($atributo->nodeValue)) {
                $hijo->removeAttribute('href');
            }
        }

        // Los enlaces salen del sitio: se abren aparte y sin heredar permisos.
        if ($etiqueta === 'a' && $hijo->hasAttribute('href')) {
            $hijo->setAttribute('target', '_blank');
            $hijo->setAttribute('rel', 'noopener noreferrer');
        }

        limpiarNodo($hijo);
    }
}

function enlaceSeguro(string $href): bool
{
    $href = trim($href);
    if ($href === '') {
        return false;
    }
    // Relativos y anclas son del propio sitio, no hay a donde escaparse.
    if (str_starts_with($href, '/') || str_starts_with($href, '#')) {
        return true;
    }
    $esquema = strtolower((string) parse_url($href, PHP_URL_SCHEME));
    return in_array($esquema, ['http', 'https', 'mailto'], true);
}
