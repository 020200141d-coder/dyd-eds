<?php
require_once __DIR__ . '/clases/Video.php';

$videos = Video::mostrar_todos();

$tituloPagina = 'Videos - DDP Noticias';
$tituloBreadcrumb = 'Videos';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container">
    <div class="row">
      <?php if (!$videos): ?>
        <p class="text-center w-100">Todavía no hay videos publicados.</p>
      <?php endif; ?>
      <?php foreach ($videos as $video): ?>
        <div class="col-lg-6 mb-5">
          <h4><?= htmlspecialchars($video['titulo']) ?></h4>
          <p class="text-muted"><?= date('d/m/Y', strtotime($video['fecha_publicacion'])) ?></p>
          <div class="embed-responsive embed-responsive-16by9">
            <iframe src="<?= htmlspecialchars($video['url_embed']) ?>" allow="autoplay; encrypted-media" allowfullscreen style="width:100%;height:315px;border:0;"></iframe>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
