<?php
require_once __DIR__ . '/../config/Conexion.php';

/**
 * Restablecimiento de contrasena. Hay dos caminos, y los dos terminan en la
 * misma pantalla de contrasena nueva:
 *
 * - ENLACE: se pide desde "olvide mi contrasena" y se manda por correo. Dura
 *   una hora. Solo sirve si el servidor puede enviar correo.
 *
 * - CODIGO: se genera desde el panel mientras uno todavia tiene acceso y se
 *   guarda aparte (en papel, en el gestor de contrasenas). Sirve cuando el
 *   servidor NO manda correos, que es el caso de casi todos los alojamientos
 *   gratuitos: sin esto, olvidar la contrasena dejaria el panel cerrado para
 *   siempre y habria que entrar a arreglarlo por phpMyAdmin.
 *
 * En los dos casos la base guarda solo el hash: aunque alguien lea la tabla,
 * no puede reconstruir ni el enlace ni el codigo. Los dos sirven una sola vez.
 */
class Recuperacion
{
    private const VIGENCIA_MINUTOS = 60;

    // El codigo se escribe a mano, asi que se arma con un alfabeto sin
    // caracteres que se confundan al leerlos: sin I, O, 0 ni 1.
    private const LETRAS = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    private const GRUPOS = 4;
    private const LARGO_GRUPO = 5;

    /**
     * Registra un pedido y devuelve el token en claro, que es lo unico que
     * permite completar el cambio. No se vuelve a poder leer despues.
     */
    public static function crear(int $usuarioId): string
    {
        $token = bin2hex(random_bytes(32));
        self::guardar($usuarioId, $token, 'enlace', time() + self::VIGENCIA_MINUTOS * 60);
        return $token;
    }

    /**
     * Genera el codigo de recuperacion y lo devuelve en claro. Es la unica
     * vez que se puede leer: despues solo queda su hash.
     *
     * No vence, porque su razon de ser es servir dentro de meses, el dia que
     * alguien olvide la contrasena. Lo que lo limita es el uso: sirve una vez
     * y hay que generar otro.
     */
    public static function crearCodigo(int $usuarioId): string
    {
        $grupos = [];
        for ($g = 0; $g < self::GRUPOS; $g++) {
            $grupo = '';
            for ($i = 0; $i < self::LARGO_GRUPO; $i++) {
                $grupo .= self::LETRAS[random_int(0, strlen(self::LETRAS) - 1)];
            }
            $grupos[] = $grupo;
        }
        $codigo = implode('-', $grupos);

        self::guardar($usuarioId, self::normalizar($codigo), 'codigo', strtotime('+5 years'));
        return $codigo;
    }

    /** Si la persona ya tiene un codigo sin usar. No dice cual, solo si hay. */
    public static function hayCodigoActivo(int $usuarioId): bool
    {
        $stmt = Conexion::obtener()->prepare(
            "SELECT 1 FROM recuperaciones
             WHERE usuario_id = ? AND tipo = 'codigo' AND usado = 0 AND expira > ? LIMIT 1"
        );
        $stmt->execute([$usuarioId, date('Y-m-d H:i:s')]);
        return (bool) $stmt->fetchColumn();
    }

    /**
     * Se escribe a mano, asi que antes de compararlo se le quitan los guiones
     * y los espacios y se pasa a mayusculas. De lo contrario "abc de" y
     * "ABCDE" serian codigos distintos.
     */
    public static function normalizar(string $codigo): string
    {
        return strtoupper(preg_replace('/[^A-Za-z0-9]/', '', $codigo));
    }

    /**
     * Guarda el pedido. Uno nuevo invalida los anteriores DEL MISMO TIPO: si
     * borrara los dos, pedir un enlace tiraria abajo el codigo que la persona
     * tiene guardado hace meses, que es justo lo que no debe pasar.
     */
    private static function guardar(int $usuarioId, string $token, string $tipo, int $vence): void
    {
        $pdo = Conexion::obtener();
        $pdo->prepare('UPDATE recuperaciones SET usado = 1 WHERE usuario_id = ? AND tipo = ? AND usado = 0')
            ->execute([$usuarioId, $tipo]);

        $pdo->prepare('INSERT INTO recuperaciones (usuario_id, token_hash, tipo, expira) VALUES (?,?,?,?)')
            ->execute([$usuarioId, hash('sha256', $token), $tipo, date('Y-m-d H:i:s', $vence)]);
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

    /**
     * Comprueba el codigo contra el correo que dice la persona.
     *
     * Se piden los dos a proposito: el codigo por si solo ya es dificil de
     * adivinar, pero exigir tambien el correo evita que alguien que encontro
     * un codigo tirado sepa siquiera de que cuenta es.
     */
    public static function comprobarCodigo(string $email, string $codigo): ?array
    {
        $stmt = Conexion::obtener()->prepare(
            "SELECT r.*, u.email
             FROM recuperaciones r
             JOIN usuarios u ON u.id = r.usuario_id
             WHERE r.token_hash = ? AND r.tipo = 'codigo' AND r.usado = 0 AND r.expira > ?
             LIMIT 1"
        );
        $stmt->execute([hash('sha256', self::normalizar($codigo)), date('Y-m-d H:i:s')]);
        $fila = $stmt->fetch();

        if (!$fila) {
            return null;
        }
        // hash_equals compara en tiempo constante: no deja deducir el correo
        // a partir de cuanto tarda en responder.
        if (!hash_equals(strtolower($fila['email']), strtolower(trim($email)))) {
            return null;
        }
        return $fila;
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
