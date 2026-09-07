const iconosTarjetas = {
  reportajes: { icono: 'mdi-newspaper-variant', color: 'text-green-500', etiqueta: 'Reportajes' },
  noticias: { icono: 'mdi-flash', color: 'text-blue-500', etiqueta: 'Noticias' },
  boletines: { icono: 'mdi-file-pdf-box', color: 'text-red-500', etiqueta: 'Boletines' },
  podcasts: { icono: 'mdi-microphone', color: 'text-purple-500', etiqueta: 'Podcasts' },
  videos: { icono: 'mdi-video', color: 'text-yellow-500', etiqueta: 'Videos' },
  autores: { icono: 'mdi-account-edit', color: 'text-indigo-500', etiqueta: 'Autores' },
  usuarios: { icono: 'mdi-account-multiple', color: 'text-gray-500', etiqueta: 'Usuarios' },
};

obtenerJson('/dyd-eds/admin/ajax/dashboard.php').then((respuesta) => {
  if (!respuesta.ok) {
    mostrarAviso(respuesta.error, 'error');
    return;
  }

  const contenedorTarjetas = document.getElementById('tarjetasConteo');
  contenedorTarjetas.innerHTML = Object.entries(respuesta.datos.conteos).map(([clave, valor]) => {
    const info = iconosTarjetas[clave];
    return `
      <div class="card">
        <div class="card-content">
          <div class="flex items-center justify-between">
            <div class="widget-label"><h3>${info.etiqueta}</h3><h1>${valor}</h1></div>
            <span class="icon widget-icon ${info.color}"><i class="mdi ${info.icono} mdi-48px"></i></span>
          </div>
        </div>
      </div>`;
  }).join('');

  const filas = respuesta.datos.ultimosReportajes;
  const cuerpoTabla = document.getElementById('filasUltimosReportajes');
  if (filas.length === 0) {
    cuerpoTabla.innerHTML = '<tr><td colspan="4">Todavía no hay reportajes registrados.</td></tr>';
    return;
  }
  cuerpoTabla.innerHTML = filas.map((r) => `
    <tr>
      <td data-label="Título">${escaparHtml(r.titulo)}</td>
      <td data-label="Usuario">${escaparHtml(r.usuario_nombre ?? '')}</td>
      <td data-label="Fecha">${formatearFecha(r.fecha_publicacion)}</td>
      <td data-label="Destacado">${r.es_destacado == 1 ? 'Sí' : 'No'}</td>
    </tr>`).join('');
});
