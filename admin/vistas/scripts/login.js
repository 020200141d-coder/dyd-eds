document.getElementById('formLogin').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const datos = new FormData(this);
  datos.append('accion', 'login');

  llamarAjax('/dyd-eds/admin/ajax/login.php', datos).then((respuesta) => {
    if (respuesta.ok) {
      window.location.href = '/dyd-eds/admin/index.php';
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});
