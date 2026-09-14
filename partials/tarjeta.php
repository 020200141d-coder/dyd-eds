<?php
/**
 * Tarjeta de reportaje (grids-block-5). Espera $reportaje ya cargado
 * por la pagina que la incluye; no consulta la base de datos.
 */
$urlDetalle = BASE . '/reportaje.php?id=' . (int) $reportaje['id'];
?>
<div class="col-lg-4 col-md-6 grids5-info mt-5">
  <a href="<?= $urlDetalle ?>" class="d-block">
    <span class="foto-marca">
      <?php if (!empty($reportaje['foto_principal'])): ?>
        <img src="<?= BASE ?>/admin/files/reportajes/<?= htmlspecialchars($reportaje['foto_principal']) ?>" alt="<?= htmlspecialchars($reportaje['titulo']) ?>" class="img-fluid">
      <?php else: ?>
        <img src="<?= BASE ?>/assets/images/video.jpg" alt="" class="img-fluid">
      <?php endif; ?>
    </span>
  </a>
  <div class="blog-info">
    <h5><?= date('d/m/Y', strtotime($reportaje['fecha_publicacion'])) ?></h5>
    <h4><a href="<?= $urlDetalle ?>" class="d-block"><?= htmlspecialchars($reportaje['titulo']) ?></a></h4>
    <a href="<?= $urlDetalle ?>" class="btn mt-4 p-0">Leer <span class="fa fa-arrow-right"></span></a>
  </div>
</div>
