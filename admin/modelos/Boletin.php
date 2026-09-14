<?php
require_once __DIR__ . '/../config/Conexion.php';

class Boletin
{
    public static function listar(): array
    {
        return Conexion::obtener()->query(
            'SELECT b.*, u.nombre_completo AS usuario_nombre FROM boletines b
             LEFT JOIN usuarios u ON u.id = b.usuario_id
             ORDER BY b.fecha_publicacion DESC'
        )->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM boletines WHERE id = ?');
        $stmt->execute([$id]);
        $boletin = $stmt->fetch();
        return $boletin ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id, estado) VALUES (?,?,?,?,?,?,?)');
        $stmt->execute([
            $datos['numero_boletin'], $datos['resumen'], $datos['foto_portada'],
            $datos['archivo_pdf'], $datos['fecha_publicacion'], $datos['usuario_id'],
            $datos['estado'],
        ]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE boletines SET numero_boletin=?, resumen=?, foto_portada=?, archivo_pdf=?, fecha_publicacion=?, estado=? WHERE id=?');
        $stmt->execute([
            $datos['numero_boletin'], $datos['resumen'], $datos['foto_portada'],
            $datos['archivo_pdf'], $datos['fecha_publicacion'], $datos['estado'], $id,
        ]);
    }

    public static function eliminar(int $id): void
    {
        Conexion::obtener()->prepare('DELETE FROM boletines WHERE id = ?')->execute([$id]);
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM boletines')->fetchColumn();
    }

    public static function numeroExiste(string $numero, ?int $ignorarId = null): bool
    {
        $pdo = Conexion::obtener();
        if ($ignorarId) {
            $stmt = $pdo->prepare('SELECT COUNT(*) FROM boletines WHERE numero_boletin = ? AND id != ?');
            $stmt->execute([$numero, $ignorarId]);
        } else {
            $stmt = $pdo->prepare('SELECT COUNT(*) FROM boletines WHERE numero_boletin = ?');
            $stmt->execute([$numero]);
        }
        return (int) $stmt->fetchColumn() > 0;
    }
}
