<?php
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

<?php require __DIR__ . '/partials/pie.php'; ?>
