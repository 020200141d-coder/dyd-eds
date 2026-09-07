<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    try {
        $stmt = getPDO()->prepare('DELETE FROM autores WHERE id = ?');
        $stmt->execute([$id]);
        flash('success', 'Autor eliminado.');
    } catch (PDOException $e) {
        flash('error', 'No se puede eliminar: el autor tiene reportajes asociados.');
    }
}
redirect('index.php');
