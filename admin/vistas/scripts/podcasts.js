function cargarPodcasts() {
  obtenerJson('/dyd-eds/admin/ajax/podcasts.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasPodcasts');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="5">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="5">No hay podcasts registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((p) => `
      <tr>
        <td data-label="Título">${escaparHtml(p.titulo)}</td>
        <td data-label="URL"><a href="${escaparHtml(p.url_embed)}" target="_blank" class="text-blue-500">Abrir</a></td>
        <td data-label="Invitados">${p.invitados.length ? escaparHtml(p.invitados.join(', ')) : '—'}</td>
        <td data-label="Fecha">${formatearFecha(p.fecha_publicacion)}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarPodcast(${p.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarPodcast(${p.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
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
  document.getElementById('formPodcast').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('campoFecha').value = new Date().toISOString().slice(0, 10);
  document.getElementById('tituloFormulario').textContent = 'Nuevo podcast';
  obtenerJson('/dyd-eds/admin/ajax/podcasts.php?accion=invitadosDisponibles').then((r) => pintarListaInvitados(r.datos, []));
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarPodcast(id) {
  Promise.all([
    obtenerJson('/dyd-eds/admin/ajax/podcasts.php?accion=obtener&id=' + id),
    obtenerJson('/dyd-eds/admin/ajax/podcasts.php?accion=invitadosDisponibles'),
  ]).then(([respuesta, invitados]) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const p = respuesta.datos;
    document.getElementById('campoId').value = p.id;
    document.getElementById('campoTitulo').value = p.titulo;
    document.getElementById('campoUrl').value = p.url_embed;
    document.getElementById('campoFecha').value = p.fecha_publicacion;
    pintarListaInvitados(invitados.datos, p.invitados_ids.map(Number));
    document.getElementById('tituloFormulario').textContent = 'Editar podcast';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarPodcast(id) {
  if (!confirm('¿Eliminar este podcast?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax('/dyd-eds/admin/ajax/podcasts.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Podcast eliminado.', 'exito');
      cargarPodcasts();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formPodcast').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax('/dyd-eds/admin/ajax/podcasts.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Podcast actualizado.' : 'Podcast creado.', 'exito');
      mostrarLista();
      cargarPodcasts();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

cargarPodcasts();
