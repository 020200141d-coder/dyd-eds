<?php
// Ruta desde la que el navegador ve el proyecto: "/dyd-eds" si esta en
// htdocs/dyd-eds, "" si esta en la raiz del servidor. Se calcula sola para
// que el proyecto funcione aunque la carpeta tenga otro nombre.
//
// Se compara la ubicacion del archivo en el disco con la direccion por la que
// se pidio: lo que sobra al inicio de la direccion es la ruta base.

if (!defined('BASE')) {
    $base = '';

    $raiz = realpath(__DIR__);
    $archivo = realpath($_SERVER['SCRIPT_FILENAME'] ?? '');
    $direccion = str_replace('\\', '/', $_SERVER['SCRIPT_NAME'] ?? '');

    if ($raiz !== false && $archivo !== false && str_starts_with($archivo, $raiz)) {
        $dentro = str_replace('\\', '/', substr($archivo, strlen($raiz)));
        if ($dentro !== '' && str_ends_with($direccion, $dentro)) {
            $base = substr($direccion, 0, strlen($direccion) - strlen($dentro));
        }
    }

    define('BASE', rtrim($base, '/'));
}
