<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireAdmin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    if ($id === (int) currentUser()['id']) {
        flash('error', 'No puedes eliminar tu propio usuario.');
    } else {
        try {
            $stmt = getPDO()->prepare('DELETE FROM usuarios WHERE id = ?');
            $stmt->execute([$id]);
            flash('success', 'Usuario eliminado.');
        } catch (PDOException $e) {
            flash('error', 'No se puede eliminar: el usuario tiene contenido publicado asociado.');
        }
    }
}
redirect('index.php');
