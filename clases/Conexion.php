<?php
// Conexion de solo lectura para el sitio publico. Separada de admin/config/Conexion.php
// a proposito: el sitio publico nunca debe poder escribir en la base de datos.

class Conexion
{
    private static ?PDO $pdo = null;

    public static function obtener(): PDO
    {
        if (self::$pdo === null) {
            self::$pdo = new PDO('mysql:host=localhost;dbname=dyd;charset=utf8mb4', 'root', '', [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        }
        return self::$pdo;
    }
}
