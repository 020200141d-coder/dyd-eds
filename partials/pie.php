<div class="middle py-5">
  <div class="container py-xl-5 py-lg-3">
    <div class="welcome-left text-center py-md-5 py-3">
      <h3 class="title-big">Síguenos en nuestras Redes Sociales</h3>
      <div class="main-social-footer-29">
        <a target="_blank" href="https://www.facebook.com/DialogoyDesarrolloPeru" class="facebook"><span class="fa fa-facebook-square fa-2x"></span></a>
        <a target="_blank" href="https://www.tiktok.com/@dialogo.y.desarrollo" class="twitter"><img src="<?= BASE ?>/assets/images/tiktokg.png"></a>
        <a target="_blank" href="https://www.instagram.com/dialogo.y.desarrollo/" class="instagram"><span class="fa fa-instagram fa-2x"></span></a>
      </div>
    </div>
  </div>
</div>

<section class="w3l-footer-29-main py-5" id="footer">
  <div class="footer-29 py-md-3">
    <div class="container">
      <div class="row footer-top-29">
        <div class="col-lg-6 col-md-6 footer-list-29 footer-1">
          <h6 class="footer-title-29">Quiénes Somos</h6>
          <p>Somos un espacio de periodismo independiente que busca visibilizar las acciones de diálogo en el país desde una mirada constructiva.</p>
          <div class="main-social-footer-29">
            <a target="_blank" href="https://www.facebook.com/DialogoyDesarrolloPeru" class="facebook"><span class="fa fa-facebook-square"></span></a>
            <a target="_blank" href="https://www.tiktok.com/@dialogo.y.desarrollo" class="twitter"><img src="<?= BASE ?>/assets/images/tiktokp.png"></a>
            <a target="_blank" href="https://www.instagram.com/dialogo.y.desarrollo/" class="instagram"><span class="fa fa-instagram"></span></a>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 footer-list-29 footer-2 mt-md-0 mt-5">
          <ul>
            <h6 class="footer-title-29">Contenido</h6>
            <li><a href="<?= BASE ?>/index.php#actualidad">Noticias</a></li>
            <li><a href="<?= BASE ?>/videos.php">Videos</a></li>
            <li><a href="<?= BASE ?>/podcast.php">Podcast</a></li>
          </ul>
        </div>
        <div class="col-lg-3 col-md-6 mt-lg-0 mt-5 footer-list-29 footer-3">
          <div class="properties">
            <h6 class="footer-title-29">Contacto</h6>
            <ul>
              <li><a href="mailto:info@dialogoydesarrollo.com.pe">info@dialogoydesarrollo.com.pe</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="bottom-copies text-center">
        <p class="copy-footer-29">© <?= date('Y') ?> Diálogo y Desarrollo Perú. All rights reserved | Designed by <a target="_blank" href="https://www.wsperu.info/">WebSolutions</a></p>
      </div>
    </div>
  </div>
  <button onclick="topFunction()" id="movetop" title="Go to top">
    <span class="fa fa-angle-up"></span>
  </button>
  <script>
    window.onscroll = function () { scrollFunction() };
    function scrollFunction() {
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("movetop").style.display = "block";
      } else {
        document.getElementById("movetop").style.display = "none";
      }
    }
    function topFunction() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
    }
  </script>
</section>

<script src="<?= BASE ?>/assets/js/jquery-3.3.1.min.js"></script>
<script src="<?= BASE ?>/assets/js/owl.carousel.js"></script>
<script>
  $(document).ready(function () {
    $('.owl-carousel').owlCarousel({
      loop: true,
      margin: 0,
      responsiveClass: true,
      responsive: {
        0: { items: 1, nav: true },
        400: { items: 2, nav: true, margin: 20 },
        768: { items: 3, nav: true, margin: 20 },
        1000: { items: 4, nav: true, loop: true, margin: 25 }
      }
    });
  });
</script>
<script src="<?= BASE ?>/assets/js/jquery.magnific-popup.min.js"></script>
<script>
  $(document).ready(function () {
    $('.popup-with-zoom-anim').magnificPopup({
      type: 'inline',
      fixedContentPos: false,
      fixedBgPos: true,
      overflowY: 'auto',
      closeBtnInside: true,
      preloader: false,
      midClick: true,
      removalDelay: 300,
      mainClass: 'my-mfp-zoom-in'
    });
  });
</script>
<script>
  $(function () {
    $('.navbar-toggler').click(function () {
      $('body').toggleClass('noscroll');
    });
  });
  $(window).on("scroll", function () {
    var scroll = $(window).scrollTop();
    if (scroll >= 80) { $("#site-header").addClass("nav-fixed"); }
    else { $("#site-header").removeClass("nav-fixed"); }
  });
  $(".navbar-toggler").on("click", function () {
    $("header").toggleClass("active");
  });
</script>
<script src="<?= BASE ?>/assets/js/bootstrap.min.js"></script>
</body>
</html>
