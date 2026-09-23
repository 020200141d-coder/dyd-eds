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
            try {
                self::$pdo = new PDO($dsn, $bd['usuario'], $bd['clave'], [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_EMULATE_PREPARES => false,
                ]);
            } catch (PDOException $e) {
                // El error crudo de PDO no le dice nada a quien instala el
                // proyecto ("SQLSTATE[HY000] [1045]..."), y ademas una traza
                // sin controlar puede mostrar de mas. Se corta aqui con el
                // dato util: que revisar y donde.
                http_response_code(500);
                exit(
                    '<h1>No se pudo conectar a la base de datos</h1>'
                    . '<p>Revisa el servidor, el nombre de la base, el usuario y la clave.</p>'
                    . '<p>En XAMPP se configuran en <code>bd.php</code>; en un hosting, '
                    . 'en <code>bd-hosting.php</code> (se crea copiando <code>bd-hosting.ejemplo.php</code>).</p>'
                    . '<p>MySQL respondio: <code>' . htmlspecialchars($e->getMessage()) . '</code></p>'
                );
            }
        }
        return self::$pdo;
    }
}
