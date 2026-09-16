<?php
/**
 * Sobre D&D. En el sitio real este enlace del menu apunta a contact.html,
 * que no existe y devuelve 404; aqui es una pagina de verdad.
 *
 * El texto es el mismo que la portada y el pie ya usan para presentar al
 * medio, reunido en un solo lugar en vez de repartido en dos frases.
 */
require_once __DIR__ . '/clases/Reportaje.php';
require_once __DIR__ . '/clases/Boletin.php';

$totalReportajes = count(Reportaje::mostrar_todos());
$totalBoletines = count(Boletin::mostrar_todos());

$tituloPagina = 'Sobre D&D - DDP Noticias';
$metaDescripcion = 'Diálogo y Desarrollo Perú es un espacio de periodismo independiente que visibiliza las acciones de diálogo en el país desde una mirada constructiva.';
$tituloBreadcrumb = 'Sobre D&D';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container py-lg-4">
    <div class="row">
      <div class="col-lg-7 pr-lg-5">
        <h3 class="title-big mb-4">Quiénes somos</h3>
        <div class="reportaje-cuerpo">
          <p>Somos un espacio de periodismo independiente que busca visibilizar las
             acciones de diálogo en el país desde una mirada constructiva.</p>

          <p>Trabajamos sobre los temas que atraviesan a las regiones del Perú:
             minería informal e ilegal, canon y regalías, uso de los recursos
             públicos, territorio, comunidades y medio ambiente. No nos quedamos
             en el conflicto: buscamos también los acuerdos, las salidas y las
             experiencias que sí funcionan.</p>

          <h2>Qué publicamos</h2>
          <ul>
            <li><b>Reportajes</b> de investigación y contexto, con datos verificados
                y fuentes citadas. Llevamos <?= (int) $totalReportajes ?> publicados.</li>
            <li><b>Boletín NTEP</b> («No Todo Está Perdido»), que recoge en PDF las
                buenas noticias de las regiones. Van <?= (int) $totalBoletines ?> ediciones.</li>
            <li><b>Podcast y videos</b>, para explicar en pocos minutos temas que
                de otro modo quedarían solo en el papel.</li>
            <li><b>Actualidad</b>, con las notas del día y su enlace al medio de origen.</li>
          </ul>

          <h2>Cómo trabajamos</h2>
          <p>Cada publicación se contrasta antes de salir y se firma con su fecha.
             Cuando el material de origen es un documento público, un registro
             oficial o una base de datos, lo decimos en la nota para que cualquiera
             pueda revisarlo por su cuenta.</p>

          <p>Si encuentras un error en algo que publicamos, escríbenos: lo
             corregimos y lo dejamos indicado.</p>
        </div>

        <a href="<?= BASE ?>/contacto.php" class="btn btn-style btn-primary mt-4">Escríbenos</a>
      </div>

      <div class="col-lg-5 mt-lg-0 mt-5">
        <img src="<?= BASE ?>/assets/images/bannerimg.jpg" alt="Diálogo y Desarrollo Perú" class="img-fluid radius-image">

        <div class="mt-4">
          <h5 class="title-small mb-2">DDP Noticias</h5>
          <h4 class="mb-3">Diálogo y Desarrollo Perú</h4>
          <ul class="pl-0" style="list-style:none">
            <li class="mb-2"><a href="<?= BASE ?>/reportajes.php">Ver todos los reportajes</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/boletines.php">Ver el Boletín NTEP</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/alianzas.php">Trabaja con nosotros: alianzas</a></li>
            <li class="mb-2"><a href="<?= BASE ?>/contacto.php">Contacto</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
