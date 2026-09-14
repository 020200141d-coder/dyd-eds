<?php
require_once __DIR__ . '/clases/Reportaje.php';
require_once __DIR__ . '/clases/Noticia.php';
require_once __DIR__ . '/clases/Boletin.php';
require_once __DIR__ . '/clases/Podcast.php';
require_once __DIR__ . '/clases/Video.php';

$destacado = Reportaje::mostrar_destacado();
$otrosReportajes = Reportaje::mostrar_todos(1, $destacado['id'] ?? null);
$otrosReportajes = array_slice($otrosReportajes, 0, 3);

$noticias = Noticia::mostrar_recientes(3);
$boletin = Boletin::mostrar_ultimo();
$podcasts = Podcast::mostrar_recientes(4);
$videos = Video::mostrar_recientes(4);

$tituloPagina = 'DDP Noticias - Diálogo y Desarrollo Perú';
$metaDescripcion = 'Periodismo independiente sobre minería, canon, territorio y diálogo en el Perú: reportajes, boletines NTEP, podcast y videos.';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="breadcrumb-area py-sm-5 py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="breadcrumb-contents">
          <h2 class="title-big">Reportajes</h2>
        </div>
      </div>
    </div>
  </div>
</section>

<?php if ($destacado): ?>
<section class="w3l-video w3l-homeblock3" id="video">
  <div class="container-fluid">
    <div class="video-grids-info row">
      <div class="video-gd-right col-lg-6 p-0">
        <div class="position-relative">
          <a href="<?= BASE ?>/reportaje.php?id=<?= (int) $destacado['id'] ?>">
            <span class="foto-marca">
              <?php if (!empty($destacado['foto_principal'])): ?>
                <img src="<?= BASE ?>/admin/files/reportajes/<?= htmlspecialchars($destacado['foto_principal']) ?>" alt="<?= htmlspecialchars($destacado['titulo']) ?>" class="img-fluid">
              <?php else: ?>
                <img src="<?= BASE ?>/assets/images/video.jpg" alt="" class="img-fluid">
              <?php endif; ?>
            </span>
          </a>
        </div>
      </div>
      <div class="video-gd-left col-lg-6 p-lg-5 p-4 align-self">
        <div class="p-xl-4 p-0 video-wrap">
          <h5><?= date('d/m/Y', strtotime($destacado['fecha_publicacion'])) ?></h5>
          <h3 class="title-big text-left mb-4"><a href="<?= BASE ?>/reportaje.php?id=<?= (int) $destacado['id'] ?>"><?= htmlspecialchars($destacado['titulo']) ?></a></h3>
          <p><?= htmlspecialchars($destacado['resumen_corto'] ?? '') ?></p>
          <a href="<?= BASE ?>/reportaje.php?id=<?= (int) $destacado['id'] ?>" class="btn mt-4 p-0">Leer <span class="fa fa-arrow-right"></span></a>
        </div>
      </div>
    </div>
  </div>
</section>
<?php endif; ?>

<div class="grids-block-5 py-1">
  <section class="py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <?php if (!$otrosReportajes): ?>
          <p class="text-center w-100">Todavía no hay más reportajes publicados.</p>
        <?php endif; ?>
        <?php foreach ($otrosReportajes as $reportaje): ?>
          <?php require __DIR__ . '/partials/tarjeta.php'; ?>
        <?php endforeach; ?>
      </div>
      <div class="pagination">
        <ul><li><a href="<?= BASE ?>/reportajes.php">Ver todos</a></li></ul>
      </div>
    </div>
  </section>
</div>

<section class="breadcrumb-area py-sm-5 py-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="breadcrumb-contents">
          <h2 class="title-big">Noticias Recientes</h2><a class="anchor" id="actualidad"></a>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="grids-block-5 py-5">
  <section class="py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <?php if (!$noticias): ?>
          <p class="text-center w-100">Todavía no hay noticias registradas.</p>
        <?php endif; ?>
        <?php foreach ($noticias as $noticia): ?>
          <div class="col-lg-4 col-md-6 grids5-info mt-lg-0 mt-5">
            <a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="d-block">
              <?php if (!empty($noticia['foto'])): ?>
                  <img src="<?= BASE ?>/admin/files/noticias/<?= htmlspecialchars($noticia['foto']) ?>" alt="<?= htmlspecialchars($noticia['titulo']) ?>" class="img-fluid">
              <?php endif; ?>
            </a>
            <div class="blog-info">
              <h5><?= date('d/m/Y', strtotime($noticia['fecha_publicacion'])) ?></h5>
              <h4><a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="d-block"><?= htmlspecialchars($noticia['titulo']) ?></a></h4>
              <a target="_blank" href="<?= htmlspecialchars($noticia['link_externo'] ?? '#') ?>" class="btn mt-4 p-0">Leer <span class="fa fa-arrow-right"></span></a>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </section>
</div>

<?php if ($boletin): ?>
<section class="w3l-homeblock5 py-0">
  <div class="container py-lg-5 py-4">
    <div class="row">
      <div class="col-lg-8 align-self">
        <h3 class="title-big mb-4">Boletín NTEP</h3>
        <p><?= htmlspecialchars($boletin['resumen'] ?? '') ?></p>
        <div class="row mt-sm-4 mt-2 px-3">
          <div class="col-6 p-0">
            <span>Nº <?= htmlspecialchars($boletin['numero_boletin']) ?></span>
            <h4><?= date('d/m/Y', strtotime($boletin['fecha_publicacion'])) ?></h4>
          </div>
          <div class="col-6 p-0">
            <span><a target="_blank" href="<?= BASE ?>/admin/files/boletines/pdf/<?= htmlspecialchars($boletin['archivo_pdf']) ?>" class="facebook"><span class="fa fa-download"></span></a></span>
            <h4>Ver Boletín</h4>
          </div>
          <center><a href="<?= BASE ?>/boletines.php" class="btn btn-style btn-primary mt-md-5 mt-4">Ver todos</a></center>
        </div>
      </div>
      <div class="col-lg-4 mt-lg-0 mt-4">
        <?php if (!empty($boletin['foto_portada'])): ?>
          <img src="<?= BASE ?>/admin/files/boletines/portada/<?= htmlspecialchars($boletin['foto_portada']) ?>" class="img-fluid radius-image" alt="">
        <?php endif; ?>
      </div>
    </div>
  </div>
</section>
<?php endif; ?>

<section class="w3l-homeblock3 py-5">
  <div class="container py-lg-5 py-md-4">
    <h3 class="title-big mb-5 text-center">Podcast</h3>
    <div class="row fila-tarjetas">
      <?php if (!$podcasts): ?>
        <p class="text-center w-100">Todavía no hay podcasts publicados.</p>
      <?php endif; ?>
      <?php foreach ($podcasts as $podcast): ?>
        <div class="col-lg-3 col-sm-6 mt-sm-0 mt-5">
          <div class="area-box">
            <?= tarjetaMedia($podcast['url_embed'], BASE . '/assets/images/podcast.png', $podcast['titulo'], BASE . '/podcast.php', 'cuadrada') ?>
            <p><a href="<?= BASE ?>/podcast.php"><?= htmlspecialchars($podcast['titulo']) ?></a></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
    <center><a href="<?= BASE ?>/podcast.php" class="btn btn-style btn-primary mt-md-5 mt-4">Ver todos</a></center>
  </div>
</section>

<section class="w3l-homeblock3 py-5" id="videos">
  <div class="container py-lg-5 py-md-4">
    <h3 class="title-big mb-5 text-center">Videos</h3>
    <div class="row fila-tarjetas">
      <?php if (!$videos): ?>
        <p class="text-center w-100">Todavía no hay videos publicados.</p>
      <?php endif; ?>
      <?php foreach ($videos as $video): ?>
        <div class="col-lg-3 col-sm-6 mt-sm-0 mt-5">
          <div class="area-box">
            <?= tarjetaMedia($video['url_embed'], BASE . '/assets/images/video.jpg', $video['titulo'], BASE . '/videos.php') ?>
            <p><a href="<?= BASE ?>/videos.php"><?= htmlspecialchars($video['titulo']) ?></a></p>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
    <center><a href="<?= BASE ?>/videos.php" class="btn btn-style btn-primary mt-md-5 mt-4">Ver todos</a></center>
  </div>
</section>

<section class="w3l-team" id="team">
  <div class="teams1 py-5 mb-3">
    <div class="container py-lg-3 pb-lg-5 pb-4">
      <div class="teams1-content">
        <h3 class="title-big text-center mb-5">Especiales</h3>
        <div class="owl-carousel owl-theme text-center">
          <div class="item">
            <div class="d-grid team-info">
              <div class="column position-relative">
                <img src="<?= BASE ?>/assets/images/team2.jpg" alt="" class="img-fluid rounded team-image">
              </div>
              <div class="column"><p>Por una minería artesanal segura para todos</p></div>
            </div>
          </div>
          <div class="item">
            <div class="d-grid team-info">
              <div class="column position-relative">
                <img src="<?= BASE ?>/assets/images/team3.jpg" alt="" class="img-fluid rounded team-image">
              </div>
              <div class="column"><p>REINFO Días decisivos en el Congreso</p></div>
            </div>
          </div>
          <div class="item">
            <div class="d-grid team-info">
              <div class="column position-relative">
                <img src="<?= BASE ?>/assets/images/team4.jpg" alt="" class="img-fluid rounded team-image">
              </div>
              <div class="column"><p>La minería ilegal: un negocio rentable para bandas criminales</p></div>
            </div>
          </div>
          <div class="item">
            <div class="d-grid team-info">
              <div class="column position-relative">
                <img src="<?= BASE ?>/assets/images/team5.jpg" alt="" class="img-fluid rounded team-image">
              </div>
              <div class="column"><p>El problema del REINFO y la minería ilegal en 50 segundos</p></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="w3l-banner py-0" id="work">
  <div class="midd-w3 py-lg-4 py-md-3">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 mt-lg-0 mt-lg-5 about-right-faq align-self">
          <h5 class="title-small mb-2">DDP Noticias</h5>
          <h3 class="title-banner">Diálogo y Desarrollo Perú</h3>
          <p class="mt-4">Somos un espacio de periodismo independiente que busca visibilizar las acciones de diálogo en el país desde una mirada constructiva.</p>
        </div>
        <div class="col-md-6 left-wthree-img mt-lg-0 mt-4">
          <div class="position-relative">
            <img src="<?= BASE ?>/assets/images/bannerimg.jpg" alt="" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
