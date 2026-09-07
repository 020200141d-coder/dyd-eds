<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$boletines = getPDO()->query(
    'SELECT b.*, u.nombres AS usuario_nombres FROM boletines b
     LEFT JOIN usuarios u ON u.id = b.usuario_id
     ORDER BY b.fecha_publicacion DESC'
)->fetchAll();

$pageTitle = 'Boletines';
$activeMenu = 'boletines';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo boletín</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-file-pdf-box"></i></span> Boletines NTEP</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th></th><th>N° Boletín</th><th>Resumen</th><th>PDF</th><th>Fecha</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$boletines): ?>
        <tr><td colspan="6">No hay boletines registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($boletines as $b): ?>
        <tr>
          <td class="image-cell">
            <?php if ($b['foto_portada']): ?>
              <div class="image"><img src="<?= e($base) ?>/uploads/boletines/portada/<?= e($b['foto_portada']) ?>" class="rounded-full"></div>
            <?php endif; ?>
          </td>
          <td data-label="N°"><?= e($b['numero_boletin']) ?></td>
          <td data-label="Resumen"><?= e($b['resumen']) ?></td>
          <td data-label="PDF"><a href="<?= e($base) ?>/uploads/boletines/pdf/<?= e($b['archivo_pdf']) ?>" target="_blank" class="text-blue-500">Ver PDF</a></td>
          <td data-label="Fecha"><?= formatDate($b['fecha_publicacion']) ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$b['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este boletín?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$b['id'] ?>">
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
