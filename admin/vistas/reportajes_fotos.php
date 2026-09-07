<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$reportajeId = (int) ($_GET['id'] ?? 0);

$tituloPagina = 'Fotos del reportaje';
$menuActivo = 'reportajes';
$scriptPagina = '/dyd-eds/admin/vistas/scripts/reportajes_fotos.js';
require __DIR__ . '/parciales/cabecera.php';
?>
<script>const idReportaje = <?= $reportajeId ?>;</script>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-image-multiple"></i></span> Fotos adicionales de "<span id="tituloReportaje"></span>"</p>
    <a href="/dyd-eds/admin/vistas/reportajes.php" class="card-header-icon"><span class="icon"><i class="mdi mdi-arrow-left"></i></span></a>
  </header>
  <div class="card-content">
    <form id="formFoto" enctype="multipart/form-data" class="mb-6">
      <div class="field">
        <label class="label">Nueva foto</label>
        <div class="control"><input class="input" type="file" name="foto" accept="image/*" required></div>
      </div>
      <div class="field">
        <label class="label">Descripción (opcional)</label>
        <div class="control"><input class="input" type="text" name="descripcion"></div>
      </div>
      <div class="field">
        <button type="submit" class="button blue"><span class="icon"><i class="mdi mdi-plus"></i></span> <span>Agregar foto</span></button>
      </div>
    </form>

    <div class="grid gap-4 grid-cols-2 md:grid-cols-4" id="grillaFotos"></div>
  </div>
</div>

<?php require __DIR__ . '/parciales/pie.php'; ?>
