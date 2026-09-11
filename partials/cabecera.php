<?php
/**
 * Cabecera del sitio publico. Solo pinta HTML; $tituloBreadcrumb lo define
 * cada pagina antes de incluir este archivo.
 */
?><!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?= htmlspecialchars($tituloPagina ?? 'DDP Noticias - Diálogo y Desarrollo Perú') ?></title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;700&family=Google+Sans:wght@400;500;700&display=swap">
  <link rel="stylesheet" href="/dyd-eds/assets/css/iconos.css">
  <link rel="stylesheet" href="/dyd-eds/assets/css/style-starter.css">
</head>
<body>
<header id="site-header" class="fixed-top">
  <div class="container">
    <nav class="navbar navbar-expand-lg stroke">
      <a class="navbar-brand" href="/dyd-eds/index.php">
        <img src="/dyd-eds/assets/images/logo.png" alt="Diálogo y Desarrollo Perú" title="Diálogo y Desarrollo Perú" style="height:75px;">
      </a>
      <button class="navbar-toggler collapsed bg-gradient" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
        <span class="navbar-toggler-icon fa icon-close fa-times"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/index.php">Inicio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/index.php#actualidad">Actualidad</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/reportajes.php">Reportajes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/podcast.php">Podcast</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/boletines.php">Boletín NTEP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/dyd-eds/videos.php">Videos</a>
          </li>
          <li class="ml-2">
            <a href="/dyd-eds/index.php#footer" class="btn btn-style btn-outline-secondary">Contacto</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</header>

<?php if (!empty($tituloBreadcrumb)): ?>
<section class="breadcrumb-area py-sm-5 py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="breadcrumb-contents">
          <h2 class="title-big"><?= htmlspecialchars($tituloBreadcrumb) ?></h2>
        </div>
      </div>
    </div>
  </div>
</section>
<?php endif; ?>
