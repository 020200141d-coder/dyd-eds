function cargarBoletines() {
  obtenerJson(BASE + '/admin/ajax/boletines.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasBoletines');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="6">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="6">No hay boletines registrados.</td></tr>';
      return;
    }
    pintarAvisoDestacado(respuesta.datos);
    cuerpo.innerHTML = respuesta.datos.map((b) => `
      <tr>
        <td class="image-cell">${b.foto_portada ? `<div class="image"><img src="${BASE}/admin/files/boletines/portada/${escaparHtml(b.foto_portada)}" class="rounded-full"></div>` : ''}</td>
        <td data-label="N°">${escaparHtml(b.numero_boletin)}</td>
        <td data-label="Resumen">${escaparHtml(b.resumen ?? '')}</td>
        <td data-label="PDF"><a href="${BASE}/admin/files/boletines/pdf/${escaparHtml(b.archivo_pdf)}" target="_blank" class="text-blue-500">Ver PDF</a></td>
        <td data-label="Fecha">${formatearFecha(b.fecha_publicacion)}</td>
        <td data-label="Estado">${b.estado === 'borrador' ? '<span class="tag is-warning">Borrador</span>' : '<span class="tag is-success">Publicado</span>'}</td>
        ${celdaDestacado(b)}
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarBoletin(${b.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarBoletin(${b.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
          </div>
        </td>
      </tr>`).join('');
  });
}

function mostrarLista() {
  document.getElementById('vistaFormulario').hidden = true;
  document.getElementById('vistaLista').hidden = false;
}

function mostrarFormulario() {
  document.getElementById('formBoletin').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('portadaActual').textContent = '';
  document.getElementById('pdfActual').textContent = '';
  document.getElementById('etiquetaPdf').textContent = 'Archivo PDF *';
  document.getElementById('campoPdfInput').required = true;
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('campoEstado').value = 'publicado';
  document.getElementById('tituloFormulario').textContent = 'Nuevo boletín';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarBoletin(id) {
  obtenerJson(BASE + '/admin/ajax/boletines.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const b = respuesta.datos;
    document.getElementById('campoId').value = b.id;
    document.getElementById('campoNumero').value = b.numero_boletin;
    document.getElementById('campoResumen').value = b.resumen ?? '';
    document.getElementById('campoFecha').value = b.fecha_publicacion;
    document.getElementById('campoEstado').value = b.estado ?? 'publicado';
    document.getElementById('portadaActual').innerHTML = b.foto_portada ? `Actual: <img src="${BASE}/admin/files/boletines/portada/${escaparHtml(b.foto_portada)}" style="height:60px;">` : '';
    document.getElementById('pdfActual').innerHTML = `Actual: <a href="${BASE}/admin/files/boletines/pdf/${escaparHtml(b.archivo_pdf)}" target="_blank" class="text-blue-500">Ver PDF actual</a>`;
    document.getElementById('etiquetaPdf').textContent = 'Archivo PDF (dejar vacío para conservar el actual)';
    document.getElementById('campoPdfInput').required = false;
    document.getElementById('tituloFormulario').textContent = 'Editar boletín';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarBoletin(id) {
  if (!confirm('¿Eliminar este boletín?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/boletines.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Boletín eliminado.', 'exito');
      cargarBoletines();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formBoletin').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/boletines.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Boletín actualizado.' : 'Boletín creado.', 'exito');
      mostrarLista();
      cargarBoletines();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

configurarDestacado({
  ajax: 'boletines',
  recargar: cargarBoletines,
  campo: 'numero_boletin',
  prefijo: 'Nº ',
  vacio: 'el boletín publicado más reciente',
});

cargarBoletines();