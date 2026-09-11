<?php
require_once __DIR__ . '/clases/Reportaje.php';

$pagina = max(1, (int) ($_GET['pagina'] ?? 1));
$reportajes = Reportaje::mostrar_todos($pagina);
$totalPaginas = Reportaje::total_paginas();

$tituloPagina = 'Reportajes - DDP Noticias';
$tituloBreadcrumb = 'Reportajes';
require __DIR__ . '/partials/cabecera.php';
?>

<div class="grids-block-5 py-5">
  <section class="py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <?php if (!$reportajes): ?>
          <p class="text-center w-100">Todavía no hay reportajes publicados.</p>
        <?php endif; ?>
        <?php foreach ($reportajes as $reportaje): ?>
          <?php require __DIR__ . '/partials/tarjeta.php'; ?>
        <?php endforeach; ?>
      </div>
      <?php if ($totalPaginas > 1): ?>
      <div class="pagination">
        <ul>
          <?php for ($p = 1; $p <= $totalPaginas; $p++): ?>
            <li><a href="/dyd-eds/reportajes.php?pagina=<?= $p ?>" <?= $p === $pagina ? 'style="font-weight:bold;"' : '' ?>><?= $p ?></a></li>
          <?php endfor; ?>
        </ul>
      </div>
      <?php endif; ?>
    </div>
  </section>
</div>

<?php require __DIR__ . '/partials/pie.php'; ?>
