<?php
require_once __DIR__ . '/../config/global.php';
require_once __DIR__ . '/../modelos/Reportaje.php';
require_once __DIR__ . '/../modelos/Noticia.php';
require_once __DIR__ . '/../modelos/Boletin.php';
require_once __DIR__ . '/../modelos/Podcast.php';
require_once __DIR__ . '/../modelos/Video.php';
require_once __DIR__ . '/../modelos/Autor.php';
require_once __DIR__ . '/../modelos/Usuario.php';

exigirSesionAjax();

respuestaJson([
    'ok' => true,
    'datos' => [
        'conteos' => [
            'reportajes' => Reportaje::contar(),
            'noticias' => Noticia::contar(),
            'boletines' => Boletin::contar(),
            'podcasts' => Podcast::contar(),
            'videos' => Video::contar(),
            'autores' => Autor::contar(),
            'usuarios' => Usuario::contar(),
        ],
        'ultimosReportajes' => Reportaje::ultimos(8),
    ],
]);
