function nombreAutor(r) {
  return r.autor_nombre ? r.autor_nombre : 'Redacción';
}

function cargarReportajes() {
  obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasReportajes');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="6">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="6">No hay reportajes registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((r) => `
      <tr>
        <td class="image-cell">${r.foto_principal ? `<div class="image"><img src="${BASE}/admin/files/reportajes/${escaparHtml(r.foto_principal)}" class="rounded-full"></div>` : ''}</td>
        <td data-label="Título">${escaparHtml(r.titulo)}</td>
        <td data-label="Autor">${escaparHtml(nombreAutor(r))}</td>
        <td data-label="Fecha">${formatearFecha(r.fecha_publicacion)}</td>
        <td data-label="Destacado">${r.es_destacado == 1 ? 'Sí' : 'No'}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarReportaje(${r.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarReportaje(${r.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
          </div>
        </td>
      </tr>`).join('');
  });
}

function pintarSelectAutores(autores, seleccionado) {
  const select = document.getElementById('campoAutor');
  select.innerHTML = '<option value="">Redacción (sin autor)</option>' +
    autores.map((a) => `<option value="${a.id}" ${String(a.id) === String(seleccionado) ? 'selected' : ''}>${escaparHtml(a.nombre)}</option>`).join('');
}

function mostrarLista() {
  document.getElementById('vistaFormulario').hidden = true;
  document.getElementById('vistaLista').hidden = false;
}

function mostrarFormulario() {
  document.getElementById('formReportaje').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('fotoActual').textContent = '';
  document.getElementById('pdfActual').textContent = '';
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('botonFotos').hidden = true;
  document.getElementById('tituloFormulario').textContent = 'Nuevo reportaje';
  obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=autoresDisponibles').then((r) => pintarSelectAutores(r.datos, ''));
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarReportaje(id) {
  Promise.all([
    obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=obtener&id=' + id),
    obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=autoresDisponibles'),
  ]).then(([respuesta, autores]) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const r = respuesta.datos;
    document.getElementById('campoId').value = r.id;
    document.getElementById('campoTitulo').value = r.titulo;
    document.getElementById('campoResumen').value = r.resumen_corto ?? '';
    document.getElementById('campoDesarrollo').value = r.desarrollo;
    document.getElementById('campoFecha').value = r.fecha_publicacion;
    document.getElementById('campoDestacado').checked = r.es_destacado == 1;
    pintarSelectAutores(autores.datos, r.autor_id);
    document.getElementById('fotoActual').innerHTML = r.foto_principal ? `Actual: <img src="${BASE}/admin/files/reportajes/${escaparHtml(r.foto_principal)}" style="height:60px;">` : '';
    document.getElementById('pdfActual').innerHTML = r.pdf_adjunto ? `Actual: <a href="${BASE}/admin/files/reportajes/${escaparHtml(r.pdf_adjunto)}" target="_blank" class="text-blue-500">Ver PDF actual</a>` : '';
    document.getElementById('enlaceFotos').href = BASE + '/admin/vistas/reportajes_fotos.php?id=' + r.id;
    document.getElementById('botonFotos').hidden = false;
    document.getElementById('tituloFormulario').textContent = 'Editar reportaje';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarReportaje(id) {
  if (!confirm('¿Eliminar este reportaje y sus fotos?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/reportajes.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Reportaje eliminado.', 'exito');
      cargarReportajes();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formReportaje').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/reportajes.php?accion=' + accion, datos).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    if (id) {
      mostrarAviso('Reportaje actualizado.', 'exito');
      mostrarLista();
      cargarReportajes();
    } else {
      // reportaje nuevo: va directo a la galería de fotos, como antes
      window.location.href = BASE + '/admin/vistas/reportajes_fotos.php?id=' + respuesta.id;
    }
  });
});

cargarReportajes();
