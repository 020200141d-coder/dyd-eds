/**
 * Si una miniatura no carga, prueba la siguiente de su lista.
 *
 * YouTube no genera la version grande para todos los videos, y sin internet
 * no carga ninguna. En vez de dejar el hueco roto, cada imagen lleva sus
 * alternativas y va bajando hasta la copia local del proyecto.
 */
function siguienteMiniatura(img) {
  let respaldos;
  try {
    respaldos = JSON.parse(img.dataset.respaldos || '[]');
  } catch (e) {
    respaldos = [];
  }

  if (!respaldos.length) {
    img.onerror = null;
    return;
  }

  img.src = respaldos.shift();
  img.dataset.respaldos = JSON.stringify(respaldos);
}
