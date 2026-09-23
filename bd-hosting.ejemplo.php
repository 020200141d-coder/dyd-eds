<?php
/**
 * PLANTILLA. Copia este archivo como bd-hosting.php (sin ".ejemplo") en el
 * servidor y reemplaza los cuatro valores por los que da el panel del
 * hosting, en cPanel -> MySQL Databases.
 *
 * bd-hosting.php esta en el .gitignore: no se sube nunca a GitHub, asi la
 * clave del servidor no queda en el repositorio. Este archivo de ejemplo si
 * se versiona, porque no tiene ninguna clave de verdad.
 *
 * Ojo con los nombres: en un hosting compartido, cPanel le pone adelante tu
 * usuario de cuenta tanto a la base como al usuario de la base. Si tu cuenta
 * es "mivuser", la base "dyd" se llama en realidad "mivuser_dyd". Copia los
 * nombres exactos que muestra el panel, no los de XAMPP.
 *
 * En una instalacion local (XAMPP) NO hace falta crear este archivo: sin el,
 * bd.php usa root sin contrasena, que es lo que trae XAMPP.
 */

return [
    'host'    => 'localhost',
    'base'    => 'mivuser_dyd',
    'usuario' => 'mivuser_dyd',
    'clave'   => 'LaClaveQueCreasteEnCpanel',
];
