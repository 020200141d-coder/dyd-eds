<?php
require_once __DIR__ . '/config/global.php';

if (usuarioActual()) {
    header('Location: ' . BASE . '/admin/index.php');
    exit;
}
?><!DOCTYPE html>
<html lang="es" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Recuperar contraseña - Panel DDP Noticias</title>
  <link rel="stylesheet" href="<?= BASE ?>/admin/assets/css/main.css">
  <link rel="icon" type="image/png" sizes="32x32" href="<?= BASE ?>/admin/assets/img/favicon-32x32.png"/>
  <link rel="stylesheet" href="<?= BASE ?>/assets/css/iconos.css">
</head>
<body>
<div id="app">
  <section class="section main-section">
    <div id="aviso" class="notification red mb-6" hidden></div>
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          Recuperar contraseña
        </p>
      </header>
      <div class="card-content">
        <p class="mb-6">Escribe el correo de tu cuenta y se generará un enlace para elegir una contraseña nueva.</p>

        <form id="formRecuperar">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="email" id="campoEmail" placeholder="tucorreo@dyd.com" autocomplete="username" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>
          <hr>
          <div class="field grouped">
            <div class="control"><button type="submit" class="button blue">Generar enlace</button></div>
            <div class="control"><a href="<?= BASE ?>/admin/login.php" class="button">Volver</a></div>
          </div>
        </form>

        <div id="resultado" hidden>
          <div class="notification green">
            <p id="mensajeResultado"></p>
          </div>
          <div id="cajaEnlace" hidden>
            <p class="mb-2"><b>Enlace para restablecer la contraseña:</b></p>
            <p class="mb-2"><a id="enlaceRecuperacion" href="#"></a></p>
            <p class="has-text-grey">
              En un servidor con correo saliente este enlace llegaría por email.
              Como XAMPP no envía correos, se muestra aquí para poder continuar.
              Vence en una hora y sirve una sola vez.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<script>const BASE = <?= json_encode(BASE) ?>;</script>
<script src="<?= BASE ?>/admin/vistas/scripts/comun.js"></script>
<script src="<?= BASE ?>/admin/vistas/scripts/recuperar.js"></script>
</body>
</html>
