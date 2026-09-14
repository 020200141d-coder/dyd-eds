<?php
// base.php se carga aca y no solo desde la cabecera, porque si el reportaje
// no existe o esta en borrador hay que redirigir antes de pintar nada, y esa
// redireccion ya necesita BASE.
require_once __DIR__ . '/base.php';
require_once __DIR__ . '/clases/Reportaje.php';

$id = (int) ($_GET['id'] ?? 0);
$reportaje = Reportaje::mostrar_uno($id);

if (!$reportaje) {
    header('Location: ' . BASE . '/reportajes.php');
    exit;
}

$fotos = Reportaje::mostrar_fotos($id);

$tituloPagina = $reportaje['titulo'] . ' - DDP Noticias';
$tituloBreadcrumb = $reportaje['titulo'];

// Lo que se ve en Google y al compartir la nota: si no hay resumen corto se
// usa el comienzo del cuerpo, y si no hay foto queda el logo del medio.
$metaDescripcion = $reportaje['resumen_corto'] ?: $reportaje['desarrollo'];
$metaTipo = 'article';
if (!empty($reportaje['foto_principal'])) {
    $metaImagen = BASE . '/admin/files/reportajes/' . $reportaje['foto_principal'];
}

require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <p class="text-muted">
          <?= date('d/m/Y', strtotime($reportaje['fecha_publicacion'])) ?>
          — <?= htmlspecialchars($reportaje['autor_nombre'] ?? 'Redacción') ?>
        </p>

        <?php if (!empty($reportaje['foto_principal'])): ?>
          <span class="foto-marca mb-4">
            <img src="<?= BASE ?>/admin/files/reportajes/<?= htmlspecialchars($reportaje['foto_principal']) ?>" class="img-fluid" alt="<?= htmlspecialchars($reportaje['titulo']) ?>">
          </span>
        <?php endif; ?>

        <div class="reportaje-cuerpo">
          <?= cuerpoComoHtml($reportaje['desarrollo']) ?>
        </div>

        <?php if (!empty($reportaje['pdf_adjunto'])): ?>
          <p class="mt-4">
            <a href="<?= BASE ?>/admin/files/reportajes/<?= htmlspecialchars($reportaje['pdf_adjunto']) ?>" target="_blank" class="btn btn-style btn-primary">
              <span class="fa fa-download"></span> Descargar PDF adjunto
            </a>
          </p>
        <?php endif; ?>

        <?php if ($fotos): ?>
          <h4 class="mt-5 mb-3">Más fotos</h4>
          <div class="row">
            <?php foreach ($fotos as $foto): ?>
              <div class="col-md-4 mb-4">
                <img src="<?= BASE ?>/admin/files/reportajes_fotos/<?= htmlspecialchars($foto['url_foto']) ?>" class="img-fluid" alt="">
                <?php if (!empty($foto['descripcion'])): ?>
                  <p class="small text-muted mt-1"><?= htmlspecialchars($foto['descripcion']) ?></p>
                <?php endif; ?>
              </div>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>

        <a href="<?= BASE ?>/reportajes.php" class="btn mt-4 p-0"><span class="fa fa-arrow-left"></span> Volver a Reportajes</a>
      </div>
    </div>
  </div>
</section>

<?php
// Datos estructurados: le dicen a Google que esto es una nota periodistica,
// con su titular, fecha, foto y autor. Es lo que permite que aparezca como
// articulo y no como una pagina cualquiera.
$datosEstructurados = [
    '@context' => 'https://schema.org',
    '@type' => 'NewsArticle',
    'headline' => $reportaje['titulo'],
    'datePublished' => $reportaje['fecha_publicacion'],
    'description' => resumir($metaDescripcion, 200),
    'inLanguage' => 'es-PE',
    'mainEntityOfPage' => ['@type' => 'WebPage', '@id' => $urlActual],
    'author' => [
        '@type' => $reportaje['autor_nombre'] ? 'Person' : 'Organization',
        'name' => $reportaje['autor_nombre'] ?: 'Diálogo y Desarrollo Perú',
    ],
    'publisher' => [
        '@type' => 'Organization',
        'name' => 'Diálogo y Desarrollo Perú',
        'logo' => ['@type' => 'ImageObject', 'url' => $esquema . '://' . $dominio . BASE . '/assets/images/logo.png'],
    ],
];
if (!empty($reportaje['foto_principal'])) {
    $datosEstructurados['image'] = [$urlImagen];
}
?>
<script type="application/ld+json">
<?= json_encode($datosEstructurados, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT) ?>
</script>

<?php require __DIR__ . '/partials/pie.php'; ?>
