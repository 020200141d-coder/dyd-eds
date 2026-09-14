<?php
require_once __DIR__ . '/clases/Podcast.php';

$podcasts = Podcast::mostrar_todos();

$tituloPagina = 'Podcast - DDP Noticias';
$metaDescripcion = 'Podcast de Diálogo y Desarrollo Perú: conversaciones sobre minería, territorio y desarrollo.';
$tituloBreadcrumb = 'Podcast';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container">
    <div class="row">
      <?php if (!$podcasts): ?>
        <p class="text-center w-100">Todavía no hay podcasts publicados.</p>
      <?php endif; ?>
      <?php foreach ($podcasts as $podcast): ?>
        <div class="col-lg-6 mb-5">
          <h4><?= htmlspecialchars($podcast['titulo']) ?></h4>
          <p class="text-muted"><?= date('d/m/Y', strtotime($podcast['fecha_publicacion'])) ?></p>
          <div class="embed-responsive embed-responsive-16by9">
            <iframe src="<?= htmlspecialchars($podcast['url_embed']) ?>" allow="autoplay; encrypted-media" allowfullscreen style="width:100%;height:180px;border:0;"></iframe>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
