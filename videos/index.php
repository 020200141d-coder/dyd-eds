<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$videos = $pdo->query(
    'SELECT v.*, u.nombres AS usuario_nombres FROM videos v
     LEFT JOIN usuarios u ON u.id = v.usuario_id
     ORDER BY v.fecha_publicacion DESC'
)->fetchAll();

$invitadosPorVideo = [];
$rows = $pdo->query(
    'SELECT vi.video_id, i.nombres, i.ap_paterno FROM video_invitados vi
     JOIN invitados i ON i.id = vi.invitado_id'
)->fetchAll();
foreach ($rows as $row) {
    $invitadosPorVideo[$row['video_id']][] = trim($row['nombres'] . ' ' . $row['ap_paterno']);
}

$pageTitle = 'Videos';
$activeMenu = 'videos';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo video</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-video"></i></span> Videos</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th>Título</th><th>URL embed</th><th>Invitados</th><th>Fecha</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$videos): ?>
        <tr><td colspan="5">No hay videos registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($videos as $v): ?>
        <tr>
          <td data-label="Título"><?= e($v['titulo']) ?></td>
          <td data-label="URL"><a href="<?= e($v['url_embed']) ?>" target="_blank" class="text-blue-500">Abrir</a></td>
          <td data-label="Invitados"><?= $invitadosPorVideo[$v['id']] ?? null ? e(implode(', ', $invitadosPorVideo[$v['id']])) : '—' ?></td>
          <td data-label="Fecha"><?= formatDate($v['fecha_publicacion']) ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$v['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este video?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$v['id'] ?>">
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
