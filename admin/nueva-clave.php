<?php
require_once __DIR__ . '/config/global.php';
require_once __DIR__ . '/modelos/Recuperacion.php';

$token = trim($_GET['token'] ?? '');
$pedido = $token !== '' ? Recuperacion::buscarVigente($token) : null;
?><!DOCTYPE html>
<html lang="es" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Nueva contraseña - Panel DDP Noticias</title>
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
          Elegir una contraseña nueva
        </p>
      </header>
      <div class="card-content">
        <?php if (!$pedido): ?>
          <div class="notification red">
            <p>Este enlace ya se usó o venció. Pide uno nuevo desde la pantalla de recuperación.</p>
          </div>
          <a href="<?= BASE ?>/admin/recuperar.php" class="button blue">Pedir otro enlace</a>
        <?php else: ?>
          <p class="mb-6">Cuenta: <b><?= htmlspecialchars($pedido['email']) ?></b></p>

          <form id="formNuevaClave">
            <input type="hidden" name="token" value="<?= htmlspecialchars($token) ?>">
            <div class="field spaced">
              <label class="label">Contraseña nueva</label>
              <p class="control icons-left">
                <input class="input" type="password" name="clave" minlength="8" autocomplete="new-password" required>
                <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
              </p>
              <p class="help">Mínimo 8 caracteres.</p>
            </div>
            <div class="field spaced">
              <label class="label">Repetir la contraseña</label>
              <p class="control icons-left">
                <input class="input" type="password" name="clave_repetida" minlength="8" autocomplete="new-password" required>
                <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
              </p>
            </div>
            <hr>
            <div class="field grouped">
              <div class="control"><button type="submit" class="button blue">Guardar contraseña</button></div>
              <div class="control"><a href="<?= BASE ?>/admin/login.php" class="button">Cancelar</a></div>
            </div>
          </form>
        <?php endif; ?>
      </div>
    </div>
  </section>
</div>
<script>const BASE = <?= json_encode(BASE) ?>;</script>
<script src="<?= BASE ?>/admin/vistas/scripts/comun.js"></script>
<script src="<?= BASE ?>/admin/vistas/scripts/nueva-clave.js"></script>
</body>
</html>
