// Funciones que usan todos los scripts del panel: llamar a un ajax y
// mostrar el aviso de éxito/error. No arma SQL ni sabe de tablas.

function llamarAjax(url, datosFormData) {
  return fetch(url, { method: 'POST', body: datosFormData })
    .then((respuesta) => respuesta.json());
}

function obtenerJson(url) {
  return fetch(url).then((respuesta) => respuesta.json());
}

function mostrarAviso(mensaje, tipo) {
  const aviso = document.getElementById('aviso');
  if (!aviso) return;
  aviso.textContent = mensaje;
  aviso.className = 'notification mb-6 ' + (tipo === 'error' ? 'red' : 'green');
  aviso.hidden = false;
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

function formatearFecha(fecha) {
  if (!fecha) return '';
  const partes = fecha.split('-');
  if (partes.length !== 3) return fecha;
  return partes[2] + '/' + partes[1] + '/' + partes[0];
}

function escaparHtml(texto) {
  const div = document.createElement('div');
  div.textContent = texto ?? '';
  return div.innerHTML;
}
