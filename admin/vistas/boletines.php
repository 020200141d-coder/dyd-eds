<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Boletines';
$menuActivo = 'boletines';
$scriptPagina = '/dyd-eds/admin/vistas/scripts/boletines.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo boletín</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-file-pdf-box"></i></span> Boletines NTEP</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th></th><th>N° Boletín</th><th>Resumen</th><th>PDF</th><th>Fecha</th><th></th></tr></thead>
        <tbody id="filasBoletines"><tr><td colspan="6">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-file-pdf-box"></i></span> <span id="tituloFormulario">Nuevo boletín</span></p>
    </header>
    <div class="card-content">
      <form id="formBoletin" enctype="multipart/form-data">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">N° de boletín *</label>
          <div class="control"><input class="input" type="text" name="numero_boletin" id="campoNumero" required></div>
        </div>
        <div class="field">
          <label class="label">Resumen</label>
          <div class="control"><textarea class="textarea" name="resumen" id="campoResumen" rows="3"></textarea></div>
        </div>
        <div class="field">
          <label class="label">Fecha de publicación *</label>
          <div class="control"><input class="input" type="date" name="fecha_publicacion" id="campoFecha" required></div>
        </div>
        <div class="field">
          <label class="label">Foto de portada</label>
          <div class="control"><input class="input" type="file" name="foto_portada" accept="image/*"></div>
          <p class="help" id="portadaActual"></p>
        </div>
        <div class="field">
          <label class="label" id="etiquetaPdf">Archivo PDF *</label>
          <div class="control"><input class="input" type="file" name="archivo_pdf" accept="application/pdf" id="campoPdfInput"></div>
          <p class="help" id="pdfActual"></p>
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
