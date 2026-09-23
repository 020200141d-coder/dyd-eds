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
 * Los cuatro valores se copian TAL CUAL del panel. Dos avisos:
 *
 * 1. El servidor no siempre es "localhost". En muchos hostings gratuitos la
 *    base vive en otra maquina y el panel muestra algo como
 *    "sql123.infinityfree.com". Si pones localhost cuando no lo es, el sitio
 *    responde "Connection refused" o "Access denied". Copia el que diga el
 *    panel, aunque sea largo.
 *
 * 2. En un hosting compartido, el panel le pone adelante tu usuario de cuenta
 *    tanto a la base como al usuario de la base. Si tu cuenta es "if0_12345",
 *    la base "dyd" se llama en realidad "if0_12345_dyd". No inventes los
 *    nombres: copia los que aparecen en la lista.
 *
 * En una instalacion local (XAMPP) NO hace falta crear este archivo: sin el,
 * bd.php usa root sin contrasena, que es lo que trae XAMPP.
 */

return [
    'host'    => 'sql123.ejemplo-hosting.com',
    'base'    => 'if0_12345678_dyd',
    'usuario' => 'if0_12345678',
    'clave'   => 'LaClaveQueCreasteEnElPanel',
];
