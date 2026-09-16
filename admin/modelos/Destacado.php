<?php
require_once __DIR__ . '/../config/Conexion.php';

/**
 * Marca de "destacado" compartida por todos los modulos.
 *
 * La portada muestra un solo reportaje, un solo boletin, un solo podcast y
 * un solo video, asi que quien publica necesita decidir cual de todos sale.
 * Esa decision es la misma en los cinco modulos y la regla tambien: al
 * marcar uno hay que desmarcar el anterior, porque tener dos marcados no
 * significa nada y solo confunde.
 *
 * Por eso vive aqui una sola vez y cada modelo la reusa, en vez de repetir
 * la misma transaccion cinco veces.
 */
class Destacado
{
    /**
     * Tablas que aceptan la marca.
     *
     * El nombre de la tabla no se puede mandar como parametro de una
     * sentencia preparada: se concatena al SQL. Por eso solo se aceptan
     * nombres de esta lista y nunca lo que llegue del navegador.
     */
    private const TABLAS = ['reportajes', 'noticias', 'boletines', 'podcasts', 'videos'];

    private static function validar(string $tabla): string
    {
        if (!in_array($tabla, self::TABLAS, true)) {
            throw new InvalidArgumentException('Tabla no permitida: ' . $tabla);
        }
        return $tabla;
    }

    /**
     * Deja a este registro como el destacado de su seccion y le quita la
     * marca a cualquier otro. Va en una transaccion para que nunca queden
     * dos marcados ni ninguno, aunque algo falle a mitad de camino.
     */
    public static function marcar(string $tabla, int $id): void
    {
        $tabla = self::validar($tabla);
        $pdo = Conexion::obtener();
        $pdo->beginTransaction();
        try {
            $pdo->exec("UPDATE $tabla SET es_destacado = 0 WHERE es_destacado = 1");
            $pdo->prepare("UPDATE $tabla SET es_destacado = 1 WHERE id = ?")->execute([$id]);
            $pdo->commit();
        } catch (Throwable $e) {
            $pdo->rollBack();
            throw $e;
        }
    }

    public static function quitar(string $tabla, int $id): void
    {
        $tabla = self::validar($tabla);
        Conexion::obtener()->prepare("UPDATE $tabla SET es_destacado = 0 WHERE id = ?")->execute([$id]);
    }
}
