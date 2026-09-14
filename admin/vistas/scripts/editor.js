/**
 * Editor de texto con formato para el panel.
 *
 * Escrito a mano y sin librerias para que funcione aunque la maquina no
 * tenga internet. Convierte un <textarea> en un area editable con barra de
 * herramientas; al enviar el formulario devuelve el HTML al textarea, que es
 * el que viaja al servidor. Alli se limpia con limpiarHtml() antes de
 * guardarse, asi que el navegador no es la unica defensa.
 */

const BOTONES_EDITOR = [
  { orden: 'bold', etiqueta: 'N', titulo: 'Negrita', estilo: 'font-weight:700' },
  { orden: 'italic', etiqueta: 'C', titulo: 'Cursiva', estilo: 'font-style:italic' },
  { orden: 'underline', etiqueta: 'S', titulo: 'Subrayado', estilo: 'text-decoration:underline' },
  { separador: true },
  { orden: 'formatBlock', valor: 'h2', etiqueta: 'Título', titulo: 'Título de sección' },
  { orden: 'formatBlock', valor: 'h3', etiqueta: 'Subtítulo', titulo: 'Subtítulo' },
  { orden: 'formatBlock', valor: 'p', etiqueta: 'Párrafo', titulo: 'Texto normal' },
  { separador: true },
  { orden: 'insertUnorderedList', etiqueta: '• Lista', titulo: 'Lista con viñetas' },
  { orden: 'insertOrderedList', etiqueta: '1. Lista', titulo: 'Lista numerada' },
  { orden: 'formatBlock', valor: 'blockquote', etiqueta: '❝ Cita', titulo: 'Cita destacada' },
  { separador: true },
  { orden: 'enlace', etiqueta: 'Enlace', titulo: 'Insertar enlace' },
  { orden: 'unlink', etiqueta: 'Quitar enlace', titulo: 'Quitar el enlace' },
  { separador: true },
  { orden: 'removeFormat', etiqueta: 'Limpiar', titulo: 'Quitar el formato' },
];

function crearEditor(idTextarea) {
  const textarea = document.getElementById(idTextarea);
  if (!textarea || textarea.dataset.editorListo) return;
  textarea.dataset.editorListo = '1';

  const caja = document.createElement('div');
  caja.className = 'editor-rico';

  const barra = document.createElement('div');
  barra.className = 'editor-barra';

  const area = document.createElement('div');
  area.className = 'editor-area';
  area.contentEditable = 'true';
  area.setAttribute('role', 'textbox');
  area.setAttribute('aria-multiline', 'true');
  area.setAttribute('aria-label', 'Contenido del reportaje');

  BOTONES_EDITOR.forEach((b) => {
    if (b.separador) {
      const sep = document.createElement('span');
      sep.className = 'editor-separador';
      barra.appendChild(sep);
      return;
    }
    const boton = document.createElement('button');
    boton.type = 'button';
    boton.className = 'editor-boton';
    boton.title = b.titulo;
    boton.textContent = b.etiqueta;
    if (b.estilo) boton.setAttribute('style', b.estilo);
    boton.addEventListener('mousedown', (e) => e.preventDefault());
    boton.addEventListener('click', () => aplicar(b, area));
    barra.appendChild(boton);
  });

  caja.appendChild(barra);
  caja.appendChild(area);
  textarea.parentNode.insertBefore(caja, textarea);
  textarea.classList.add('editor-oculto');

  // El textarea sigue siendo el campo real del formulario.
  area.addEventListener('input', () => { textarea.value = area.innerHTML; });
  const formulario = textarea.closest('form');
  if (formulario) {
    formulario.addEventListener('submit', () => { textarea.value = area.innerHTML; });
  }

  // Cuando el panel carga un reportaje, vuelca el contenido al area.
  textarea.addEventListener('editor:cargar', () => {
    area.innerHTML = textarea.value || '';
  });
}

function aplicar(boton, area) {
  area.focus();

  if (boton.orden === 'enlace') {
    const url = window.prompt('Dirección del enlace (https://...)');
    if (!url) return;
    if (!/^(https?:\/\/|mailto:|\/|#)/i.test(url.trim())) {
      alert('Usa una dirección que empiece con https:// o mailto:');
      return;
    }
    document.execCommand('createLink', false, url.trim());
  } else if (boton.orden === 'formatBlock') {
    document.execCommand('formatBlock', false, boton.valor);
  } else {
    document.execCommand(boton.orden, false, null);
  }

  area.dispatchEvent(new Event('input', { bubbles: true }));
}

/** Vuelca al editor el contenido que se acaba de cargar en el textarea. */
function refrescarEditor(idTextarea) {
  const textarea = document.getElementById(idTextarea);
  if (textarea) textarea.dispatchEvent(new Event('editor:cargar'));
}
