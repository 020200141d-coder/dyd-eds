<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$invitados = getPDO()->query('SELECT * FROM invitados ORDER BY nombres')->fetchAll();

$pageTitle = 'Invitados';
$activeMenu = 'invitados';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo invitado</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-star"></i></span> Invitados / Expositores</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th></th><th>Nombre</th><th>Cargo</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$invitados): ?>
        <tr><td colspan="4">No hay invitados registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($invitados as $inv): ?>
        <tr>
          <td class="image-cell">
            <?php if ($inv['foto']): ?>
              <div class="image"><img src="<?= e($base) ?>/uploads/invitados/<?= e($inv['foto']) ?>" class="rounded-full"></div>
            <?php endif; ?>
          </td>
          <td data-label="Nombre"><?= e(trim($inv['nombres'] . ' ' . $inv['ap_paterno'] . ' ' . $inv['ap_materno'])) ?></td>
          <td data-label="Cargo"><?= e($inv['cargo']) ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$inv['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este invitado?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$inv['id'] ?>">
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
