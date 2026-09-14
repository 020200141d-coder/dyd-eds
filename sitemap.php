<?php
/**
 * Mapa del sitio para los buscadores.
 *
 * Se genera solo a partir de la base, asi que cuando el periodista publica
 * una nota queda listada sin que nadie tenga que tocar nada. Solo entra lo
 * que esta publicado: los borradores no deben llegar a Google.
 */
require_once __DIR__ . '/base.php';
require_once __DIR__ . '/clases/Reportaje.php';

$esquema = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$raiz = $esquema . '://' . ($_SERVER['HTTP_HOST'] ?? 'localhost') . BASE;

$paginas = [
    ['url' => $raiz . '/index.php',      'prioridad' => '1.0', 'frecuencia' => 'daily'],
    ['url' => $raiz . '/reportajes.php', 'prioridad' => '0.9', 'frecuencia' => 'daily'],
    ['url' => $raiz . '/noticias.php',   'prioridad' => '0.7', 'frecuencia' => 'daily'],
    ['url' => $raiz . '/boletines.php',  'prioridad' => '0.7', 'frecuencia' => 'weekly'],
    ['url' => $raiz . '/podcast.php',    'prioridad' => '0.6', 'frecuencia' => 'weekly'],
    ['url' => $raiz . '/videos.php',     'prioridad' => '0.6', 'frecuencia' => 'weekly'],
];

// Todas las notas publicadas, recorriendo las paginas del listado.
$reportajes = [];
$totalPaginas = Reportaje::total_paginas();
for ($pagina = 1; $pagina <= $totalPaginas; $pagina++) {
    foreach (Reportaje::mostrar_todos($pagina) as $reportaje) {
        $reportajes[] = $reportaje;
    }
}

header('Content-Type: application/xml; charset=utf-8');
echo '<?xml version="1.0" encoding="UTF-8"?>', "\n";
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<?php foreach ($paginas as $pagina): ?>
  <url>
    <loc><?= htmlspecialchars($pagina['url']) ?></loc>
    <changefreq><?= $pagina['frecuencia'] ?></changefreq>
    <priority><?= $pagina['prioridad'] ?></priority>
  </url>
<?php endforeach; ?>
<?php foreach ($reportajes as $reportaje): ?>
  <url>
    <loc><?= htmlspecialchars($raiz . '/reportaje.php?id=' . (int) $reportaje['id']) ?></loc>
    <lastmod><?= htmlspecialchars($reportaje['fecha_publicacion']) ?></lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
<?php endforeach; ?>
</urlset>
