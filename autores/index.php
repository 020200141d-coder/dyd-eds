<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$autores = getPDO()->query('SELECT * FROM autores ORDER BY nombres')->fetchAll();

$pageTitle = 'Autores';
$activeMenu = 'autores';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo autor</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-edit"></i></span> Autores</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th>Nombre</th><th>Nickname</th><th></th></tr>
      </thead>
      <tbody>
      <?php if (!$autores): ?>
        <tr><td colspan="3">No hay autores registrados.</td></tr>
      <?php endif; ?>
      <?php foreach ($autores as $a): ?>
        <tr>
          <td data-label="Nombre"><?= e(trim($a['nombres'] . ' ' . $a['ap_paterno'] . ' ' . $a['ap_materno'])) ?></td>
          <td data-label="Nickname"><?= $a['es_nickname'] ? e($a['nickname']) : '—' ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$a['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este autor?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$a['id'] ?>">
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
