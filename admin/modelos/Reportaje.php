<?php
require_once __DIR__ . '/../config/Conexion.php';
require_once __DIR__ . '/Destacado.php';

class Reportaje
{
    public static function listar(): array
    {
        return Conexion::obtener()->query(
            "SELECT r.*, a.nombre AS autor_nombre, u.nombre_completo AS usuario_nombre
             FROM reportajes r
             LEFT JOIN autores a ON a.id = r.autor_id
             LEFT JOIN usuarios u ON u.id = r.usuario_id
             ORDER BY r.fecha_publicacion DESC"
        )->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM reportajes WHERE id = ?');
        $stmt->execute([$id]);
        $reportaje = $stmt->fetch();
        return $reportaje ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare(
            'INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, pdf_adjunto, fecha_publicacion, es_destacado, autor_id, usuario_id, estado)
             VALUES (?,?,?,?,?,?,?,?,?,?)'
        );
        $stmt->execute([
            $datos['titulo'], $datos['resumen_corto'], $datos['desarrollo'],
            $datos['foto_principal'], $datos['pdf_adjunto'], $datos['fecha_publicacion'],
            $datos['es_destacado'], $datos['autor_id'], $datos['usuario_id'],
            $datos['estado'],
        ]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare(
            'UPDATE reportajes SET titulo=?, resumen_corto=?, desarrollo=?, foto_principal=?, pdf_adjunto=?, fecha_publicacion=?, es_destacado=?, autor_id=?, estado=? WHERE id=?'
        );
        $stmt->execute([
            $datos['titulo'], $datos['resumen_corto'], $datos['desarrollo'],
            $datos['foto_principal'], $datos['pdf_adjunto'], $datos['fecha_publicacion'],
            $datos['es_destacado'], $datos['autor_id'], $datos['estado'], $id,
        ]);
    }

    public static function marcarDestacado(int $id): void
    {
        Destacado::marcar('reportajes', $id);
    }

    public static function quitarDestacado(int $id): void
    {
        Destacado::quitar('reportajes', $id);
    }

    public static function eliminar(int $id): void
    {
        $pdo = Conexion::obtener();
        $pdo->prepare('DELETE FROM reportajes_fotos WHERE reportaje_id = ?')->execute([$id]);
        $pdo->prepare('DELETE FROM reportajes WHERE id = ?')->execute([$id]);
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM reportajes')->fetchColumn();
    }

    public static function ultimos(int $cantidad = 8): array
    {
        $stmt = Conexion::obtener()->prepare(
            "SELECT r.id, r.titulo, r.fecha_publicacion, r.es_destacado, u.nombre_completo AS usuario_nombre
             FROM reportajes r
             LEFT JOIN usuarios u ON u.id = r.usuario_id
             ORDER BY r.created_at DESC
             LIMIT ?"
        );
        $stmt->bindValue(1, $cantidad, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    // --- fotos adicionales (reportajes_fotos) ---

    public static function listarFotos(int $reportajeId): array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM reportajes_fotos WHERE reportaje_id = ? ORDER BY orden, id');
        $stmt->execute([$reportajeId]);
        return $stmt->fetchAll();
    }

    public static function agregarFoto(int $reportajeId, string $urlFoto, ?string $descripcion): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('SELECT COALESCE(MAX(orden), 0) FROM reportajes_fotos WHERE reportaje_id = ?');
        $stmt->execute([$reportajeId]);
        $orden = (int) $stmt->fetchColumn() + 1;

        $stmt = $pdo->prepare('INSERT INTO reportajes_fotos (reportaje_id, url_foto, orden, descripcion) VALUES (?,?,?,?)');
        $stmt->execute([$reportajeId, $urlFoto, $orden, $descripcion]);
        return (int) $pdo->lastInsertId();
    }

    public static function obtenerFoto(int $fotoId): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM reportajes_fotos WHERE id = ?');
        $stmt->execute([$fotoId]);
        $foto = $stmt->fetch();
        return $foto ?: null;
    }

    public static function eliminarFoto(int $fotoId): void
    {
        Conexion::obtener()->prepare('DELETE FROM reportajes_fotos WHERE id = ?')->execute([$fotoId]);
    }
}
