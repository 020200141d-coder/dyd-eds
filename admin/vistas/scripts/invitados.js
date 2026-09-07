function cargarInvitados() {
  obtenerJson('/dyd-eds/admin/ajax/invitados.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasInvitados');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="4">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="4">No hay invitados registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((inv) => `
      <tr>
        <td class="image-cell">${inv.foto ? `<div class="image"><img src="/dyd-eds/admin/files/invitados/${escaparHtml(inv.foto)}" class="rounded-full"></div>` : ''}</td>
        <td data-label="Nombre">${escaparHtml(inv.nombre)}</td>
        <td data-label="Cargo">${escaparHtml(inv.cargo ?? '')}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarInvitado(${inv.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarInvitado(${inv.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
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
  document.getElementById('formInvitado').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('fotoActual').textContent = '';
  document.getElementById('tituloFormulario').textContent = 'Nuevo invitado';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarInvitado(id) {
  obtenerJson('/dyd-eds/admin/ajax/invitados.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const inv = respuesta.datos;
    document.getElementById('campoId').value = inv.id;
    document.getElementById('campoNombre').value = inv.nombre;
    document.getElementById('campoCargo').value = inv.cargo ?? '';
    document.getElementById('fotoActual').innerHTML = inv.foto ? `Actual: <img src="/dyd-eds/admin/files/invitados/${escaparHtml(inv.foto)}" style="height:60px;">` : '';
    document.getElementById('tituloFormulario').textContent = 'Editar invitado';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarInvitado(id) {
  if (!confirm('¿Eliminar este invitado?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax('/dyd-eds/admin/ajax/invitados.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Invitado eliminado.', 'exito');
      cargarInvitados();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formInvitado').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax('/dyd-eds/admin/ajax/invitados.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Invitado actualizado.' : 'Invitado creado.', 'exito');
      mostrarLista();
      cargarInvitados();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

cargarInvitados();
