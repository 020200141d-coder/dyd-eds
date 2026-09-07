<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    getPDO()->prepare('DELETE FROM podcasts WHERE id = ?')->execute([$id]);
    flash('success', 'Podcast eliminado.');
}
redirect('index.php');
