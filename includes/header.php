<?php
/**
 * Requiere que antes de incluir este archivo se hayan definido:
 *   $pageTitle   (string) título de la sección
 *   $activeMenu  (string) clave del menú activo: dashboard|reportajes|noticias|boletines|podcasts|videos|autores|usuarios
 * Y que includes/auth.php ya haya sido incluido (para requireLogin/basePath/currentUser).
 */
$base = basePath();
$user = currentUser();

$menuItems = [
    'dashboard'  => ['label' => 'Dashboard',  'icon' => 'mdi-desktop-mac',      'href' => $base . '/index.php'],
    'reportajes' => ['label' => 'Reportajes', 'icon' => 'mdi-newspaper-variant', 'href' => $base . '/reportajes/index.php'],
    'noticias'   => ['label' => 'Noticias',   'icon' => 'mdi-flash',            'href' => $base . '/noticias/index.php'],
    'boletines'  => ['label' => 'Boletines',  'icon' => 'mdi-file-pdf-box',     'href' => $base . '/boletines/index.php'],
    'podcasts'   => ['label' => 'Podcasts',   'icon' => 'mdi-microphone',       'href' => $base . '/podcasts/index.php'],
    'videos'     => ['label' => 'Videos',     'icon' => 'mdi-video',            'href' => $base . '/videos/index.php'],
    'autores'    => ['label' => 'Autores',    'icon' => 'mdi-account-edit',     'href' => $base . '/autores/index.php'],
    'invitados'  => ['label' => 'Invitados',  'icon' => 'mdi-account-star',     'href' => $base . '/invitados/index.php'],
    'usuarios'   => ['label' => 'Usuarios',   'icon' => 'mdi-account-multiple', 'href' => $base . '/usuarios/index.php'],
];
?><!DOCTYPE html>
<html lang="es" class="">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= e($pageTitle) ?> - Panel Revista Digital</title>
  <link rel="stylesheet" href="<?= e($base) ?>/assets/css/main.css">
  <link rel="apple-touch-icon" sizes="180x180" href="<?= e($base) ?>/assets/img/apple-touch-icon.png"/>
  <link rel="icon" type="image/png" sizes="32x32" href="<?= e($base) ?>/assets/img/favicon-32x32.png"/>
  <link rel="icon" type="image/png" sizes="16x16" href="<?= e($base) ?>/assets/img/favicon-16x16.png"/>
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</head>
<body>
<div id="app">

<nav id="navbar-main" class="navbar is-fixed-top">
  <div class="navbar-brand">
    <a class="navbar-item mobile-aside-button">
      <span class="icon"><i class="mdi mdi-forwardburger mdi-24px"></i></span>
    </a>
  </div>
  <div class="navbar-brand is-right">
    <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
      <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
    </a>
  </div>
  <div class="navbar-menu" id="navbar-menu">
    <div class="navbar-end">
      <div class="navbar-item dropdown has-divider has-user-avatar">
        <a class="navbar-link">
          <div class="user-avatar">
            <img src="https://avatars.dicebear.com/v2/initials/<?= e($user['nombres'] ?? 'admin') ?>.svg" alt="Usuario" class="rounded-full">
          </div>
          <div class="is-user-name"><span><?= e(($user['nombres'] ?? '') . ' ' . ($user['ap_paterno'] ?? '')) ?></span></div>
          <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
        </a>
        <div class="navbar-dropdown">
          <a href="<?= e($base) ?>/usuarios/perfil.php" class="navbar-item">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>Mi perfil</span>
          </a>
          <hr class="navbar-divider">
          <a href="<?= e($base) ?>/logout.php" class="navbar-item">
            <span class="icon"><i class="mdi mdi-logout"></i></span>
            <span>Cerrar sesión</span>
          </a>
        </div>
      </div>
      <a href="<?= e($base) ?>/logout.php" title="Cerrar sesión" class="navbar-item desktop-icon-only">
        <span class="icon"><i class="mdi mdi-logout"></i></span>
        <span>Salir</span>
      </a>
    </div>
  </div>
</nav>

<aside class="aside is-placed-left is-expanded">
  <div class="aside-tools">
    <div>
      Revista <b class="font-black">NTEP</b>
    </div>
  </div>
  <div class="menu is-menu-main">
    <p class="menu-label">General</p>
    <ul class="menu-list">
      <li class="<?= $activeMenu === 'dashboard' ? 'active' : '' ?>">
        <a href="<?= e($menuItems['dashboard']['href']) ?>">
          <span class="icon"><i class="mdi <?= $menuItems['dashboard']['icon'] ?>"></i></span>
          <span class="menu-item-label">Dashboard</span>
        </a>
      </li>
    </ul>
    <p class="menu-label">Contenido</p>
    <ul class="menu-list">
      <?php foreach (['reportajes', 'noticias', 'boletines', 'podcasts', 'videos', 'autores', 'invitados'] as $key): ?>
      <li class="<?= $activeMenu === $key ? 'active' : '' ?>">
        <a href="<?= e($menuItems[$key]['href']) ?>">
          <span class="icon"><i class="mdi <?= $menuItems[$key]['icon'] ?>"></i></span>
          <span class="menu-item-label"><?= e($menuItems[$key]['label']) ?></span>
        </a>
      </li>
      <?php endforeach; ?>
    </ul>
    <?php if (($user['rol'] ?? '') === 'admin'): ?>
    <p class="menu-label">Administración</p>
    <ul class="menu-list">
      <li class="<?= $activeMenu === 'usuarios' ? 'active' : '' ?>">
        <a href="<?= e($menuItems['usuarios']['href']) ?>">
          <span class="icon"><i class="mdi <?= $menuItems['usuarios']['icon'] ?>"></i></span>
          <span class="menu-item-label">Usuarios</span>
        </a>
      </li>
    </ul>
    <?php endif; ?>
  </div>
</aside>

<section class="is-title-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <ul>
      <li>Admin</li>
      <li><?= e($pageTitle) ?></li>
    </ul>
  </div>
</section>

<section class="is-hero-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <h1 class="title"><?= e($pageTitle) ?></h1>
  </div>
</section>

<section class="section main-section">
  <?php foreach (getFlashes() as $flash): ?>
    <div class="notification <?= $flash['type'] === 'error' ? 'red' : 'green' ?> mb-6">
      <div class="flex items-center justify-between">
        <div><?= e($flash['message']) ?></div>
      </div>
    </div>
  <?php endforeach; ?>
