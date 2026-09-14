<?php
require_once __DIR__ . '/Conexion.php';

class Boletin
{
    public static function mostrar_ultimo(): ?array
    {
        $fila = Conexion::obtener()->query(
            "SELECT * FROM boletines WHERE estado = 'publicado' ORDER BY fecha_publicacion DESC, id DESC LIMIT 1"
        )->fetch();
        return $fila ?: null;
    }

    public static function mostrar_todos(): array
    {
        return Conexion::obtener()->query(
            "SELECT * FROM boletines WHERE estado = 'publicado' ORDER BY fecha_publicacion DESC, id DESC"
        )->fetchAll();
    }
}
