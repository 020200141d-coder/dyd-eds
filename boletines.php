<?php
require_once __DIR__ . '/clases/Boletin.php';

$boletines = Boletin::mostrar_todos();

$tituloPagina = 'Boletín NTEP - DDP Noticias';
$tituloBreadcrumb = 'Boletín NTEP';
require __DIR__ . '/partials/cabecera.php';
?>

<div class="grids-block-5 py-5">
  <section class="py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <?php if (!$boletines): ?>
          <p class="text-center w-100">Todavía no hay boletines publicados.</p>
        <?php endif; ?>
        <?php foreach ($boletines as $boletin): ?>
          <div class="col-lg-4 col-md-6 grids5-info mt-5">
            <a target="_blank" href="<?= BASE ?>/admin/files/boletines/pdf/<?= htmlspecialchars($boletin['archivo_pdf']) ?>" class="d-block">
              <?php if (!empty($boletin['foto_portada'])): ?>
                <img src="<?= BASE ?>/admin/files/boletines/portada/<?= htmlspecialchars($boletin['foto_portada']) ?>" alt="" class="img-fluid">
              <?php endif; ?>
            </a>
            <div class="blog-info">
              <h5>Nº <?= htmlspecialchars($boletin['numero_boletin']) ?> — <?= date('d/m/Y', strtotime($boletin['fecha_publicacion'])) ?></h5>
              <h4><?= htmlspecialchars($boletin['resumen'] ?? '') ?></h4>
              <a target="_blank" href="<?= BASE ?>/admin/files/boletines/pdf/<?= htmlspecialchars($boletin['archivo_pdf']) ?>" class="btn mt-4 p-0"><span class="fa fa-download"></span> Ver Boletín</a>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
</div>

<?php require __DIR__ . '/partials/pie.php'; ?>
