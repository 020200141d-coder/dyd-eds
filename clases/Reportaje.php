<?php
require_once __DIR__ . '/Conexion.php';

class Reportaje
{
    private const POR_PAGINA = 6;

    public static function mostrar_destacado(): ?array
    {
        $sql = "SELECT r.*, a.nombre AS autor_nombre
                FROM reportajes r
                LEFT JOIN autores a ON a.id = r.autor_id
                ORDER BY r.es_destacado DESC, r.fecha_publicacion DESC, r.id DESC
                LIMIT 1";
        $fila = Conexion::obtener()->query($sql)->fetch();
        return $fila ?: null;
    }

    public static function mostrar_todos(int $pagina = 1, ?int $excluirId = null): array
    {
        $pdo = Conexion::obtener();
        $offset = ($pagina - 1) * self::POR_PAGINA;

        $condicion = $excluirId ? 'WHERE r.id != :excluir' : '';
        $sql = "SELECT r.*, a.nombre AS autor_nombre
                FROM reportajes r
                LEFT JOIN autores a ON a.id = r.autor_id
                $condicion
                ORDER BY r.fecha_publicacion DESC, r.id DESC
                LIMIT :limite OFFSET :offset";
        $stmt = $pdo->prepare($sql);
        if ($excluirId) {
            $stmt->bindValue(':excluir', $excluirId, PDO::PARAM_INT);
        }
        $stmt->bindValue(':limite', self::POR_PAGINA, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function contar_total(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM reportajes')->fetchColumn();
    }

    public static function total_paginas(): int
    {
        return (int) max(1, ceil(self::contar_total() / self::POR_PAGINA));
    }

    public static function mostrar_uno(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare(
            "SELECT r.*, a.nombre AS autor_nombre
             FROM reportajes r
             LEFT JOIN autores a ON a.id = r.autor_id
             WHERE r.id = ?"
        );
        $stmt->execute([$id]);
        $fila = $stmt->fetch();
        return $fila ?: null;
    }

    public static function mostrar_fotos(int $reportajeId): array
    {
        $stmt = Conexion::obtener()->prepare(
            'SELECT * FROM reportajes_fotos WHERE reportaje_id = ? ORDER BY orden, id'
        );
        $stmt->execute([$reportajeId]);
        return $stmt->fetchAll();
    }
}
