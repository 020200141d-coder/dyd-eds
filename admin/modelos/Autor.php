<?php
require_once __DIR__ . '/../config/Conexion.php';

class Autor
{
    public static function listar(): array
    {
        return Conexion::obtener()->query('SELECT * FROM autores ORDER BY nombre')->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM autores WHERE id = ?');
        $stmt->execute([$id]);
        $autor = $stmt->fetch();
        return $autor ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO autores (nombre) VALUES (?)');
        $stmt->execute([$datos['nombre']]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE autores SET nombre=? WHERE id=?');
        $stmt->execute([$datos['nombre'], $id]);
    }

    public static function eliminar(int $id): bool
    {
        try {
            $stmt = Conexion::obtener()->prepare('DELETE FROM autores WHERE id = ?');
            $stmt->execute([$id]);
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM autores')->fetchColumn();
    }
}
