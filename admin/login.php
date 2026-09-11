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
  <title>Iniciar sesión - Panel DDP Noticias</title>
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
          Panel DDP Noticias
        </p>
      </header>
      <div class="card-content">
        <form id="formLogin">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="email" placeholder="admin@dyd.com" autocomplete="username" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>
          <div class="field spaced">
            <label class="label">Contraseña</label>
            <p class="control icons-left">
              <input class="input" type="password" name="clave" placeholder="Contraseña" autocomplete="current-password" required>
              <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
            </p>
          </div>
          <hr>
          <div class="field grouped">
            <div class="control">
              <button type="submit" class="button blue">Ingresar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
</div>
<script>const BASE = <?= json_encode(BASE) ?>;</script>
<script src="<?= BASE ?>/admin/vistas/scripts/comun.js"></script>
<script src="<?= BASE ?>/admin/vistas/scripts/login.js"></script>
</body>
</html>
