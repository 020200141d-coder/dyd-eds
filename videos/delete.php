<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int) ($_POST['id'] ?? 0);
    getPDO()->prepare('DELETE FROM videos WHERE id = ?')->execute([$id]);
    flash('success', 'Video eliminado.');
}
redirect('index.php');
