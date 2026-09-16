<?php
require_once __DIR__ . '/../config/Conexion.php';
require_once __DIR__ . '/Destacado.php';

class Video
{
    public static function listar(): array
    {
        return Conexion::obtener()->query(
            'SELECT v.*, u.nombre_completo AS usuario_nombre FROM videos v
             LEFT JOIN usuarios u ON u.id = v.usuario_id
             ORDER BY v.fecha_publicacion DESC'
        )->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM videos WHERE id = ?');
        $stmt->execute([$id]);
        $video = $stmt->fetch();
        return $video ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO videos (titulo, url_embed, fecha_publicacion, usuario_id, estado) VALUES (?,?,?,?,?)');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['usuario_id'], $datos['estado']]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE videos SET titulo=?, url_embed=?, fecha_publicacion=?, estado=? WHERE id=?');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['estado'], $id]);
    }

    public static function marcarDestacado(int $id): void
    {
        Destacado::marcar('videos', $id);
    }

    public static function quitarDestacado(int $id): void
    {
        Destacado::quitar('videos', $id);
    }

    public static function eliminar(int $id): void
    {
        Conexion::obtener()->prepare('DELETE FROM videos WHERE id = ?')->execute([$id]);
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM videos')->fetchColumn();
    }
}
