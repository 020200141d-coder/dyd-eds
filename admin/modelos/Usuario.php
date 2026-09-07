<?php
require_once __DIR__ . '/../config/Conexion.php';

class Usuario
{
    public static function verificarLogin(string $email, string $clave): ?array
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('SELECT * FROM usuarios WHERE email = ? LIMIT 1');
        $stmt->execute([$email]);
        $usuario = $stmt->fetch();

        if (!$usuario) {
            return null;
        }
        if (!hash_equals($usuario['password_hash'], hash('sha256', $clave))) {
            return null;
        }

        unset($usuario['password_hash']);
        return $usuario;
    }

    public static function listar(): array
    {
        $pdo = Conexion::obtener();
        return $pdo->query('SELECT id, nombre_completo, email, rol, created_at FROM usuarios ORDER BY nombre_completo')->fetchAll();
    }

    public static function obtener(int $id): ?array
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('SELECT id, nombre_completo, email, rol FROM usuarios WHERE id = ?');
        $stmt->execute([$id]);
        $usuario = $stmt->fetch();
        return $usuario ?: null;
    }

    public static function crear(array $datos): int
    {
        $pdo = Conexion::obtener();
        $stmt = $pdo->prepare('INSERT INTO usuarios (nombre_completo, email, password_hash, rol) VALUES (?,?,?,?)');
        $stmt->execute([
            $datos['nombre_completo'],
            $datos['email'],
            hash('sha256', $datos['clave']),
            $datos['rol'],
        ]);
        return (int) $pdo->lastInsertId();
    }

    public static function actualizar(int $id, array $datos): void
    {
        $pdo = Conexion::obtener();
        if (!empty($datos['clave'])) {
            $stmt = $pdo->prepare('UPDATE usuarios SET nombre_completo=?, email=?, rol=?, password_hash=? WHERE id=?');
            $stmt->execute([$datos['nombre_completo'], $datos['email'], $datos['rol'], hash('sha256', $datos['clave']), $id]);
        } else {
            $stmt = $pdo->prepare('UPDATE usuarios SET nombre_completo=?, email=?, rol=? WHERE id=?');
            $stmt->execute([$datos['nombre_completo'], $datos['email'], $datos['rol'], $id]);
        }
    }

    public static function actualizarPerfil(int $id, array $datos): void
    {
        $pdo = Conexion::obtener();
        if (!empty($datos['clave'])) {
            $stmt = $pdo->prepare('UPDATE usuarios SET nombre_completo=?, email=?, password_hash=? WHERE id=?');
            $stmt->execute([$datos['nombre_completo'], $datos['email'], hash('sha256', $datos['clave']), $id]);
        } else {
            $stmt = $pdo->prepare('UPDATE usuarios SET nombre_completo=?, email=? WHERE id=?');
            $stmt->execute([$datos['nombre_completo'], $datos['email'], $id]);
        }
    }

    public static function eliminar(int $id): bool
    {
        $pdo = Conexion::obtener();
        try {
            $stmt = $pdo->prepare('DELETE FROM usuarios WHERE id = ?');
            $stmt->execute([$id]);
            return true;
        } catch (PDOException $e) {
            return false;
        }
    }

    public static function contar(): int
    {
        return (int) Conexion::obtener()->query('SELECT COUNT(*) FROM usuarios')->fetchColumn();
    }

    public static function emailExiste(string $email, ?int $ignorarId = null): bool
    {
        $pdo = Conexion::obtener();
        if ($ignorarId) {
            $stmt = $pdo->prepare('SELECT COUNT(*) FROM usuarios WHERE email = ? AND id != ?');
            $stmt->execute([$email, $ignorarId]);
        } else {
            $stmt = $pdo->prepare('SELECT COUNT(*) FROM usuarios WHERE email = ?');
            $stmt->execute([$email]);
        }
        return (int) $stmt->fetchColumn() > 0;
    }
}
