<?php
/**
 * Datos de conexion a la base de datos, en un solo lugar.
 *
 * Los dos Conexion.php (el del panel y el del sitio publico) leen de aqui.
 * Siguen siendo dos clases separadas a proposito —el sitio publico no debe
 * poder escribir— pero el servidor, el usuario y la clave son los mismos,
 * y tenerlos repetidos en dos archivos hacia que mover el proyecto a otra
 * computadora o a un hosting fuera cambiar lo mismo dos veces, con el
 * riesgo de cambiar uno y olvidar el otro.
 *
 * Los valores de abajo son los de XAMPP, asi que en una instalacion local
 * no hay que tocar nada. En un hosting, el panel del servicio da otro
 * servidor, otro usuario, otra clave y casi siempre otro nombre de base
 * (algo como "usuario_dyd"): se reemplazan aqui y listo.
 *
 * Si el hosting permite variables de entorno, es mejor usarlas: la clave
 * queda fuera del codigo y no se sube al repositorio. Si no existen, se
 * usan igual los valores de abajo.
 */

return [
    'host'    => getenv('DYD_BD_HOST')    ?: 'localhost',
    'base'    => getenv('DYD_BD_NOMBRE')  ?: 'dyd',
    'usuario' => getenv('DYD_BD_USUARIO') ?: 'root',
    'clave'   => getenv('DYD_BD_CLAVE')   ?: '',
];
