<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$podcasts = $pdo->query(
    'SELECT p.*, u.nombres AS usuario_nombres FROM podcasts p
     LEFT JOIN usuarios u ON u.id = p.usuario_id
     ORDER BY p.fecha_publicacion DESC'
)->fetchAll();

$invitadosPorPodcast = [];
$rows = $pdo->query(
    'SELECT pi.podcast_id, i.nombres, i.ap_paterno FROM podcast_invitados pi
     JOIN invitados i ON i.id = pi.invitado_id'
)->fetchAll();
foreach ($rows as $row) {
    $invitadosPorPodcast[$row['podcast_id']][] = trim($row['nombres'] . ' ' . $row['ap_paterno']);
}

$pageTitle = 'Podcasts';
$activeMenu = 'podcasts';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo podcast</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-microphone"></i></span> Podcasts</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th>Título</th><th>URL embed</th><th>Invitados</th><th>Fecha</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$podcasts): ?>
        <tr><td colspan="5">No hay podcasts registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($podcasts as $p): ?>
        <tr>
          <td data-label="Título"><?= e($p['titulo']) ?></td>
          <td data-label="URL"><a href="<?= e($p['url_embed']) ?>" target="_blank" class="text-blue-500">Abrir</a></td>
          <td data-label="Invitados"><?= $invitadosPorPodcast[$p['id']] ?? null ? e(implode(', ', $invitadosPorPodcast[$p['id']])) : '—' ?></td>
          <td data-label="Fecha"><?= formatDate($p['fecha_publicacion']) ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$p['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este podcast?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$p['id'] ?>">
                <button type="submit" class="button small red"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
              </form>
            </div>
          </td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
