<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/auth.php';

if (currentUser()) {
    redirect(basePath() . '/index.php');
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['login'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($email === '' || $password === '') {
        $error = 'Ingresa tu correo y contraseña.';
    } else {
        $stmt = getPDO()->prepare('SELECT * FROM usuarios WHERE email = ? LIMIT 1');
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password_hash'])) {
            unset($user['password_hash']);
            $_SESSION['user'] = $user;
            redirect(basePath() . '/index.php');
        } else {
            $error = 'Credenciales incorrectas.';
        }
    }
}

$base = basePath();
?><!DOCTYPE html>
<html lang="es" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Iniciar sesión - Panel Revista Digital</title>
  <link rel="stylesheet" href="<?= e($base) ?>/assets/css/main.css">
  <link rel="icon" type="image/png" sizes="32x32" href="<?= e($base) ?>/assets/img/favicon-32x32.png"/>
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</head>
<body>
<div id="app">
  <section class="section main-section">
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          Panel Revista Digital
        </p>
      </header>
      <div class="card-content">
        <?php if ($error): ?>
          <div class="notification red mb-6"><?= e($error) ?></div>
        <?php endif; ?>
        <form method="post">
          <div class="field spaced">
            <label class="label">Correo</label>
            <div class="control icons-left">
              <input class="input" type="email" name="login" placeholder="admin@dyd.com" autocomplete="username" value="<?= e($_POST['login'] ?? '') ?>" required>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
          </div>
          <div class="field spaced">
            <label class="label">Contraseña</label>
            <p class="control icons-left">
              <input class="input" type="password" name="password" placeholder="Contraseña" autocomplete="current-password" required>
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
</body>
</html>
