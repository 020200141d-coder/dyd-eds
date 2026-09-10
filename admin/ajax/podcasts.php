<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Podcast.php';

exigirSesionAjax();

$accion = $_POST['accion'] ?? $_GET['accion'] ?? '';

switch ($accion) {
    case 'listar':
        respuestaJson(['ok' => true, 'datos' => Podcast::listar()]);

    case 'obtener':
        $podcast = Podcast::obtener((int) ($_GET['id'] ?? 0));
        respuestaJson($podcast ? ['ok' => true, 'datos' => $podcast] : ['ok' => false, 'error' => 'Podcast no encontrado.']);

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
        ];

        if ($accion === 'crear') {
            $id = Podcast::crear($datos);
        } else {
            $id = (int) ($_POST['id'] ?? 0);
            Podcast::actualizar($id, $datos);
        }
        respuestaJson(['ok' => true, 'id' => $id]);

    case 'eliminar':
        Podcast::eliminar((int) ($_POST['id'] ?? 0));
        respuestaJson(['ok' => true]);

    default:
        respuestaJson(['ok' => false, 'error' => 'Acción no reconocida.']);
}
