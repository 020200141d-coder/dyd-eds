<?php
require_once __DIR__ . '/../config/Conexion.php';

class Invitado
{
    public static function listar(): array
    {
        return Conexion::obtener()->query('SELECT * FROM invitados ORDER BY nombre')->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT * FROM invitados WHERE id = ?');
        $stmt->execute([$id]);
        $invitado = $stmt->fetch();
        return $invitado ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO invitados (nombre, cargo, foto) VALUES (?,?,?)');
        $stmt->execute([$datos['nombre'], $datos['cargo'], $datos['foto']]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $stmt = Conexion::obtener()->prepare('UPDATE invitados SET nombre=?, cargo=?, foto=? WHERE id=?');
        $stmt->execute([$datos['nombre'], $datos['cargo'], $datos['foto'], $id]);
    }

    public static function eliminar(int $id): void
    {
        Conexion::obtener()->prepare('DELETE FROM invitados WHERE id = ?')->execute([$id]);
    }
}
