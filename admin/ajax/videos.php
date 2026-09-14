<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Video.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Video::listar()]);

    case 'obtener':
        $video = Video::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($video ? ['ok' => true, 'datos' => $video] : ['ok' => false, 'error' => 'Video no encontrado.']);

    case 'crear':
    case 'actualizar':
        $titulo = trim($_POST['titulo'] ?? '');
        $urlEmbed = trim($_POST['url_embed'] ?? '');
        if ($titulo === '' || $urlEmbed === '') {
            respuestaJson(['ok' => false, 'error' => 'Título y URL son obligatorios.']);
        }

        // solo se aceptan los dos estados validos; cualquier otra cosa se toma
        // como borrador para no publicar nada por accidente
        $estado = ($_POST['estado'] ?? '') === 'publicado' ? 'publicado' : 'borrador';

        $datos = [
            'estado' => $estado,
            'titulo' => $titulo,
            'url_embed' => urlParaIncrustar($urlEmbed),
            'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
            'usuario_id' => usuarioActual()['id'],
        ];

        if ($accion === 'crear') {
            $id = Video::crear($datos);
        } else {
            $id = (int) ($_POST['id'] ?? 0);
            Video::actualizar($id, $datos);
        }
        respuestaJson(['ok' => true, 'id' => $id]);

    case 'eliminar':
        Video::eliminar((int) ($_POST['id'] ?? 0));
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
