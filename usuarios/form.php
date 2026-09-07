<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireAdmin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$usuario = ['nombres' => '', 'ap_paterno' => '', 'ap_materno' => '', 'email' => '', 'rol' => 'redactor'];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT id, nombres, ap_paterno, ap_materno, email, rol FROM usuarios WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Usuario no encontrado.');
        redirect('index.php');
    }
    $usuario = $found;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario['nombres'] = trim($_POST['nombres'] ?? '');
    $usuario['ap_paterno'] = trim($_POST['ap_paterno'] ?? '');
    $usuario['ap_materno'] = trim($_POST['ap_materno'] ?? '');
    $usuario['email'] = trim($_POST['email'] ?? '');
    $usuario['rol'] = $_POST['rol'] ?? 'redactor';
    $password = $_POST['password'] ?? '';

    if ($usuario['nombres'] === '' || $usuario['ap_paterno'] === '' || $usuario['email'] === '') {
        $errors[] = 'Nombres, apellido paterno y email son obligatorios.';
    }
    if (!filter_var($usuario['email'], FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'El email no es válido.';
    }
    if (!$id && $password === '') {
        $errors[] = 'La contraseña es obligatoria para un usuario nuevo.';
    }
    if (!in_array($usuario['rol'], ['admin', 'editor', 'redactor'], true)) {
        $errors[] = 'Rol no válido.';
    }

    if (!$errors) {
        try {
            if ($id) {
                if ($password !== '') {
                    $stmt = $pdo->prepare('UPDATE usuarios SET nombres=?, ap_paterno=?, ap_materno=?, email=?, rol=?, password_hash=? WHERE id=?');
                    $stmt->execute([$usuario['nombres'], $usuario['ap_paterno'], $usuario['ap_materno'] ?: null, $usuario['email'], $usuario['rol'], password_hash($password, PASSWORD_BCRYPT), $id]);
                } else {
                    $stmt = $pdo->prepare('UPDATE usuarios SET nombres=?, ap_paterno=?, ap_materno=?, email=?, rol=? WHERE id=?');
                    $stmt->execute([$usuario['nombres'], $usuario['ap_paterno'], $usuario['ap_materno'] ?: null, $usuario['email'], $usuario['rol'], $id]);
                }
                flash('success', 'Usuario actualizado correctamente.');
            } else {
                $stmt = $pdo->prepare('INSERT INTO usuarios (nombres, ap_paterno, ap_materno, email, password_hash, rol) VALUES (?,?,?,?,?,?)');
                $stmt->execute([$usuario['nombres'], $usuario['ap_paterno'], $usuario['ap_materno'] ?: null, $usuario['email'], password_hash($password, PASSWORD_BCRYPT), $usuario['rol']]);
                flash('success', 'Usuario creado correctamente.');
            }
            redirect('index.php');
        } catch (PDOException $e) {
            $errors[] = ($e->getCode() == 23000) ? 'Ese email ya está registrado.' : 'Error al guardar: ' . $e->getMessage();
        }
    }
}

$pageTitle = $id ? 'Editar usuario' : 'Nuevo usuario';
$activeMenu = 'usuarios';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-multiple"></i></span> <?= e($pageTitle) ?></p>
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
        <label class="label">Rol *</label>
        <div class="control">
          <div class="select">
            <select name="rol">
              <?php foreach (['admin', 'editor', 'redactor'] as $rol): ?>
                <option value="<?= $rol ?>" <?= $usuario['rol'] === $rol ? 'selected' : '' ?>><?= ucfirst($rol) ?></option>
              <?php endforeach; ?>
            </select>
          </div>
        </div>
      </div>
      <div class="field">
        <label class="label"><?= $id ? 'Nueva contraseña (dejar vacío para no cambiar)' : 'Contraseña *' ?></label>
        <div class="control"><input class="input" type="password" name="password" autocomplete="new-password" <?= $id ? '' : 'required' ?>></div>
      </div>
      <hr>
      <div class="field grouped">
        <div class="control"><button type="submit" class="button blue">Guardar</button></div>
        <div class="control"><a href="index.php" class="button">Cancelar</a></div>
      </div>
    </form>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
