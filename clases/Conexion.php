<?php
// Conexion de solo lectura para el sitio publico. Separada de admin/config/Conexion.php
// a proposito: el sitio publico nunca debe poder escribir en la base de datos.
// Los datos del servidor salen de bd.php, en la raiz del proyecto.

class Conexion
{
    private static ?PDO $pdo = null;

    public static function obtener(): PDO
    {
        if (self::$pdo === null) {
            $bd = require dirname(__DIR__) . '/bd.php';

            $dsn = 'mysql:host=' . $bd['host'] . ';dbname=' . $bd['base'] . ';charset=utf8mb4';
            self::$pdo = new PDO($dsn, $bd['usuario'], $bd['clave'], [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        }
        return self::$pdo;
    }
}
