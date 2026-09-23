<?php
// Conexion del panel: esta si escribe en la base. Separada de clases/Conexion.php
// a proposito. Los datos del servidor salen de bd.php, en la raiz del proyecto.

class Conexion
{
    private static ?PDO $pdo = null;

    public static function obtener(): PDO
    {
        if (self::$pdo === null) {
            $bd = require dirname(__DIR__, 2) . '/bd.php';

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
