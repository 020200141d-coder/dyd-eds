<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Invitados';
$menuActivo = 'invitados';
$scriptPagina = '/dyd-eds/admin/vistas/scripts/invitados.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo invitado</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-star"></i></span> Invitados / Expositores</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th></th><th>Nombre</th><th>Cargo</th><th></th></tr></thead>
        <tbody id="filasInvitados"><tr><td colspan="4">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-star"></i></span> <span id="tituloFormulario">Nuevo invitado</span></p>
    </header>
    <div class="card-content">
      <form id="formInvitado" enctype="multipart/form-data">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Nombre *</label>
          <div class="control"><input class="input" type="text" name="nombre" id="campoNombre" required></div>
        </div>
        <div class="field">
          <label class="label">Cargo / especialidad</label>
          <div class="control"><input class="input" type="text" name="cargo" id="campoCargo" placeholder="Ej. Docente de Ingeniería de Sistemas"></div>
        </div>
        <div class="field">
          <label class="label">Foto</label>
          <div class="control"><input class="input" type="file" name="foto" accept="image/*"></div>
          <p class="help" id="fotoActual"></p>
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
