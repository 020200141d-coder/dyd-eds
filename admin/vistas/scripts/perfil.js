obtenerJson(BASE + '/admin/ajax/perfil.php?accion=obtener').then((respuesta) => {
  const u = respuesta.datos;
  document.getElementById('campoNombre').value = u.nombre_completo;
  document.getElementById('campoEmail').value = u.email;
  document.getElementById('campoRol').value = u.rol;
});

document.getElementById('formPerfil').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const datos = new FormData(this);

  llamarAjax(BASE + '/admin/ajax/perfil.php?accion=actualizar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Perfil actualizado correctamente.', 'exito');
      this.clave && (this.clave.value = '');
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});
