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
        <div id="bloquePregunta">
        <p class="mb-4"><b>Responder mi pregunta de seguridad</b></p>
        <p class="mb-4 has-text-grey">
          Es la que se definió al crear la cuenta. Es la forma más directa de
          recuperar el acceso: no depende del correo.
        </p>

        <form id="formPregunta" class="mb-6">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="email" id="campoEmailPregunta" placeholder="tucorreo@dyd.com" autocomplete="username" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>

          <div id="cajaPregunta" hidden>
            <div class="field spaced">
              <label class="label" id="textoPregunta"></label>
              <div class="control icons-left">
                <input class="input" type="text" name="respuesta" id="campoRespuesta" autocomplete="off" spellcheck="false">
                <span class="icon is-small left"><i class="mdi mdi-key"></i></span>
              </div>
              <p class="help">No distingue mayúsculas ni espacios de más.</p>
            </div>
          </div>

          <div class="field grouped">
            <div class="control"><button type="submit" class="button green" id="btnPregunta">Continuar</button></div>
            <div class="control"><a href="<?= BASE ?>/admin/login.php" class="button">Volver</a></div>
          </div>
        </form>
        </div>

        <hr id="separadorPregunta">

        <div id="bloqueCodigo">
        <p class="mb-4"><b>Tengo mi código de recuperación</b></p>
        <p class="mb-4 has-text-grey">
          Es el que generaste desde "Mi perfil" y guardaste. Sirve una sola vez.
        </p>
        <p class="mb-4 has-text-grey">
          ¿No tienes uno? No se envía ni aparece solo: se genera desde el panel,
          en "Mi perfil", mientras todavía puedes entrar. Guárdalo para el día
          que lo necesites.
        </p>

        <form id="formCodigo" class="mb-6">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="email" id="campoEmailCodigo" placeholder="tucorreo@dyd.com" autocomplete="username" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>
          <div class="field spaced">
            <label class="label">Código de recuperación</label>
            <div class="control icons-left">
              <input class="input" type="text" name="codigo" id="campoCodigo" placeholder="ABCDE-FGHJK-LMNPQ-RSTUV"
                     autocomplete="one-time-code" spellcheck="false" required>
              <span class="icon is-small left"><i class="mdi mdi-key"></i></span>
            </div>
          </div>
          <div class="field grouped">
            <div class="control"><button type="submit" class="button green">Continuar</button></div>
            <div class="control"><a href="<?= BASE ?>/admin/login.php" class="button">Volver</a></div>
          </div>
        </form>
        </div>

        <hr id="separadorOpciones">

        <div id="bloqueEnlace">
        <p class="mb-4"><b>No tengo código</b></p>
        <p class="mb-4 has-text-grey">
          Se genera un enlace y se envía al correo de la cuenta. Ojo: muchos
          alojamientos gratuitos no permiten enviar correo, y en ese caso el
          mensaje no llega. Si es tu caso, pídele a otro administrador que te
          cambie la contraseña desde el panel.
        </p>

        <form id="formRecuperar">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="email" id="campoEmail" placeholder="tucorreo@dyd.com" autocomplete="username" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>
          <div class="field grouped">
            <div class="control"><button type="submit" class="button blue">Enviar enlace</button></div>
          </div>
        </form>
        </div>

        <div id="resultado" hidden>
          <div class="notification green">
            <p id="mensajeResultado"></p>
          </div>
          <div id="cajaEnlace" hidden>
            <p class="mb-2"><b>Enlace para restablecer la contraseña:</b></p>
            <p class="mb-2"><a id="enlaceRecuperacion" href="#"></a></p>
            <p class="has-text-grey">
              Este enlace se muestra porque el proyecto está corriendo en tu
              propia computadora, donde no hay correo saliente. Publicado en
              internet no aparece: se envía por correo. Vence en una hora y
              sirve una sola vez.
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
