<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$noticias = getPDO()->query(
    'SELECT n.*, u.nombres AS usuario_nombres FROM noticias n
     LEFT JOIN usuarios u ON u.id = n.usuario_id
     ORDER BY n.fecha_publicacion DESC'
)->fetchAll();

$pageTitle = 'Noticias';
$activeMenu = 'noticias';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nueva noticia</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-flash"></i></span> Noticias</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th></th><th>Título</th><th>Link externo</th><th>Fecha</th><th>Usuario</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$noticias): ?>
        <tr><td colspan="6">No hay noticias registradas.</td></tr>
      <?php endif; ?>
      <?php foreach ($noticias as $n): ?>
        <tr>
          <td class="image-cell">
            <?php if ($n['foto']): ?>
              <div class="image"><img src="<?= e($base) ?>/uploads/noticias/<?= e($n['foto']) ?>" class="rounded-full"></div>
            <?php endif; ?>
          </td>
          <td data-label="Título"><?= e($n['titulo']) ?></td>
          <td data-label="Link"><?php if ($n['link_externo']): ?><a href="<?= e($n['link_externo']) ?>" target="_blank" class="text-blue-500">Ver enlace</a><?php endif; ?></td>
          <td data-label="Fecha"><?= formatDate($n['fecha_publicacion']) ?></td>
          <td data-label="Usuario"><?= e($n['usuario_nombres'] ?? '') ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$n['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar esta noticia?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$n['id'] ?>">
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
