<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    $pdo = getPDO();

    $stmt = $pdo->prepare('SELECT foto_principal, pdf_adjunto FROM reportajes WHERE id = ?');
    $stmt->execute([$id]);
    $reportaje = $stmt->fetch();

    if ($reportaje) {
        $stmt = $pdo->prepare('SELECT url_foto FROM reportajes_fotos WHERE reportaje_id = ?');
        $stmt->execute([$id]);
        $fotos = $stmt->fetchAll();

        $pdo->prepare('DELETE FROM reportajes_fotos WHERE reportaje_id = ?')->execute([$id]);
        $pdo->prepare('DELETE FROM reportajes WHERE id = ?')->execute([$id]);

        deleteUploadedFile(__DIR__ . '/../uploads/reportajes', $reportaje['foto_principal']);
        deleteUploadedFile(__DIR__ . '/../uploads/reportajes', $reportaje['pdf_adjunto']);
        foreach ($fotos as $f) {
            deleteUploadedFile(__DIR__ . '/../uploads/reportajes_fotos', $f['url_foto']);
        }

        flash('success', 'Reportaje eliminado.');
    }
}
redirect('index.php');
