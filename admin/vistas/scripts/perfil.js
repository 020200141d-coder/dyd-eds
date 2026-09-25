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

/* ------------------------------------------------------------------
   Código de recuperación: se muestra una sola vez, al generarlo.
   ------------------------------------------------------------------ */

function pintarEstadoCodigo() {
  obtenerJson(BASE + '/admin/ajax/perfil.php?accion=estadoCodigo').then((respuesta) => {
    const caja = document.getElementById('estadoCodigo');
    if (!respuesta.ok) return;
    if (respuesta.tiene) {
      caja.className = 'notification blue mb-4';
      caja.textContent = 'Tienes un código activo. Si generas otro, el anterior deja de servir.';
    } else {
      caja.className = 'notification yellow mb-4';
      caja.textContent = 'No tienes ningún código guardado. Genera uno y consérvalo.';
    }
  });
}

document.getElementById('btnGenerarCodigo').addEventListener('click', function () {
  if (!confirm('Se generará un código nuevo y el anterior dejará de funcionar. ¿Continuar?')) return;

  const datos = new FormData();
  datos.append('accion', 'generarCodigo');

  llamarAjax(BASE + '/admin/ajax/perfil.php', datos).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    document.getElementById('codigoGenerado').textContent = respuesta.codigo;
    document.getElementById('cajaCodigoNuevo').hidden = false;
    pintarEstadoCodigo();
  });
});

pintarEstadoCodigo();
