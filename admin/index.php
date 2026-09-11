<?php
require_once __DIR__ . '/config/global.php';
exigirSesion();

$tituloPagina = 'Dashboard';
$menuActivo = 'dashboard';
$scriptPagina = BASE . '/admin/vistas/scripts/dashboard.js';
require __DIR__ . '/vistas/parciales/cabecera.php';
?>

<div id="tarjetasConteo" class="grid gap-6 grid-cols-2 md:grid-cols-4 mb-6"></div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-newspaper-variant"></i></span> Últimos reportajes</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th>Título</th><th>Usuario</th><th>Fecha</th><th>Destacado</th></tr>
      </thead>
      <tbody id="filasUltimosReportajes">
      <tr><td colspan="4">Cargando...</td></tr>
      </tbody>
    </table>
  </div>
</div>

<?php require __DIR__ . '/vistas/parciales/pie.php'; ?>
