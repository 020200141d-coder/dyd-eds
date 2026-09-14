<?php
require_once __DIR__ . '/Conexion.php';

class Noticia
{
    public static function mostrar_recientes(int $cantidad = 3): array
    {
        $stmt = Conexion::obtener()->prepare(
            "SELECT * FROM noticias WHERE estado = 'publicado' ORDER BY fecha_publicacion DESC, id DESC LIMIT ?"
        );
        $stmt->bindValue(1, $cantidad, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function mostrar_todos(): array
    {
        return Conexion::obtener()->query(
            "SELECT * FROM noticias WHERE estado = 'publicado' ORDER BY fecha_publicacion DESC, id DESC"
        )->fetchAll();
    }
}
