<?php
require_once __DIR__ . '/Conexion.php';

class Video
{
    public static function mostrar_todos(): array
    {
        return Conexion::obtener()->query(
            'SELECT * FROM videos ORDER BY fecha_publicacion DESC, id DESC'
        )->fetchAll();
    }

    public static function mostrar_recientes(int $cantidad = 4): array
    {
        $sentencia = Conexion::obtener()->prepare(
            'SELECT * FROM videos ORDER BY fecha_publicacion DESC, id DESC LIMIT :cantidad'
        );
        $sentencia->bindValue(':cantidad', $cantidad, PDO::PARAM_INT);
        $sentencia->execute();
        return $sentencia->fetchAll();
    }
}
