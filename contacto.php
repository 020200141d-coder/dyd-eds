<?php
/**
 * Contacto. En el menu del sitio real este boton apunta a "#btn", un ancla
 * vacia que no lleva a ninguna parte; aqui es una pagina de verdad.
 *
 * Reune lo que hasta ahora solo estaba suelto en el pie de la portada: el
 * correo y las redes. La pagina no manda formularios: el sitio publico es
 * de solo lectura por diseno, asi que el contacto sale por correo.
 */

$tituloPagina = 'Contacto - DDP Noticias';
$metaDescripcion = 'Escríbenos a info@dialogoydesarrollo.com.pe o búscanos en Facebook, TikTok e Instagram.';
$tituloBreadcrumb = 'Contacto';
require __DIR__ . '/partials/cabecera.php';
?>

<section class="py-5">
  <div class="container py-lg-4">
    <div class="row">
      <div class="col-lg-7 pr-lg-5">
        <h3 class="title-big mb-4">Escríbenos</h3>
        <div class="reportaje-cuerpo">
          <p>Somos un espacio de periodismo independiente que busca visibilizar las
             acciones de diálogo en el país desde una mirada constructiva. Si tienes
             algo que contarnos, este es el camino más directo.</p>
        </div>

        <div class="row mt-5">
          <div class="col-md-6 mb-4">
            <h5 class="title-small mb-2">Correo</h5>
            <h4 class="correo-contacto"><a href="mailto:info@dialogoydesarrollo.com.pe">info@dialogoydesarrollo.com.pe</a></h4>
            <p class="mt-2">Respondemos de lunes a viernes.</p>
          </div>
          <div class="col-md-6 mb-4">
            <h5 class="title-small mb-2">Redes</h5>
            <div class="main-social-footer-29">
              <a target="_blank" href="https://www.facebook.com/DialogoyDesarrolloPeru" class="facebook" title="Facebook"><span class="fa fa-facebook-square fa-2x"></span></a>
              <a target="_blank" href="https://www.tiktok.com/@dialogo.y.desarrollo" class="twitter" title="TikTok"><img src="<?= BASE ?>/assets/images/tiktokg.png" alt="TikTok"></a>
              <a target="_blank" href="https://www.instagram.com/dialogo.y.desarrollo/" class="instagram" title="Instagram"><span class="fa fa-instagram fa-2x"></span></a>
            </div>
            <p class="mt-3">Ahí publicamos primero los adelantos de cada reportaje.</p>
          </div>
        </div>

        <h3 class="title-big mt-5 mb-4">Según lo que necesites</h3>
        <div class="reportaje-cuerpo">
          <ul>
            <li><b>Tienes un dato o una denuncia.</b> Cuéntanos qué pasó, dónde y
                cuándo, y adjunta lo que tengas a mano. Cuidamos la identidad de
                quien lo pide.</li>
            <li><b>Quieres corregir algo que publicamos.</b> Indícanos la nota y el
                punto exacto: si el error es nuestro, lo corregimos y lo dejamos
                señalado.</li>
            <li><b>Buscas republicar un reportaje o proponer un trabajo conjunto.</b>
                Eso lo vemos en <a href="<?= BASE ?>/alianzas.php">Alianzas</a>.</li>
            <li><b>Quieres saber quiénes somos.</b> Está en
                <a href="<?= BASE ?>/sobre.php">Sobre D&amp;D</a>.</li>
          </ul>
        </div>
      </div>

      <div class="col-lg-5 mt-lg-0 mt-5">
        <img src="<?= BASE ?>/assets/images/bannerimg.jpg" alt="Diálogo y Desarrollo Perú" class="img-fluid radius-image">
        <div class="mt-4">
          <h5 class="title-small mb-2">DDP Noticias</h5>
          <h3 class="title-banner">Diálogo y Desarrollo Perú</h3>
        </div>
      </div>
    </div>
  </div>
</section>

<?php require __DIR__ . '/partials/pie.php'; ?>
