<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();
if (usuarioActual()['rol'] !== 'admin') {
    header('Location: ' . BASE . '/admin/index.php');
    exit;
}

$tituloPagina = 'Usuarios';
$menuActivo = 'usuarios';
$scriptPagina = BASE . '/admin/vistas/scripts/usuarios.js';
require __DIR__ . '/parciales/cabecera.php';
?>
<script>const idUsuarioActual = <?= (int) usuarioActual()['id'] ?>;</script>

<div id="vistaLista">
  <div class="flex justify-end mb-6">
    <button type="button" class="button green" onclick="mostrarFormulario()">
      <span class="icon"><i class="mdi mdi-plus"></i></span>
      <span>Nuevo usuario</span>
    </button>
  </div>

  <div class="card has-table">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-multiple"></i></span> Usuarios administradores</p>
    </header>
    <div class="card-content">
      <table>
        <thead><tr><th>Nombre</th><th>Email</th><th>Rol</th><th></th></tr></thead>
        <tbody id="filasUsuarios"><tr><td colspan="4">Cargando...</td></tr></tbody>
      </table>
    </div>
  </div>
</div>

<div id="vistaFormulario" hidden>
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-multiple"></i></span> <span id="tituloFormulario">Nuevo usuario</span></p>
    </header>
    <div class="card-content">
      <form id="formUsuario">
        <input type="hidden" name="id" id="campoId">
        <div class="field">
          <label class="label">Nombre completo *</label>
          <div class="control"><input class="input" type="text" name="nombre_completo" id="campoNombre" required></div>
        </div>
        <div class="field">
          <label class="label">Email *</label>
          <div class="control"><input class="input" type="email" name="email" id="campoEmail" required></div>
        </div>
        <div class="field">
          <label class="label">Rol *</label>
          <div class="control">
            <div class="select">
              <select name="rol" id="campoRol">
                <option value="admin">Admin</option>
                <option value="editor">Editor</option>
                <option value="redactor">Redactor</option>
              </select>
            </div>
          </div>
        </div>
        <div class="field">
          <label class="label" id="etiquetaClave">Contraseña *</label>
          <div class="control"><input class="input" type="password" name="clave" id="campoClave" autocomplete="new-password"></div>
        </div>

        <hr>
        <p class="mb-4"><b>Pregunta de seguridad</b></p>
        <p class="mb-4 has-text-grey">
          Es lo que permite recuperar la cuenta si se olvida la contraseña.
          Este servidor no envía correos, así que sin ella no habría forma de
          volver a entrar. Elige algo que solo esa persona sepa y que no cambie
          con el tiempo.
        </p>
        <div class="field">
          <label class="label" id="etiquetaPregunta">Pregunta *</label>
          <div class="control">
            <input class="input" type="text" name="pregunta" id="campoPregunta"
                   placeholder="¿Cuál es el nombre de tu primera mascota?" maxlength="255">
          </div>
        </div>
        <div class="field">
          <label class="label" id="etiquetaRespuesta">Respuesta *</label>
          <div class="control">
            <input class="input" type="text" name="respuesta" id="campoRespuesta" autocomplete="off">
          </div>
          <p class="help" id="ayudaRespuesta">No distingue mayúsculas ni espacios de más.</p>
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
