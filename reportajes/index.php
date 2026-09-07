<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$reportajes = getPDO()->query(
    "SELECT r.*, a.nombres AS autor_nombres, a.nickname AS autor_nickname, a.es_nickname AS autor_es_nickname,
            u.nombres AS usuario_nombres
     FROM reportajes r
     LEFT JOIN autores a ON a.id = r.autor_id
     LEFT JOIN usuarios u ON u.id = r.usuario_id
     ORDER BY r.fecha_publicacion DESC"
)->fetchAll();

function autorLabel(array $r): string
{
    if (!$r['autor_nombres']) return 'Redacción';
    return $r['autor_es_nickname'] && $r['autor_nickname'] ? $r['autor_nickname'] : $r['autor_nombres'];
}

$pageTitle = 'Reportajes';
$activeMenu = 'reportajes';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo reportaje</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-newspaper-variant"></i></span> Reportajes</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th></th><th>Título</th><th>Autor</th><th>Fecha</th><th>Destacado</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$reportajes): ?>
        <tr><td colspan="6">No hay reportajes registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($reportajes as $r): ?>
        <tr>
          <td class="image-cell">
            <?php if ($r['foto_principal']): ?>
              <div class="image"><img src="<?= e($base) ?>/uploads/reportajes/<?= e($r['foto_principal']) ?>" class="rounded-full"></div>
            <?php endif; ?>
          </td>
          <td data-label="Título"><?= e($r['titulo']) ?></td>
          <td data-label="Autor"><?= e(autorLabel($r)) ?></td>
          <td data-label="Fecha"><?= formatDate($r['fecha_publicacion']) ?></td>
          <td data-label="Destacado"><?= $r['es_destacado'] ? 'Sí' : 'No' ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small" href="fotos.php?id=<?= (int)$r['id'] ?>" title="Fotos adicionales"><span class="icon"><i class="mdi mdi-image-multiple"></i></span></a>
              <a class="button small blue" href="form.php?id=<?= (int)$r['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este reportaje y sus fotos?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
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
