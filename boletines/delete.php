<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    $pdo = getPDO();
    $stmt = $pdo->prepare('SELECT foto_portada, archivo_pdf FROM boletines WHERE id = ?');
    $stmt->execute([$id]);
    $boletin = $stmt->fetch();
    if ($boletin) {
        $pdo->prepare('DELETE FROM boletines WHERE id = ?')->execute([$id]);
        deleteUploadedFile(__DIR__ . '/../uploads/boletines/portada', $boletin['foto_portada']);
        deleteUploadedFile(__DIR__ . '/../uploads/boletines/pdf', $boletin['archivo_pdf']);
        flash('success', 'Boletín eliminado.');
    }
}
redirect('index.php');
