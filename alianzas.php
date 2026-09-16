<?php
/**
 * Alianzas. En el sitio real este enlace del menu apunta a about.html, que
 * no existe y devuelve 404; aqui es una pagina de verdad.
 */

$tituloPagina = 'Alianzas - DDP Noticias';
$metaDescripcion = 'Trabajamos con medios regionales, organizaciones y universidades para llevar más lejos los reportajes sobre minería, canon y territorio.';
$tituloBreadcrumb = 'Alianzas';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container py-lg-4">
    <div class="row">
      <div class="col-lg-8 pr-lg-5">
        <h3 class="title-big mb-4">Trabajemos juntos</h3>
        <div class="reportaje-cuerpo">
          <p>Los temas que cubrimos —minería informal e ilegal, canon y regalías,
             territorio y comunidades— no se agotan en una sola redacción. Por eso
             buscamos aliados que quieran llevarlos más lejos.</p>

          <h2>Qué ofrecemos</h2>
          <ul>
            <li><b>Republicación libre.</b> Nuestros reportajes pueden reproducirse
                sin costo citando a Diálogo y Desarrollo Perú y enlazando la nota
                original.</li>
            <li><b>Trabajo conjunto.</b> Podemos investigar en coautoría con medios
                regionales que conocen su zona mejor que nadie.</li>
            <li><b>Material de consulta.</b> Las ediciones del Boletín NTEP y los
                datos que reunimos quedan disponibles para quien los necesite.</li>
            <li><b>Charlas y talleres.</b> Compartimos con estudiantes y colectivos
                cómo seguimos la ruta del dinero público y los registros mineros.</li>
          </ul>

          <h2>Con quiénes</h2>
          <ul>
            <li><b>Medios regionales y locales</b> que cubren las mismas zonas.</li>
            <li><b>Organizaciones de la sociedad civil</b> que trabajan en ambiente,
                transparencia y derechos de las comunidades.</li>
            <li><b>Universidades y centros de investigación</b>, para contrastar
                datos y formar a quienes recién empiezan en el oficio.</li>
          </ul>

          <h2>Cómo empezar</h2>
          <p>Escríbenos contando quién eres, qué haces y qué tienes en mente. Si es
             una propuesta de republicación, dinos qué nota te interesa; si es una
             investigación conjunta, cuéntanos sobre qué región o qué caso.</p>
        </div>

        <a href="<?= BASE ?>/contacto.php" class="btn btn-style btn-primary mt-4">Proponer una alianza</a>
      </div>

      <div class="col-lg-4 mt-lg-0 mt-5">
        <div class="blog-info">
          <h4 class="mb-3">Antes de escribir</h4>
          <p>Revisa lo que venimos publicando: así tu propuesta llega con contexto
             y avanzamos más rápido.</p>
          <ul class="pl-0 mt-4" style="list-style:none">
            <li class="mb-2"><a href="<?= BASE ?>/reportajes.php">Reportajes</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/boletines.php">Boletín NTEP</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/podcast.php">Podcast</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/videos.php">Videos</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/sobre.php">Sobre D&amp;D</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
