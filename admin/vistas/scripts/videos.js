function cargarVideos() {
  obtenerJson('/dyd-eds/admin/ajax/videos.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasVideos');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="5">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="5">No hay videos registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((v) => `
      <tr>
        <td data-label="Título">${escaparHtml(v.titulo)}</td>
        <td data-label="URL"><a href="${escaparHtml(v.url_embed)}" target="_blank" class="text-blue-500">Abrir</a></td>
        <td data-label="Invitados">${v.invitados.length ? escaparHtml(v.invitados.join(', ')) : '—'}</td>
        <td data-label="Fecha">${formatearFecha(v.fecha_publicacion)}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarVideo(${v.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarVideo(${v.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
          </div>
        </td>
      </tr>`).join('');
  });
}

function pintarListaInvitados(invitados, seleccionados) {
  const contenedor = document.getElementById('listaInvitados');
  if (invitados.length === 0) {
    contenedor.innerHTML = '<p class="help">No hay invitados registrados. <a href="/dyd-eds/admin/vistas/invitados.php" class="text-blue-500">Crea uno aquí</a>.</p>';
    return;
  }
  contenedor.innerHTML = invitados.map((inv) => `
    <label class="checkbox" style="display:block;margin-bottom:6px;">
      <input type="checkbox" name="invitados[]" value="${inv.id}" ${seleccionados.includes(inv.id) ? 'checked' : ''}>
      <span class="check"></span>
      <span class="control-label">${escaparHtml(inv.nombre)}${inv.cargo ? ' — ' + escaparHtml(inv.cargo) : ''}</span>
    </label>`).join('');
}

function mostrarLista() {
  document.getElementById('vistaFormulario').hidden = true;
  document.getElementById('vistaLista').hidden = false;
}

function mostrarFormulario() {
  document.getElementById('formVideo').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('tituloFormulario').textContent = 'Nuevo video';
  obtenerJson('/dyd-eds/admin/ajax/videos.php?accion=invitadosDisponibles').then((r) => pintarListaInvitados(r.datos, []));
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarVideo(id) {
  Promise.all([
    obtenerJson('/dyd-eds/admin/ajax/videos.php?accion=obtener&id=' + id),
    obtenerJson('/dyd-eds/admin/ajax/videos.php?accion=invitadosDisponibles'),
  ]).then(([respuesta, invitados]) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const v = respuesta.datos;
    document.getElementById('campoId').value = v.id;
    document.getElementById('campoTitulo').value = v.titulo;
    document.getElementById('campoUrl').value = v.url_embed;
    document.getElementById('campoFecha').value = v.fecha_publicacion;
    pintarListaInvitados(invitados.datos, v.invitados_ids.map(Number));
    document.getElementById('tituloFormulario').textContent = 'Editar video';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarVideo(id) {
  if (!confirm('¿Eliminar este video?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax('/dyd-eds/admin/ajax/videos.php?accion=eliminar', datos).then((respuesta) => {
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

  llamarAjax('/dyd-eds/admin/ajax/videos.php?accion=' + accion, datos).then((respuesta) => {
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
