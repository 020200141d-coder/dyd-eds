function cargarVideos() {
  obtenerJson(BASE + '/admin/ajax/videos.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasVideos');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="4">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="4">No hay videos registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((v) => `
      <tr>
        <td data-label="Título">${escaparHtml(v.titulo)}</td>
        <td data-label="URL"><a href="${escaparHtml(v.url_embed)}" target="_blank" class="text-blue-500">Abrir</a></td>
        <td data-label="Fecha">${formatearFecha(v.fecha_publicacion)}</td>
        <td data-label="Estado">${v.estado === 'borrador' ? '<span class="tag is-warning">Borrador</span>' : '<span class="tag is-success">Publicado</span>'}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarVideo(${v.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarVideo(${v.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
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
  document.getElementById('formVideo').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('campoEstado').value = 'publicado';
  document.getElementById('tituloFormulario').textContent = 'Nuevo video';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarVideo(id) {
  obtenerJson(BASE + '/admin/ajax/videos.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const v = respuesta.datos;
    document.getElementById('campoId').value = v.id;
    document.getElementById('campoTitulo').value = v.titulo;
    document.getElementById('campoUrl').value = v.url_embed;
    document.getElementById('campoFecha').value = v.fecha_publicacion;
    document.getElementById('campoEstado').value = v.estado ?? 'publicado';
    document.getElementById('tituloFormulario').textContent = 'Editar video';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarVideo(id) {
  if (!confirm('¿Eliminar este video?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/videos.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Video eliminado.', 'exito');
      cargarVideos();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formVideo').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/videos.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Video actualizado.' : 'Video creado.', 'exito');
      mostrarLista();
      cargarVideos();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

cargarVideos();
