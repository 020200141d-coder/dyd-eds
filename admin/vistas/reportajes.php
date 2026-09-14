<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Reportajes';
$menuActivo = 'reportajes';
$scriptPagina = BASE . '/admin/vistas/scripts/reportajes.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo reportaje</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-newspaper-variant"></i></span> Reportajes</p>
    </header>
    <div class="card-content">
      <div id="avisoDestacado" class="notification blue mb-4"></div>
      <table>
        <thead><tr><th></th><th>Título</th><th>Autor</th><th>Fecha</th><th>Estado</th><th>Destacado</th><th></th></tr></thead>
        <tbody id="filasReportajes"><tr><td colspan="6">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-newspaper-variant"></i></span> <span id="tituloFormulario">Nuevo reportaje</span></p>
    </header>
    <div class="card-content">
      <form id="formReportaje" enctype="multipart/form-data">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Título *</label>
          <div class="control"><input class="input" type="text" name="titulo" id="campoTitulo" required></div>
        </div>
        <div class="field">
          <label class="label">Resumen corto</label>
          <div class="control"><textarea class="textarea" name="resumen_corto" id="campoResumen" rows="2" maxlength="500"></textarea></div>
        </div>
        <div class="field">
          <label class="label">Desarrollo (contenido completo) *</label>
          <div class="control"><textarea class="textarea" name="desarrollo" id="campoDesarrollo" rows="10" required></textarea></div>
        </div>
        <div class="field">
          <label class="label">Autor</label>
          <div class="control">
            <div class="select">
              <select name="autor_id" id="campoAutor">
                <option value="">Redacción (sin autor)</option>
              </select>
            </div>
          </div>
        </div>
        <div class="field">
          <label class="label">Fecha de publicación *</label>
          <div class="control"><input class="input" type="date" name="fecha_publicacion" id="campoFecha" required></div>
        </div>
        <div class="field">
          <div class="control">
            <label class="checkbox">
              <input type="checkbox" name="es_destacado" id="campoDestacado" value="1">
              <span class="check"></span>
              <span class="control-label">Marcar como destacado</span>
            </label>
          </div>
        </div>
        <div class="field">
          <label class="label">Foto principal (se usa también en la grilla)</label>
          <div class="control"><input class="input" type="file" name="foto_principal" accept="image/*"></div>
          <p class="help" id="fotoActual"></p>
        </div>
        <div class="field">
          <label class="label">PDF adjunto</label>
          <div class="control"><input class="input" type="file" name="pdf_adjunto" accept="application/pdf"></div>
          <p class="help" id="pdfActual"></p>
        </div>
        <div class="field">
          <label class="label">Estado de publicación</label>
          <div class="control">
            <div class="select">
              <select name="estado" id="campoEstado">
                <option value="publicado">Publicado (se ve en el sitio)</option>
                <option value="borrador">Borrador (solo en el panel)</option>
              </select>
            </div>
          </div>
        </div>
        <hr>
        <div class="field grouped">
          <div class="control"><button type="submit" class="button blue">Guardar</button></div>
          <div class="control" id="botonFotos" hidden><a class="button" id="enlaceFotos">Gestionar fotos adicionales</a></div>
          <div class="control"><button type="button" class="button" onclick="mostrarLista()">Cancelar</button></div>
        </div>
      </form>
    </div>
  </div>
</div>

<?php require __DIR__ . '/parciales/pie.php'; ?>
