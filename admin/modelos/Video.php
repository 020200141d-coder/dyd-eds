<?php
require_once __DIR__ . '/../config/Conexion.php';

class Video
{
    public static function listar(): array
    {
        $pdo = Conexion::obtener();
        $videos = $pdo->query(
            'SELECT v.*, u.nombre_completo AS usuario_nombre FROM videos v
             LEFT JOIN usuarios u ON u.id = v.usuario_id
             ORDER BY v.fecha_publicacion DESC'
        )->fetchAll();

        $filas = $pdo->query(
            'SELECT vi.video_id, i.nombre FROM video_invitados vi
             JOIN invitados i ON i.id = vi.invitado_id'
        )->fetchAll();
        $invitadosPorVideo = [];
        foreach ($filas as $fila) {
            $invitadosPorVideo[$fila['video_id']][] = $fila['nombre'];
        }
        foreach ($videos as &$v) {
            $v['invitados'] = $invitadosPorVideo[$v['id']] ?? [];
        }
        return $videos;
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM videos WHERE id = ?');
        $stmt->execute([$id]);
        $video = $stmt->fetch();
        return $video ?: null;
    }

    public static function invitadosDe(int $id): array
    {
        $stmt = Conexion::obtener()->prepare('SELECT invitado_id FROM video_invitados WHERE video_id = ?');
        $stmt->execute([$id]);
        return array_column($stmt->fetchAll(), 'invitado_id');
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO videos (titulo, url_embed, fecha_publicacion, usuario_id) VALUES (?,?,?,?)');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['usuario_id']]);
        $id = (int) $pdo->lastInsertId();
        self::guardarInvitados($id, $datos['invitados'] ?? []);
        return $id;
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE videos SET titulo=?, url_embed=?, fecha_publicacion=? WHERE id=?');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $id]);
        self::guardarInvitados($id, $datos['invitados'] ?? []);
    }

    private static function guardarInvitados(int $videoId, array $invitadoIds): void
    {
        $pdo = Conexion::obtener();
        $pdo->prepare('DELETE FROM video_invitados WHERE video_id = ?')->execute([$videoId]);
        $stmt = $pdo->prepare('INSERT INTO video_invitados (video_id, invitado_id) VALUES (?, ?)');
        foreach ($invitadoIds as $invitadoId) {
            $stmt->execute([$videoId, (int) $invitadoId]);
        }
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
