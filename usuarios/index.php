<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireAdmin();

$usuarios = getPDO()->query('SELECT id, nombres, ap_paterno, ap_materno, email, rol, created_at FROM usuarios ORDER BY nombres')->fetchAll();

$pageTitle = 'Usuarios';
$activeMenu = 'usuarios';
require __DIR__ . '/../includes/header.php';
?>

<div class="flex justify-end mb-6">
  <a href="form.php" class="button green">
    <span class="icon"><i class="mdi mdi-plus"></i></span>
    <span>Nuevo usuario</span>
  </a>
</div>

<div class="card has-table">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-multiple"></i></span> Usuarios administradores</p>
  </header>
  <div class="card-content">
    <table>
      <thead>
      <tr><th>Nombre</th><th>Email</th><th>Rol</th><th>Creado</th><th></th></tr>
      </thead>
      <tbody>
      <?php foreach ($usuarios as $u): ?>
        <tr>
          <td data-label="Nombre"><?= e(trim($u['nombres'] . ' ' . $u['ap_paterno'] . ' ' . $u['ap_materno'])) ?></td>
          <td data-label="Email"><?= e($u['email']) ?></td>
          <td data-label="Rol"><?= e($u['rol']) ?></td>
          <td data-label="Creado"><?= formatDate($u['created_at']) ?></td>
          <td class="actions-cell">
            <div class="buttons right nowrap">
              <a class="button small blue" href="form.php?id=<?= (int)$u['id'] ?>"><span class="icon"><i class="mdi mdi-pencil"></i></span></a>
              <?php if ($u['id'] != currentUser()['id']): ?>
              <form method="post" action="delete.php" onsubmit="return confirm('¿Eliminar este usuario?');" style="display:inline">
                <input type="hidden" name="id" value="<?= (int)$u['id'] ?>">
                <button type="submit" class="button small red"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
              </form>
              <?php endif; ?>
            </div>
          </td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
