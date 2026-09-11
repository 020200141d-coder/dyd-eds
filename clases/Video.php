<?php
require_once __DIR__ . '/Conexion.php';

class Video
{
    public static function mostrar_todos(): array
    {
        return Conexion::obtener()->query(
            'SELECT * FROM videos ORDER BY fecha_publicacion DESC, id DESC'
        )->fetchAll();
    }
}
