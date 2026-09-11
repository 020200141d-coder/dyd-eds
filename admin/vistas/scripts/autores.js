function cargarAutores() {
  obtenerJson(BASE + '/admin/ajax/autores.php?accion=listar').then((respuesta) => {
    const cuerpo = document.getElementById('filasAutores');
    if (!respuesta.ok) {
      cuerpo.innerHTML = `<tr><td colspan="2">${escaparHtml(respuesta.error)}</td></tr>`;
      return;
    }
    if (respuesta.datos.length === 0) {
      cuerpo.innerHTML = '<tr><td colspan="2">No hay autores registrados.</td></tr>';
      return;
    }
    cuerpo.innerHTML = respuesta.datos.map((autor) => `
      <tr>
        <td data-label="Nombre">${escaparHtml(autor.nombre)}</td>
        <td class="actions-cell">
          <div class="buttons right nowrap">
            <button type="button" class="button small blue" onclick="editarAutor(${autor.id})"><span class="icon"><i class="mdi mdi-pencil"></i></span></button>
            <button type="button" class="button small red" onclick="eliminarAutor(${autor.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
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
  document.getElementById('formAutor').reset();
  document.getElementById('campoId').value = '';
  document.getElementById('tituloFormulario').textContent = 'Nuevo autor';
  document.getElementById('vistaLista').hidden = true;
  document.getElementById('vistaFormulario').hidden = false;
}

function editarAutor(id) {
  obtenerJson(BASE + '/admin/ajax/autores.php?accion=obtener&id=' + id).then((respuesta) => {
    if (!respuesta.ok) {
      mostrarAviso(respuesta.error, 'error');
      return;
    }
    document.getElementById('campoId').value = respuesta.datos.id;
    document.getElementById('campoNombre').value = respuesta.datos.nombre;
    document.getElementById('tituloFormulario').textContent = 'Editar autor';
    document.getElementById('vistaLista').hidden = true;
    document.getElementById('vistaFormulario').hidden = false;
  });
}

function eliminarAutor(id) {
  if (!confirm('¿Eliminar este autor?')) return;
  const datos = new FormData();
  datos.append('id', id);
  llamarAjax(BASE + '/admin/ajax/autores.php?accion=eliminar', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Autor eliminado.', 'exito');
      cargarAutores();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formAutor').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const id = document.getElementById('campoId').value;
  const datos = new FormData(this);
  const accion = id ? 'actualizar' : 'crear';

  llamarAjax(BASE + '/admin/ajax/autores.php?accion=' + accion, datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso(id ? 'Autor actualizado.' : 'Autor creado.', 'exito');
      mostrarLista();
      cargarAutores();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

cargarAutores();
