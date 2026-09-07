<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = (int) currentUser()['id'];
$stmt = $pdo->prepare('SELECT * FROM usuarios WHERE id = ?');
$stmt->execute([$id]);
$usuario = $stmt->fetch();
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombres = trim($_POST['nombres'] ?? '');
    $ap_paterno = trim($_POST['ap_paterno'] ?? '');
    $ap_materno = trim($_POST['ap_materno'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($nombres === '' || $ap_paterno === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Revisa los datos: nombres, apellido paterno y email válido son obligatorios.';
    }

    if (!$errors) {
        try {
            if ($password !== '') {
                $stmt = $pdo->prepare('UPDATE usuarios SET nombres=?, ap_paterno=?, ap_materno=?, email=?, password_hash=? WHERE id=?');
                $stmt->execute([$nombres, $ap_paterno, $ap_materno ?: null, $email, password_hash($password, PASSWORD_BCRYPT), $id]);
            } else {
                $stmt = $pdo->prepare('UPDATE usuarios SET nombres=?, ap_paterno=?, ap_materno=?, email=? WHERE id=?');
                $stmt->execute([$nombres, $ap_paterno, $ap_materno ?: null, $email, $id]);
            }
            $stmt = $pdo->prepare('SELECT * FROM usuarios WHERE id = ?');
            $stmt->execute([$id]);
            $usuario = $stmt->fetch();
            $updatedUser = $usuario;
            unset($updatedUser['password_hash']);
            $_SESSION['user'] = $updatedUser;
            flash('success', 'Perfil actualizado correctamente.');
            redirect('perfil.php');
        } catch (PDOException $e) {
            $errors[] = ($e->getCode() == 23000) ? 'Ese email ya está en uso.' : 'Error al guardar los cambios.';
        }
    } else {
        $usuario = array_merge($usuario, compact('nombres', 'ap_paterno', 'ap_materno', 'email'));
    }
}

$pageTitle = 'Mi perfil';
$activeMenu = '';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account"></i></span> Mi perfil</p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post">
      <div class="field">
        <label class="label">Nombres *</label>
        <div class="control"><input class="input" type="text" name="nombres" value="<?= e($usuario['nombres']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Apellido paterno *</label>
        <div class="control"><input class="input" type="text" name="ap_paterno" value="<?= e($usuario['ap_paterno']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Apellido materno</label>
        <div class="control"><input class="input" type="text" name="ap_materno" value="<?= e($usuario['ap_materno']) ?>"></div>
      </div>
      <div class="field">
        <label class="label">Email *</label>
        <div class="control"><input class="input" type="email" name="email" value="<?= e($usuario['email']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Rol</label>
        <div class="control"><input class="input" type="text" value="<?= e($usuario['rol']) ?>" disabled></div>
      </div>
      <div class="field">
        <label class="label">Nueva contraseña (dejar vacío para no cambiar)</label>
        <div class="control"><input class="input" type="password" name="password" autocomplete="new-password"></div>
      </div>
      <hr>
      <div class="field grouped">
        <div class="control"><button type="submit" class="button blue">Guardar cambios</button></div>
      </div>
    </form>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
