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

/* ------------------------------------------------------------------
   Destacado de la portada.

   La portada muestra un solo reportaje, un solo boletín, un solo podcast
   y un solo video, así que en cada listado hace falta poder decir cuál
   sale. Es el mismo botón y el mismo aviso en los cinco módulos, por eso
   vive aquí una vez y cada vista solo dice de qué módulo se trata.
   ------------------------------------------------------------------ */

let moduloDestacado = null;

/**
 * La llama cada vista al cargar:
 *   configurarDestacado({ ajax: 'videos', recargar: cargarVideos,
 *                         campo: 'titulo', vacio: 'el más reciente' });
 */
function configurarDestacado(config) {
  moduloDestacado = config;
}

/** Celda con el botón, para pegar dentro de la fila de la tabla. */
function celdaDestacado(registro) {
  const marcado = registro.es_destacado == 1;
  return `<td data-label="Destacado">
    <button type="button" class="button small ${marcado ? 'yellow' : ''}"
            title="${marcado ? 'Es el destacado de la portada. Clic para quitarlo.' : 'Poner como destacado de la portada'}"
            onclick="alternarDestacado(${registro.id})">
      ${marcado ? '★ Destacado' : '☆ Destacar'}
    </button>
  </td>`;
}

/** Deja claro de un vistazo cuál es el que abre la portada. */
function pintarAvisoDestacado(lista) {
  const caja = document.getElementById('avisoDestacado');
  if (!caja || !moduloDestacado) return;
  const destacado = lista.find((r) => r.es_destacado == 1);
  const campo = moduloDestacado.campo || 'titulo';
  const prefijo = moduloDestacado.prefijo || '';
  caja.innerHTML = destacado
    ? `★ En la portada: <b>${escaparHtml(prefijo + destacado[campo])}</b>`
    : `Ninguno está destacado: la portada muestra ${moduloDestacado.vacio}.`;
}

function alternarDestacado(id) {
  if (!moduloDestacado) return;
  const datos = new FormData();
  datos.append('accion', 'destacar');
  datos.append('id', id);

  llamarAjax(BASE + '/admin/ajax/' + moduloDestacado.ajax + '.php', datos).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    mostrarAviso(respuesta.destacado ? 'Ahora es el que abre la portada.' : 'Se quitó de la portada.', 'exito');
    moduloDestacado.recargar();
  });
}
