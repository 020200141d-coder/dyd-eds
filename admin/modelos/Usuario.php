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
        $stmt = $pdo->prepare('SELECT id, nombre_completo, email, rol, pregunta FROM usuarios WHERE id = ?');
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

    /**
     * Normaliza la respuesta antes de compararla: quien la escribe hoy y
     * quien la escribe dentro de seis meses no va a poner las mismas
     * mayusculas ni los mismos espacios. Se comparan los hashes, no el texto.
     */
    public static function normalizarRespuesta(string $r): string
    {
        return mb_strtolower(trim(preg_replace('/\s+/', ' ', $r)), 'UTF-8');
    }

    public static function guardarPregunta(int $id, string $pregunta, string $respuesta): void
    {
        Conexion::obtener()->prepare('UPDATE usuarios SET pregunta = ?, respuesta_hash = ? WHERE id = ?')
            ->execute([$pregunta, hash('sha256', self::normalizarRespuesta($respuesta)), $id]);
    }

    /** La pregunta de esa cuenta, o null si nunca configuro una. */
    public static function preguntaDe(string $email): ?array
    {
        $stmt = Conexion::obtener()->prepare(
            'SELECT id, pregunta FROM usuarios WHERE email = ? AND pregunta IS NOT NULL AND pregunta <> "" LIMIT 1'
        );
        $stmt->execute([trim($email)]);
        $fila = $stmt->fetch();
        return $fila ?: null;
    }

    /** Comprueba la respuesta. Devuelve el id si acierta, null si no. */
    public static function comprobarRespuesta(string $email, string $respuesta): ?int
    {
        $stmt = Conexion::obtener()->prepare(
            'SELECT id, respuesta_hash FROM usuarios WHERE email = ? LIMIT 1'
        );
        $stmt->execute([trim($email)]);
        $fila = $stmt->fetch();
        if (!$fila || empty($fila['respuesta_hash'])) {
            return null;
        }
        // hash_equals compara en tiempo constante: no deja adivinar la
        // respuesta midiendo cuanto tarda en contestar.
        return hash_equals($fila['respuesta_hash'], hash('sha256', self::normalizarRespuesta($respuesta)))
            ? (int) $fila['id'] : null;
    }

    /** Cambia solo la contrasena, sin tocar el resto del perfil. */
    public static function cambiarClave(int $id, string $clave): void
    {
        Conexion::obtener()->prepare('UPDATE usuarios SET password_hash = ? WHERE id = ?')
            ->execute([hash('sha256', $clave), $id]);
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
