<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$autor = ['nombres' => '', 'ap_paterno' => '', 'ap_materno' => '', 'nickname' => '', 'es_nickname' => 0];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM autores WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Autor no encontrado.');
        redirect('index.php');
    }
    $autor = $found;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $autor['nombres'] = trim($_POST['nombres'] ?? '');
    $autor['ap_paterno'] = trim($_POST['ap_paterno'] ?? '');
    $autor['ap_materno'] = trim($_POST['ap_materno'] ?? '');
    $autor['nickname'] = trim($_POST['nickname'] ?? '');
    $autor['es_nickname'] = isset($_POST['es_nickname']) ? 1 : 0;

    if ($autor['nombres'] === '') {
        $errors[] = 'El nombre es obligatorio.';
    }

    if (!$errors) {
        if ($id) {
            $stmt = $pdo->prepare('UPDATE autores SET nombres=?, ap_paterno=?, ap_materno=?, nickname=?, es_nickname=? WHERE id=?');
            $stmt->execute([$autor['nombres'], $autor['ap_paterno'] ?: null, $autor['ap_materno'] ?: null, $autor['nickname'] ?: null, $autor['es_nickname'], $id]);
            flash('success', 'Autor actualizado correctamente.');
        } else {
            $stmt = $pdo->prepare('INSERT INTO autores (nombres, ap_paterno, ap_materno, nickname, es_nickname) VALUES (?,?,?,?,?)');
            $stmt->execute([$autor['nombres'], $autor['ap_paterno'] ?: null, $autor['ap_materno'] ?: null, $autor['nickname'] ?: null, $autor['es_nickname']]);
            flash('success', 'Autor creado correctamente.');
        }
        redirect('index.php');
    }
}

$pageTitle = $id ? 'Editar autor' : 'Nuevo autor';
$activeMenu = 'autores';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-edit"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post">
      <div class="field">
        <label class="label">Nombres *</label>
        <div class="control"><input class="input" type="text" name="nombres" value="<?= e($autor['nombres']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Apellido paterno</label>
        <div class="control"><input class="input" type="text" name="ap_paterno" value="<?= e($autor['ap_paterno']) ?>"></div>
      </div>
      <div class="field">
        <label class="label">Apellido materno</label>
        <div class="control"><input class="input" type="text" name="ap_materno" value="<?= e($autor['ap_materno']) ?>"></div>
      </div>
      <div class="field">
        <label class="label">Nickname</label>
        <div class="control"><input class="input" type="text" name="nickname" value="<?= e($autor['nickname']) ?>"></div>
      </div>
      <div class="field">
        <div class="control">
          <label class="checkbox">
            <input type="checkbox" name="es_nickname" value="1" <?= $autor['es_nickname'] ? 'checked' : '' ?>>
            <span class="check"></span>
            <span class="control-label">Mostrar nickname en lugar del nombre completo</span>
          </label>
        </div>
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
