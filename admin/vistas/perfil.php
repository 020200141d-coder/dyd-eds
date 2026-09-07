<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Mi perfil';
$menuActivo = '';
$scriptPagina = '/dyd-eds/admin/vistas/scripts/perfil.js';
require __DIR__ . '/parciales/cabecera.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account"></i></span> Mi perfil</p>
  </header>
  <div class="card-content">
    <form id="formPerfil">
      <div class="field">
        <label class="label">Nombre completo *</label>
        <div class="control"><input class="input" type="text" name="nombre_completo" id="campoNombre" required></div>
      </div>
      <div class="field">
        <label class="label">Email *</label>
        <div class="control"><input class="input" type="email" name="email" id="campoEmail" required></div>
      </div>
      <div class="field">
        <label class="label">Rol</label>
        <div class="control"><input class="input" type="text" id="campoRol" disabled></div>
      </div>
      <div class="field">
        <label class="label">Nueva contraseña (dejar vacío para no cambiar)</label>
        <div class="control"><input class="input" type="password" name="clave" autocomplete="new-password"></div>
      </div>
      <hr>
      <div class="field grouped">
        <div class="control"><button type="submit" class="button blue">Guardar cambios</button></div>
      </div>
    </form>
  </div>
</div>

<?php require __DIR__ . '/parciales/pie.php'; ?>
