<?php
/**
 * Datos de conexion a la base de datos, en un solo lugar.
 *
 * Los dos Conexion.php (el del panel y el del sitio publico) leen de aqui.
 * Siguen siendo dos clases separadas a proposito —el sitio publico no debe
 * poder escribir— pero el servidor, el usuario y la clave son los mismos, y
 * tenerlos repetidos en dos archivos hacia que mover el proyecto fuera
 * cambiar lo mismo dos veces, con el riesgo de cambiar uno y olvidar el otro.
 *
 * Este archivo SI va al repositorio, porque no guarda ninguna clave: los
 * valores de abajo son los de XAMPP (root sin contrasena), que son publicos
 * y solo funcionan en la propia computadora. Por eso una instalacion local
 * anda sin tocar nada.
 *
 * La clave de verdad, la del hosting, va en bd-hosting.php, que esta en el
 * .gitignore y nunca se sube a GitHub. Si ese archivo existe, manda el; si
 * no, se usan los valores de XAMPP. Asi el servidor puede hacer "git pull"
 * sin que la actualizacion le pise sus credenciales.
 *
 * Para crearlo: copia bd-hosting.ejemplo.php como bd-hosting.php y llena los
 * cuatro datos que da el panel del hosting.
 */

$valores = [
    'host'    => 'localhost',
    'base'    => 'dyd',
    'usuario' => 'root',
    'clave'   => '',
];

$propias = __DIR__ . '/bd-hosting.php';
if (is_file($propias)) {
    $valores = array_merge($valores, require $propias);
}

// Si el hosting maneja variables de entorno, tienen la ultima palabra: asi
// la clave no queda escrita en ningun archivo.
return [
    'host'    => getenv('DYD_BD_HOST')    ?: $valores['host'],
    'base'    => getenv('DYD_BD_NOMBRE')  ?: $valores['base'],
    'usuario' => getenv('DYD_BD_USUARIO') ?: $valores['usuario'],
    'clave'   => getenv('DYD_BD_CLAVE')   ?: $valores['clave'],
];
