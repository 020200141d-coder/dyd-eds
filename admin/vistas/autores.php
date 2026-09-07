<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Autores';
$menuActivo = 'autores';
$scriptPagina = '/dyd-eds/admin/vistas/scripts/autores.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo autor</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-edit"></i></span> Autores</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th>Nombre</th><th></th></tr></thead>
        <tbody id="filasAutores"><tr><td colspan="2">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-edit"></i></span> <span id="tituloFormulario">Nuevo autor</span></p>
    </header>
    <div class="card-content">
      <form id="formAutor">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Nombre *</label>
          <div class="control"><input class="input" type="text" name="nombre" id="campoNombre" required></div>
        </div>
        <hr>
        <div class="field grouped">
          <div class="control"><button type="submit" class="button blue">Guardar</button></div>
          <div class="control"><button type="button" class="button" onclick="mostrarLista()">Cancelar</button></div>
        </div>
      </form>
    </div>
  </div>
</div>

<?php require __DIR__ . '/parciales/pie.php'; ?>
