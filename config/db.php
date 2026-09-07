<?php
// Configuración de conexión a la base de datos (XAMPP por defecto)
// Ajusta estos valores si tu MySQL tiene usuario/clave distintos.
define('DB_HOST', 'localhost');
define('DB_NAME', 'revista_digital');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_CHARSET', 'utf8mb4');

function getPDO(): PDO
{
    static $pdo = null;
    if ($pdo === null) {
        $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET;
        try {
            $pdo = new PDO($dsn, DB_USER, DB_PASS, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        } catch (PDOException $e) {
            die('Error de conexión a la base de datos. Verifica que MySQL (XAMPP) esté encendido y que la base "revista_digital" exista (importa sql/schema.sql). Detalle: ' . $e->getMessage());
        }
    }
    return $pdo;
}
