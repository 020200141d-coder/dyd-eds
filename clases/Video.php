<?php
require_once __DIR__ . '/Conexion.php';

class Video
{
    public static function mostrar_todos(): array
    {
        return Conexion::obtener()->query(
            "SELECT * FROM videos WHERE estado = 'publicado' ORDER BY fecha_publicacion DESC, id DESC"
        )->fetchAll();
    }

    /*
     * En la portada entra primero el que el panel marco como destacado y,
     * si no hay ninguno marcado, el mas reciente. Por eso el orden empieza
     * por es_destacado: no hace falta una consulta aparte ni que el panel
     * tenga que marcar algo para que la portada funcione.
     */
    public static function mostrar_recientes(int $cantidad = 4): array
    {
        $sentencia = Conexion::obtener()->prepare(
            "SELECT * FROM videos WHERE estado = 'publicado' ORDER BY es_destacado DESC, fecha_publicacion DESC, id DESC LIMIT :cantidad"
        );
        $sentencia->bindValue(':cantidad', $cantidad, PDO::PARAM_INT);
        $sentencia->execute();
        return $sentencia->fetchAll();
    }
}
