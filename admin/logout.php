<?php
require_once __DIR__ . '/config/global.php';
$_SESSION = [];
session_destroy();
header('Location: ' . BASE . '/admin/login.php');
exit;
