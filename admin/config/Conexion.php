<?php

class Conexion
{
    private static ?PDO $pdo = null;

    public static function obtener(): PDO
    {
        if (self::$pdo === null) {
            $host = 'localhost';
            $bd = 'dyd';
            $usuario = 'root';
            $clave = '';

            $dsn = 'mysql:host=' . $host . ';dbname=' . $bd . ';charset=utf8mb4';
            self::$pdo = new PDO($dsn, $usuario, $clave, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        }
        return self::$pdo;
    }
}
