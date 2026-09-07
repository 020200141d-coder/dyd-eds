<?php
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/includes/auth.php';
requireLogin();

$pdo = getPDO();
$counts = [];
foreach (['reportajes', 'noticias', 'boletines', 'podcasts', 'videos', 'autores', 'usuarios'] as $table) {
    $counts[$table] = (int) $pdo->query("SELECT COUNT(*) FROM {$table}")->fetchColumn();
}

$ultimosReportajes = $pdo->query(
    'SELECT r.id, r.titulo, r.fecha_publicacion, r.es_destacado, u.nombres AS usuario_nombres
     FROM reportajes r
     LEFT JOIN usuarios u ON u.id = r.usuario_id
     ORDER BY r.created_at DESC
     LIMIT 8'
)->fetchAll();

$pageTitle = 'Dashboard';
$activeMenu = 'dashboard';
require __DIR__ . '/includes/header.php';
?>

<div class="grid gap-6 grid-cols-2 md:grid-cols-4 mb-6">
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Reportajes</h3><h1><?= $counts['reportajes'] ?></h1></div>
        <span class="icon widget-icon text-green-500"><i class="mdi mdi-newspaper-variant mdi-48px"></i></span>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Noticias</h3><h1><?= $counts['noticias'] ?></h1></div>
        <span class="icon widget-icon text-blue-500"><i class="mdi mdi-flash mdi-48px"></i></span>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Boletines</h3><h1><?= $counts['boletines'] ?></h1></div>
        <span class="icon widget-icon text-red-500"><i class="mdi mdi-file-pdf-box mdi-48px"></i></span>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Videos</h3><h1><?= $counts['videos'] ?></h1></div>
        <span class="icon widget-icon text-yellow-500"><i class="mdi mdi-video mdi-48px"></i></span>
      </div>
    </div>
  </div>
</div>

<div class="grid gap-6 grid-cols-2 md:grid-cols-3 mb-6">
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Podcasts</h3><h1><?= $counts['podcasts'] ?></h1></div>
        <span class="icon widget-icon text-purple-500"><i class="mdi mdi-microphone mdi-48px"></i></span>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Autores</h3><h1><?= $counts['autores'] ?></h1></div>
        <span class="icon widget-icon text-indigo-500"><i class="mdi mdi-account-edit mdi-48px"></i></span>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-content">
      <div class="flex items-center justify-between">
        <div class="widget-label"><h3>Usuarios</h3><h1><?= $counts['usuarios'] ?></h1></div>
        <span class="icon widget-icon text-gray-500"><i class="mdi mdi-account-multiple mdi-48px"></i></span>
      </div>
    </div>
  </div>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title">
      <span class="icon"><i class="mdi mdi-newspaper-variant"></i></span>
      Últimos reportajes
    </p>
    <a href="<?= e($base) ?>/reportajes/index.php" class="card-header-icon">
      <span class="icon"><i class="mdi mdi-arrow-right"></i></span>
    </a>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr>
        <th>Título</th>
        <th>Autor/Usuario</th>
        <th>Fecha</th>
        <th>Destacado</th>
      </tr>
      </thead>
      <tbody>
      <?php if (!$ultimosReportajes): ?>
        <tr><td colspan="4">Todavía no hay reportajes registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($ultimosReportajes as $r): ?>
        <tr>
          <td data-label="Título"><?= e($r['titulo']) ?></td>
          <td data-label="Usuario"><?= e($r['usuario_nombres'] ?? '') ?></td>
          <td data-label="Fecha"><?= formatDate($r['fecha_publicacion']) ?></td>
          <td data-label="Destacado"><?= $r['es_destacado'] ? 'Sí' : 'No' ?></td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php require __DIR__ . '/includes/footer.php'; ?>
