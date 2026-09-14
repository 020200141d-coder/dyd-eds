<?php
require_once __DIR__ . '/../config/Conexion.php';

/**
 * Restablecimiento de contrasena por token.
 *
 * El token viaja en el enlace que recibe la persona, pero en la base solo se
 * guarda su hash: aunque alguien lea la tabla no puede reconstruir el enlace.
 * Cada pedido vence en una hora y sirve una sola vez.
 */
class Recuperacion
{
    private const VIGENCIA_MINUTOS = 60;

    /**
     * Registra un pedido y devuelve el token en claro, que es lo unico que
     * permite completar el cambio. No se vuelve a poder leer despues.
     */
    public static function crear(int $usuarioId): string
    {
        $pdo = Conexion::obtener();

        // Un pedido nuevo invalida los anteriores de esa persona.
        $pdo->prepare('UPDATE recuperaciones SET usado = 1 WHERE usuario_id = ? AND usado = 0')
            ->execute([$usuarioId]);

        $token = bin2hex(random_bytes(32));
        $expira = date('Y-m-d H:i:s', time() + self::VIGENCIA_MINUTOS * 60);

        $pdo->prepare('INSERT INTO recuperaciones (usuario_id, token_hash, expira) VALUES (?,?,?)')
            ->execute([$usuarioId, hash('sha256', $token), $expira]);

        return $token;
    }

    /** Devuelve el pedido vigente que corresponde al token, o null. */
    public static function buscarVigente(string $token): ?array
    {
        $stmt = Conexion::obtener()->prepare(
            'SELECT r.*, u.email, u.nombre_completo
             FROM recuperaciones r
             JOIN usuarios u ON u.id = r.usuario_id
             WHERE r.token_hash = ? AND r.usado = 0 AND r.expira > ?
             LIMIT 1'
        );
        // La hora la pone PHP, que es la misma que calculo el vencimiento;
        // asi no importa si el servidor de base de datos usa otra zona.
        $stmt->execute([hash('sha256', $token), date('Y-m-d H:i:s')]);
        $fila = $stmt->fetch();
        return $fila ?: null;
    }

    /** Cambia la contrasena y quema el token, todo o nada. */
    public static function aplicar(int $recuperacionId, int $usuarioId, string $claveNueva): void
    {
        $pdo = Conexion::obtener();
        $pdo->beginTransaction();
        try {
            $pdo->prepare('UPDATE usuarios SET password_hash = ? WHERE id = ?')
                ->execute([hash('sha256', $claveNueva), $usuarioId]);
            $pdo->prepare('UPDATE recuperaciones SET usado = 1 WHERE id = ?')
                ->execute([$recuperacionId]);
            $pdo->commit();
        } catch (Throwable $e) {
            $pdo->rollBack();
            throw $e;
        }
    }

    /** Busca a quien pertenece un correo, sin revelar nada al que pregunta. */
    public static function usuarioPorEmail(string $email): ?array
    {
        $stmt = Conexion::obtener()->prepare('SELECT id, email, nombre_completo FROM usuarios WHERE email = ? LIMIT 1');
        $stmt->execute([$email]);
        $fila = $stmt->fetch();
        return $fila ?: null;
    }
}
