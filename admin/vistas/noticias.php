<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Noticias';
$menuActivo = 'noticias';
$scriptPagina = BASE . '/admin/vistas/scripts/noticias.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nueva noticia</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-flash"></i></span> Noticias</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th></th><th>Título</th><th>Link externo</th><th>Fecha</th><th></th></tr></thead>
        <tbody id="filasNoticias"><tr><td colspan="5">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-flash"></i></span> <span id="tituloFormulario">Nueva noticia</span></p>
    </header>
    <div class="card-content">
      <form id="formNoticia" enctype="multipart/form-data">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Título *</label>
          <div class="control"><input class="input" type="text" name="titulo" id="campoTitulo" required></div>
        </div>
        <div class="field">
          <label class="label">Link externo</label>
          <div class="control"><input class="input" type="url" name="link_externo" id="campoLink" placeholder="https://..."></div>
        </div>
        <div class="field">
          <label class="label">Fecha de publicación *</label>
          <div class="control"><input class="input" type="date" name="fecha_publicacion" id="campoFecha" required></div>
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
