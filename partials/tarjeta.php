<?php
/**
 * Tarjeta de reportaje (grids-block-5). Espera $reportaje ya cargado
 * por la pagina que la incluye; no consulta la base de datos.
 */
$urlDetalle = '/dyd-eds/reportaje.php?id=' . (int) $reportaje['id'];
?>
<div class="col-lg-4 col-md-6 grids5-info mt-5">
  <a href="<?= $urlDetalle ?>" class="d-block">
    <?php if (!empty($reportaje['foto_principal'])): ?>
      <img src="/dyd-eds/admin/files/reportajes/<?= htmlspecialchars($reportaje['foto_principal']) ?>" alt="" class="img-fluid">
    <?php else: ?>
      <img src="/dyd-eds/assets/images/video.jpg" alt="" class="img-fluid">
    <?php endif; ?>
  </a>
  <div class="blog-info">
    <h5><?= date('d/m/Y', strtotime($reportaje['fecha_publicacion'])) ?></h5>
    <h4><a href="<?= $urlDetalle ?>" class="d-block"><?= htmlspecialchars($reportaje['titulo']) ?></a></h4>
    <a href="<?= $urlDetalle ?>" class="btn mt-4 p-0">Leer <span class="fa fa-arrow-right"></span></a>
  </div>
</div>
