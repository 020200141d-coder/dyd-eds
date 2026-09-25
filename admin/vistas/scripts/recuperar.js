document.getElementById('formRecuperar').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const datos = new FormData(this);
  datos.append('accion', 'solicitar');

  llamarAjax(BASE + '/admin/ajax/recuperar.php', datos).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }

    document.getElementById('mensajeResultado').textContent = respuesta.mensaje;
    document.getElementById('resultado').hidden = false;

    // El enlace solo viene si el correo existe; si no, no se muestra nada
    // para no delatar que cuentas estan registradas.
    const caja = document.getElementById('cajaEnlace');
    if (respuesta.enlace) {
      const enlace = document.getElementById('enlaceRecuperacion');
      enlace.href = respuesta.enlace;
      enlace.textContent = window.location.origin + respuesta.enlace;
      caja.hidden = false;
    } else {
      caja.hidden = true;
    }

    // Se ocultan las dos opciones enteras, con sus titulos. Ocultando solo
    // los formularios quedaban los encabezados sueltos, sin campos debajo, y
    // la pantalla parecia rota.
    ocultarOpciones();
  });
});

// Camino del codigo guardado: no necesita correo saliente, por eso es el que
// sirve en los alojamientos gratuitos.
document.getElementById('formCodigo').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const datos = new FormData(this);
  datos.append('accion', 'codigo');

  llamarAjax(BASE + '/admin/ajax/recuperar.php', datos).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    // El codigo ya quedo comprobado: se sigue en la pantalla de contrasena nueva.
    window.location.href = respuesta.enlace;
  });
});

function ocultarOpciones() {
  ['bloqueCodigo', 'separadorOpciones', 'bloqueEnlace'].forEach((id) => {
    const caja = document.getElementById(id);
    if (caja) caja.hidden = true;
  });
}
