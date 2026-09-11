function pintarFotos(fotos) {
  const grilla = document.getElementById('grillaFotos');
  if (fotos.length === 0) {
    grilla.innerHTML = '<p>Todavía no hay fotos adicionales para este reportaje.</p>';
    return;
  }
  grilla.innerHTML = fotos.map((f) => `
    <div class="card">
      <div class="card-content" style="padding:10px;">
        <img src="${BASE}/admin/files/reportajes_fotos/${escaparHtml(f.url_foto)}" style="width:100%;height:120px;object-fit:cover;border-radius:6px;">
        <p class="mt-2" style="font-size:12px;">${escaparHtml(f.descripcion ?? '')}</p>
        <button type="button" class="button small red mt-2" style="width:100%;" onclick="eliminarFoto(${f.id})"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
      </div>
    </div>`).join('');
}

function cargarFotos() {
  obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=listarFotos&reportaje_id=' + idReportaje).then((respuesta) => {
    if (respuesta.ok) pintarFotos(respuesta.datos);
  });
}

function eliminarFoto(fotoId) {
  if (!confirm('¿Eliminar esta foto?')) return;
  const datos = new FormData();
  datos.append('foto_id', fotoId);
  llamarAjax(BASE + '/admin/ajax/reportajes.php?accion=eliminarFoto', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Foto eliminada.', 'exito');
      cargarFotos();
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
}

document.getElementById('formFoto').addEventListener('submit', function (evento) {
  evento.preventDefault();
  const datos = new FormData(this);
  datos.append('reportaje_id', idReportaje);

  llamarAjax(BASE + '/admin/ajax/reportajes.php?accion=agregarFoto', datos).then((respuesta) => {
    if (respuesta.ok) {
      mostrarAviso('Foto agregada correctamente.', 'exito');
      this.reset();
      pintarFotos(respuesta.datos);
    } else {
      mostrarAviso(respuesta.error, 'error');
    }
  });
});

obtenerJson(BASE + '/admin/ajax/reportajes.php?accion=obtener&id=' + idReportaje).then((respuesta) => {
  if (!respuesta.ok) {
    window.location.href = BASE + '/admin/vistas/reportajes.php';
    return;
  }
  document.getElementById('tituloReportaje').textContent = respuesta.datos.titulo;
  pintarFotos(respuesta.datos.fotos);
});
