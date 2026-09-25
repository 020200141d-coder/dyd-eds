<?php
require_once __DIR__ . '/../config/global.php';
exigirSesion();

$tituloPagina = 'Mi perfil';
$menuActivo = '';
$scriptPagina = BASE . '/admin/vistas/scripts/perfil.js';
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

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-key"></i></span> Código de recuperación</p>
  </header>
  <div class="card-content">
    <p class="mb-4">
      Si olvidas la contraseña, este código te deja entrar sin necesitar correo.
      Guárdalo en un lugar seguro: impreso, anotado o en tu gestor de contraseñas.
    </p>
    <p class="mb-4 has-text-grey">
      Hace falta porque muchos servidores —entre ellos casi todos los alojamientos
      gratuitos— no pueden enviar correos, así que el enlace de "olvidé mi
      contraseña" nunca llegaría. Sirve una sola vez: después generas otro.
    </p>

    <div id="estadoCodigo" class="notification mb-4">Comprobando...</div>

    <div id="cajaCodigoNuevo" class="notification green mb-4" hidden>
      <p class="mb-2"><b>Este es tu código. Cópialo ahora:</b></p>
      <p class="mb-2" style="font-family:monospace;font-size:1.4rem;letter-spacing:2px" id="codigoGenerado"></p>
      <p>No se vuelve a mostrar. Si lo pierdes, genera uno nuevo desde aquí.</p>
    </div>

    <button type="button" class="button blue" id="btnGenerarCodigo">Generar código nuevo</button>
  </div>
</div>

<?php require __DIR__ . '/parciales/pie.php'; ?>
