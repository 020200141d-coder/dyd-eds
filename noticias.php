<?php
require_once __DIR__ . '/clases/Noticia.php';

$noticias = Noticia::mostrar_todos();

$tituloPagina = 'Noticias Recientes - DDP Noticias';
$metaDescripcion = 'Actualidad y notas breves sobre minería, obras públicas y desarrollo en las regiones del Perú.';
$tituloBreadcrumb = 'Noticias Recientes';
require __DIR__ . '/partials/cabecera.php';
?>

<div class="grids-block-5 py-5">
  <section class="py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <?php if (!$noticias): ?>
          <p class="text-center w-100">Todavía no hay noticias registradas.</p>
        <?php endif; ?>
        <?php foreach ($noticias as $noticia): ?>
          <div class="col-lg-4 col-md-6 grids5-info mt-5">
            <a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="d-block">
              <?php if (!empty($noticia['foto'])): ?>
                <span class="foto-marca cuadrada">
                  <img src="<?= BASE ?>/admin/files/noticias/<?= htmlspecialchars($noticia['foto']) ?>" alt="<?= htmlspecialchars($noticia['titulo']) ?>" class="img-fluid">
                </span>
              <?php endif; ?>
            </a>
            <div class="blog-info">
              <h5><?= date('d/m/Y', strtotime($noticia['fecha_publicacion'])) ?></h5>
              <h4><a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="d-block"><?= htmlspecialchars($noticia['titulo']) ?></a></h4>
              <a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="btn mt-4 p-0">Leer <span class="fa fa-arrow-right"></span></a>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
</div>

<?php require __DIR__ . '/partials/pie.php'; ?>
