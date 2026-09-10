<?php
/**
 * Cabecera común de las vistas del panel. No consulta la base de datos:
 * solo pinta con lo que ya trae la sesión ($usuario) y variables que
 * define la vista antes de incluir este archivo ($tituloPagina, $menuActivo).
 */
$usuario = usuarioActual();

$itemsMenu = [
    'dashboard'  => ['etiqueta' => 'Dashboard',  'icono' => 'mdi-desktop-mac',      'href' => '/dyd-eds/admin/index.php'],
    'reportajes' => ['etiqueta' => 'Reportajes', 'icono' => 'mdi-newspaper-variant', 'href' => '/dyd-eds/admin/vistas/reportajes.php'],
    'noticias'   => ['etiqueta' => 'Noticias',   'icono' => 'mdi-flash',            'href' => '/dyd-eds/admin/vistas/noticias.php'],
    'boletines'  => ['etiqueta' => 'Boletines',  'icono' => 'mdi-file-pdf-box',     'href' => '/dyd-eds/admin/vistas/boletines.php'],
    'podcasts'   => ['etiqueta' => 'Podcasts',   'icono' => 'mdi-microphone',       'href' => '/dyd-eds/admin/vistas/podcasts.php'],
    'videos'     => ['etiqueta' => 'Videos',     'icono' => 'mdi-video',            'href' => '/dyd-eds/admin/vistas/videos.php'],
    'autores'    => ['etiqueta' => 'Autores',    'icono' => 'mdi-account-edit',     'href' => '/dyd-eds/admin/vistas/autores.php'],
    'usuarios'   => ['etiqueta' => 'Usuarios',   'icono' => 'mdi-account-multiple', 'href' => '/dyd-eds/admin/vistas/usuarios.php'],
];
?><!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= htmlspecialchars($tituloPagina) ?> - Panel Revista Digital</title>
  <link rel="stylesheet" href="/dyd-eds/assets/css/main.css">
  <link rel="icon" type="image/png" sizes="32x32" href="/dyd-eds/assets/img/favicon-32x32.png"/>
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
            <img src="https://avatars.dicebear.com/v2/initials/<?= htmlspecialchars($usuario['nombre_completo'] ?? 'admin') ?>.svg" alt="Usuario" class="rounded-full">
          </div>
          <div class="is-user-name"><span><?= htmlspecialchars($usuario['nombre_completo'] ?? '') ?></span></div>
          <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
        </a>
        <div class="navbar-dropdown">
          <a href="/dyd-eds/admin/vistas/perfil.php" class="navbar-item">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>Mi perfil</span>
          </a>
          <hr class="navbar-divider">
          <a href="/dyd-eds/admin/logout.php" class="navbar-item">
            <span class="icon"><i class="mdi mdi-logout"></i></span>
            <span>Cerrar sesión</span>
          </a>
        </div>
      </div>
      <a href="/dyd-eds/admin/logout.php" title="Cerrar sesión" class="navbar-item desktop-icon-only">
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
      <li class="<?= $menuActivo === 'dashboard' ? 'active' : '' ?>">
        <a href="<?= $itemsMenu['dashboard']['href'] ?>">
          <span class="icon"><i class="mdi <?= $itemsMenu['dashboard']['icono'] ?>"></i></span>
          <span class="menu-item-label">Dashboard</span>
        </a>
      </li>
    </ul>
    <p class="menu-label">Contenido</p>
    <ul class="menu-list">
      <?php foreach (['reportajes', 'noticias', 'boletines', 'podcasts', 'videos', 'autores'] as $clave): ?>
      <li class="<?= $menuActivo === $clave ? 'active' : '' ?>">
        <a href="<?= $itemsMenu[$clave]['href'] ?>">
          <span class="icon"><i class="mdi <?= $itemsMenu[$clave]['icono'] ?>"></i></span>
          <span class="menu-item-label"><?= $itemsMenu[$clave]['etiqueta'] ?></span>
        </a>
      </li>
      <?php endforeach; ?>
    </ul>
    <?php if (($usuario['rol'] ?? '') === 'admin'): ?>
    <p class="menu-label">Administración</p>
    <ul class="menu-list">
      <li class="<?= $menuActivo === 'usuarios' ? 'active' : '' ?>">
        <a href="<?= $itemsMenu['usuarios']['href'] ?>">
          <span class="icon"><i class="mdi <?= $itemsMenu['usuarios']['icono'] ?>"></i></span>
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
      <li><?= htmlspecialchars($tituloPagina) ?></li>
    </ul>
  </div>
</section>

<section class="is-hero-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <h1 class="title"><?= htmlspecialchars($tituloPagina) ?></h1>
  </div>
</section>

<section class="section main-section">
  <div id="aviso" class="notification mb-6" hidden></div>
