const formularioNuevaClave = document.getElementById('formNuevaClave');

if (formularioNuevaClave) {
  formularioNuevaClave.addEventListener('submit', function (evento) {
    evento.preventDefault();
    const datos = new FormData(this);
    datos.append('accion', 'restablecer');

    llamarAjax(BASE + '/admin/ajax/recuperar.php', datos).then((respuesta) => {
      if (!respuesta.ok) {
        mostrarAviso(respuesta.error, 'error');
        return;
      }
      mostrarAviso(respuesta.mensaje, 'exito');
      // Se deja leer el aviso antes de mandar a iniciar sesion.
      setTimeout(() => { window.location.href = BASE + '/admin/login.php'; }, 1500);
    });
  });
}
