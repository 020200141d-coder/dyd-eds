function cargarUsuarios() {
  obtenerJson(BASE + '/admin/ajax/usuarios.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasUsuarios');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="4">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((u) => `
      <tr>
        <td data-label="Nombre">${escaparHtml(u.nombre_completo)}</td>
        <td data-label="Email">${escaparHtml(u.email)}</td>
        <td data-label="Rol">${escaparHtml(u.rol)}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarUsuario(${u.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            ${u.id != idUsuarioActual ? `<button type="button" class="button small red" onclick="eliminarUsuario(${u.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>` : ''}
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
  document.getElementById('formUsuario').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('etiquetaClave').textContent = 'Contraseña *';
  document.getElementById('etiquetaPregunta').textContent = 'Pregunta *';
  document.getElementById('etiquetaRespuesta').textContent = 'Respuesta *';
  document.getElementById('campoPregunta').value = '';
  document.getElementById('campoRespuesta').value = '';
  document.getElementById('campoClave').required = true;
  document.getElementById('tituloFormulario').textContent = 'Nuevo usuario';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarUsuario(id) {
  obtenerJson(BASE + '/admin/ajax/usuarios.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    const u = respuesta.datos;
    document.getElementById('campoId').value = u.id;
    document.getElementById('campoNombre').value = u.nombre_completo;
    document.getElementById('campoEmail').value = u.email;
    document.getElementById('campoRol').value = u.rol;
    document.getElementById('etiquetaClave').textContent = 'Nueva contraseña (dejar vacío para no cambiar)';
    document.getElementById('etiquetaPregunta').textContent = 'Pregunta (dejar vacío para no cambiar)';
    document.getElementById('etiquetaRespuesta').textContent = 'Respuesta (dejar vacío para no cambiar)';
    document.getElementById('campoPregunta').value = u.pregunta ?? '';
    document.getElementById('campoRespuesta').value = '';
    document.getElementById('campoClave').required = false;
    document.getElementById('tituloFormulario').textContent = 'Editar usuario';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarUsuario(id) {
  if (!confirm('¿Eliminar este usuario?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/usuarios.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Usuario eliminado.', 'exito');
      cargarUsuarios();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formUsuario').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/usuarios.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Usuario actualizado.' : 'Usuario creado.', 'exito');
      mostrarLista();
      cargarUsuarios();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

cargarUsuarios();
