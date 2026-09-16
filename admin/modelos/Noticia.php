<?php
require_once __DIR__ . '/../config/Conexion.php';
require_once __DIR__ . '/Destacado.php';

class Noticia
{
    public static function listar(): array
    {
        return Conexion::obtener()->query(
            'SELECT n.*, u.nombre_completo AS usuario_nombre FROM noticias n
             LEFT JOIN usuarios u ON u.id = n.usuario_id
             ORDER BY n.fecha_publicacion DESC'
        )->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM noticias WHERE id = ?');
        $stmt->execute([$id]);
        $noticia = $stmt->fetch();
        return $noticia ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO noticias (titulo, foto, link_externo, fecha_publicacion, usuario_id, estado) VALUES (?,?,?,?,?,?)');
        $stmt->execute([$datos['titulo'], $datos['foto'], $datos['link_externo'], $datos['fecha_publicacion'], $datos['usuario_id'], $datos['estado']]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE noticias SET titulo=?, foto=?, link_externo=?, fecha_publicacion=?, estado=? WHERE id=?');
        $stmt->execute([$datos['titulo'], $datos['foto'], $datos['link_externo'], $datos['fecha_publicacion'], $datos['estado'], $id]);
    }

    public static function marcarDestacado(int $id): void
    {
        Destacado::marcar('noticias', $id);
    }

    public static function quitarDestacado(int $id): void
    {
        Destacado::quitar('noticias', $id);
    }

    public static function eliminar(int $id): void
    {
        Conexion::obtener()->prepare('DELETE FROM noticias WHERE id = ?')->execute([$id]);
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM noticias')->fetchColumn();
    }
}
