<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    $pdo = getPDO();
    $stmt = $pdo->prepare('SELECT foto FROM noticias WHERE id = ?');
    $stmt->execute([$id]);
    $noticia = $stmt->fetch();
    if ($noticia) {
        $pdo->prepare('DELETE FROM noticias WHERE id = ?')->execute([$id]);
        deleteUploadedFile(__DIR__ . '/../uploads/noticias', $noticia['foto']);
        flash('success', 'Noticia eliminada.');
    }
}
redirect('index.php');
