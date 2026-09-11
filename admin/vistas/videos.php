<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Videos';
$menuActivo = 'videos';
$scriptPagina = BASE . '/admin/vistas/scripts/videos.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo video</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-video"></i></span> Videos</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th>Título</th><th>URL embed</th><th>Fecha</th><th></th></tr></thead>
        <tbody id="filasVideos"><tr><td colspan="5">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-video"></i></span> <span id="tituloFormulario">Nuevo video</span></p>
    </header>
    <div class="card-content">
      <form id="formVideo">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Título *</label>
          <div class="control"><input class="input" type="text" name="titulo" id="campoTitulo" required></div>
        </div>
        <div class="field">
          <label class="label">URL embed (YouTube, etc.) *</label>
          <div class="control"><input class="input" type="url" name="url_embed" id="campoUrl" placeholder="https://..." required></div>
        </div>
        <div class="field">
          <label class="label">Fecha de publicación *</label>
          <div class="control"><input class="input" type="date" name="fecha_publicacion" id="campoFecha" required></div>
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
