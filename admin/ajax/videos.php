<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Video.php';
require_once __DIR__ . '/../modelos/Invitado.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Video::listar()]);

    case 'obtener':
        $id = (int) ($_GET['id'] ?? 0);
        $video = Video::obtener($id);
        if (!$video) {
            respuestaJson(['ok' => false, 'error' => 'Video no encontrado.']);
        }
        $video['invitados_ids'] = Video::invitadosDe($id);
        respuestaJson(['ok' => true, 'datos' => $video]);

    case 'invitadosDisponibles':
        respuestaJson(['ok' => true, 'datos' => Invitado::listar()]);

    case 'crear':
    case 'actualizar':
        $titulo = trim($_POST['titulo'] ?? '');
        $urlEmbed = trim($_POST['url_embed'] ?? '');
        if ($titulo === '' || $urlEmbed === '') {
            respuestaJson(['ok' => false, 'error' => 'Título y URL son obligatorios.']);
        }

        $datos = [
            'titulo' => $titulo,
            'url_embed' => $urlEmbed,
            'fecha_publicacion' => $_POST['fecha_publicacion'] ?? date('Y-m-d'),
            'usuario_id' => usuarioActual()['id'],
            'invitados' => $_POST['invitados'] ?? [],
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
