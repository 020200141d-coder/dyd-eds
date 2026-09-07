<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fotoId = (int) ($_POST['foto_id'] ?? 0);
    $reportajeId = (int) ($_POST['reportaje_id'] ?? 0);
    $pdo = getPDO();

    $stmt = $pdo->prepare('SELECT url_foto FROM reportajes_fotos WHERE id = ?');
    $stmt->execute([$fotoId]);
    $foto = $stmt->fetch();
    if ($foto) {
        $pdo->prepare('DELETE FROM reportajes_fotos WHERE id = ?')->execute([$fotoId]);
        deleteUploadedFile(__DIR__ . '/../uploads/reportajes_fotos', $foto['url_foto']);
        flash('success', 'Foto eliminada.');
    }
    redirect('fotos.php?id=' . $reportajeId);
}
redirect('index.php');
