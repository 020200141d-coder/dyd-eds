<?php
require_once __DIR__ . '/../config/Conexion.php';

class Podcast
{
    public static function listar(): array
    {
        $pdo = Conexion::obtener();
        $podcasts = $pdo->query(
            'SELECT p.*, u.nombre_completo AS usuario_nombre FROM podcasts p
             LEFT JOIN usuarios u ON u.id = p.usuario_id
             ORDER BY p.fecha_publicacion DESC'
        )->fetchAll();

        $filas = $pdo->query(
            'SELECT pi.podcast_id, i.nombre FROM podcast_invitados pi
             JOIN invitados i ON i.id = pi.invitado_id'
        )->fetchAll();
        $invitadosPorPodcast = [];
        foreach ($filas as $fila) {
            $invitadosPorPodcast[$fila['podcast_id']][] = $fila['nombre'];
        }
        foreach ($podcasts as &$p) {
            $p['invitados'] = $invitadosPorPodcast[$p['id']] ?? [];
        }
        return $podcasts;
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM podcasts WHERE id = ?');
        $stmt->execute([$id]);
        $podcast = $stmt->fetch();
        return $podcast ?: null;
    }

    public static function invitadosDe(int $id): array
    {
        $stmt = Conexion::obtener()->prepare('SELECT invitado_id FROM podcast_invitados WHERE podcast_id = ?');
        $stmt->execute([$id]);
        return array_column($stmt->fetchAll(), 'invitado_id');
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO podcasts (titulo, url_embed, fecha_publicacion, usuario_id) VALUES (?,?,?,?)');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $datos['usuario_id']]);
        $id = (int) $pdo->lastInsertId();
        self::guardarInvitados($id, $datos['invitados'] ?? []);
        return $id;
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE podcasts SET titulo=?, url_embed=?, fecha_publicacion=? WHERE id=?');
        $stmt->execute([$datos['titulo'], $datos['url_embed'], $datos['fecha_publicacion'], $id]);
        self::guardarInvitados($id, $datos['invitados'] ?? []);
    }

    private static function guardarInvitados(int $podcastId, array $invitadoIds): void
    {
        $pdo = Conexion::obtener();
        $pdo->prepare('DELETE FROM podcast_invitados WHERE podcast_id = ?')->execute([$podcastId]);
        $stmt = $pdo->prepare('INSERT INTO podcast_invitados (podcast_id, invitado_id) VALUES (?, ?)');
        foreach ($invitadoIds as $invitadoId) {
            $stmt->execute([$podcastId, (int) $invitadoId]);
        }
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
