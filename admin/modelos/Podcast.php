<?php
require_once __DIR__ . '/../config/Conexion.php';

class Podcast
{
    public static function listar(): array
    {
        return Conexion::obtener()->query(
            'SELECT p.*, u.nombre_completo AS usuario_nombre FROM podcasts p
             LEFT JOIN usuarios u ON u.id = p.usuario_id
             ORDER BY p.fecha_publicacion DESC'
        )->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM podcasts WHERE id = ?');
        $stmt->execute([$id]);
        $podcast = $stmt->fetch();
        return $podcast ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO podcasts (titulo, url_embed, fecha_publicacion, usuario_id, estado) VALUES (?,?,?,?,?)');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['usuario_id'], $datos['estado']]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE podcasts SET titulo=?, url_embed=?, fecha_publicacion=?, estado=? WHERE id=?');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['estado'], $id]);
    }

    public static function eliminar(int $id): void
    {
        Conexion::obtener()->prepare('DELETE FROM podcasts WHERE id = ?')->execute([$id]);
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM podcasts')->fetchColumn();
    }
}
