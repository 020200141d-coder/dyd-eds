function cargarNoticias() {
  obtenerJson(BASE + '/admin/ajax/noticias.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasNoticias');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="5">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="5">No hay noticias registradas.</td></tr>';
      return;
    }
    pintarAvisoDestacado(respuesta.datos);
    cuerpo.innerHTML = respuesta.datos.map((n) => `
      <tr>
        <td class="image-cell">${n.foto ? `<div class="image"><img src="${BASE}/admin/files/noticias/${escaparHtml(n.foto)}" class="rounded-full"></div>` : ''}</td>
        <td data-label="Título">${escaparHtml(n.titulo)}</td>
        <td data-label="Link">${n.link_externo ? `<a href="${escaparHtml(n.link_externo)}" target="_blank" class="text-blue-500">Ver enlace</a>` : ''}</td>
        <td data-label="Fecha">${formatearFecha(n.fecha_publicacion)}</td>
        <td data-label="Estado">${n.estado === 'borrador' ? '<span class="tag is-warning">Borrador</span>' : '<span class="tag is-success">Publicado</span>'}</td>
        ${celdaDestacado(n)}
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarNoticia(${n.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarNoticia(${n.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
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
  document.getElementById('formNoticia').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('fotoActual').textContent = '';
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('campoEstado').value = 'publicado';
  document.getElementById('tituloFormulario').textContent = 'Nueva noticia';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarNoticia(id) {
  obtenerJson(BASE + '/admin/ajax/noticias.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const n = respuesta.datos;
    document.getElementById('campoId').value = n.id;
    document.getElementById('campoTitulo').value = n.titulo;
    document.getElementById('campoLink').value = n.link_externo ?? '';
    document.getElementById('campoFecha').value = n.fecha_publicacion;
    document.getElementById('campoEstado').value = n.estado ?? 'publicado';
    document.getElementById('fotoActual').innerHTML = n.foto ? `Actual: <img src="${BASE}/admin/files/noticias/${escaparHtml(n.foto)}" style="height:60px;">` : '';
    document.getElementById('tituloFormulario').textContent = 'Editar noticia';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarNoticia(id) {
  if (!confirm('¿Eliminar esta noticia?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/noticias.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Noticia eliminada.', 'exito');
      cargarNoticias();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formNoticia').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/noticias.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Noticia actualizada.' : 'Noticia creada.', 'exito');
      mostrarLista();
      cargarNoticias();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

configurarDestacado({
  ajax: 'noticias',
  recargar: cargarNoticias,
  campo: 'titulo',
  vacio: 'la noticia publicada más reciente',
});

cargarNoticias();