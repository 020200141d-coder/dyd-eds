<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    $pdo = getPDO();
    $stmt = $pdo->prepare('SELECT foto FROM invitados WHERE id = ?');
    $stmt->execute([$id]);
    $invitado = $stmt->fetch();
    if ($invitado) {
        $pdo->prepare('DELETE FROM invitados WHERE id = ?')->execute([$id]);
        deleteUploadedFile(__DIR__ . '/../uploads/invitados', $invitado['foto']);
        flash('success', 'Invitado eliminado.');
    }
}
redirect('index.php');
