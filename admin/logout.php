<?php
require_once __DIR__ . '/config/global.php';
$_SESSION = [];
session_destroy();
header('Location: /dyd-eds/admin/login.php');
exit;
