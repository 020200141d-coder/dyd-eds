<?php
/**
 * Cabecera del sitio publico. Solo pinta HTML; cada pagina define antes de
 * incluirla: $tituloPagina, $tituloBreadcrumb y, para buscadores y redes,
 * $metaDescripcion, $metaImagen y $metaTipo.
 */
require_once __DIR__ . '/../base.php';
require_once __DIR__ . '/funciones.php';

$sitio = 'DDP Noticias - Diálogo y Desarrollo Perú';
$titulo = $tituloPagina ?? $sitio;
$descripcion = resumir($metaDescripcion ?? 'Periodismo independiente sobre mineria, canon, territorio y dialogo en el Peru.', 160);

// Direccion completa de esta pagina: la piden los buscadores y las redes
// sociales, que no entienden rutas relativas.
$esquema = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
$dominio = $_SERVER['HTTP_HOST'] ?? 'localhost';
$urlActual = $esquema . '://' . $dominio . ($_SERVER['REQUEST_URI'] ?? '/');
$urlImagen = $esquema . '://' . $dominio . ($metaImagen ?? BASE . '/assets/images/logo.png');
?><!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?= htmlspecialchars($titulo) ?></title>

  <meta name="description" content="<?= htmlspecialchars($descripcion) ?>">
  <link rel="canonical" href="<?= htmlspecialchars($urlActual) ?>">

  <meta property="og:site_name" content="<?= htmlspecialchars($sitio) ?>">
  <meta property="og:locale" content="es_PE">
  <meta property="og:type" content="<?= htmlspecialchars($metaTipo ?? 'website') ?>">
  <meta property="og:title" content="<?= htmlspecialchars($titulo) ?>">
  <meta property="og:description" content="<?= htmlspecialchars($descripcion) ?>">
  <meta property="og:url" content="<?= htmlspecialchars($urlActual) ?>">
  <meta property="og:image" content="<?= htmlspecialchars($urlImagen) ?>">

  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="<?= htmlspecialchars($titulo) ?>">
  <meta name="twitter:description" content="<?= htmlspecialchars($descripcion) ?>">
  <meta name="twitter:image" content="<?= htmlspecialchars($urlImagen) ?>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;700&family=Google+Sans:wght@400;500;700&display=swap">
  <link rel="stylesheet" href="<?= BASE ?>/assets/css/iconos.css">
  <link rel="stylesheet" href="<?= BASE ?>/assets/css/style-starter.css">
  <link rel="stylesheet" href="<?= BASE ?>/assets/css/sitio.css">

  <!-- Va en la cabecera y no al final: el onerror de las miniaturas se
       dispara mientras el navegador lee el HTML, antes de llegar al pie. -->
  <script src="<?= BASE ?>/assets/js/miniaturas.js"></script>
</head>
<body>
<header id="site-header" class="fixed-top">
  <div class="container">
    <nav class="navbar navbar-expand-lg stroke">
      <a class="navbar-brand" href="<?= BASE ?>/index.php">
        <img src="<?= BASE ?>/assets/images/logo.png" alt="Diálogo y Desarrollo Perú" title="Diálogo y Desarrollo Perú" style="height:75px;">
      </a>
      <button class="navbar-toggler collapsed bg-gradient" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
        <span class="navbar-toggler-icon fa icon-close fa-times"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/index.php">Inicio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/index.php#actualidad">Actualidad</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/reportajes.php">Reportajes</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/podcast.php">Podcast</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/boletines.php">Boletín NTEP</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?= BASE ?>/videos.php">Videos</a>
          </li>
          <li class="ml-2">
            <a href="<?= BASE ?>/index.php#footer" class="btn btn-style btn-outline-secondary">Contacto</a>
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
