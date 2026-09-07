<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$invitado = ['nombres' => '', 'ap_paterno' => '', 'ap_materno' => '', 'cargo' => '', 'foto' => null];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM invitados WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Invitado no encontrado.');
        redirect('index.php');
    }
    $invitado = $found;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $invitado['nombres'] = trim($_POST['nombres'] ?? '');
    $invitado['ap_paterno'] = trim($_POST['ap_paterno'] ?? '');
    $invitado['ap_materno'] = trim($_POST['ap_materno'] ?? '');
    $invitado['cargo'] = trim($_POST['cargo'] ?? '');

    if ($invitado['nombres'] === '') {
        $errors[] = 'El nombre es obligatorio.';
    }

    if (!$errors) {
        try {
            $uploadDir = __DIR__ . '/../uploads/invitados';
            $newFoto = handleUpload('foto', $uploadDir, ['jpg', 'jpeg', 'png', 'webp']);
            if ($newFoto && $id && $invitado['foto']) {
                deleteUploadedFile($uploadDir, $invitado['foto']);
            }
            $fotoToSave = $newFoto ?: $invitado['foto'];

            if ($id) {
                $stmt = $pdo->prepare('UPDATE invitados SET nombres=?, ap_paterno=?, ap_materno=?, cargo=?, foto=? WHERE id=?');
                $stmt->execute([$invitado['nombres'], $invitado['ap_paterno'] ?: null, $invitado['ap_materno'] ?: null, $invitado['cargo'] ?: null, $fotoToSave, $id]);
                flash('success', 'Invitado actualizado correctamente.');
            } else {
                $stmt = $pdo->prepare('INSERT INTO invitados (nombres, ap_paterno, ap_materno, cargo, foto) VALUES (?,?,?,?,?)');
                $stmt->execute([$invitado['nombres'], $invitado['ap_paterno'] ?: null, $invitado['ap_materno'] ?: null, $invitado['cargo'] ?: null, $fotoToSave]);
                flash('success', 'Invitado creado correctamente.');
            }
            redirect('index.php');
        } catch (RuntimeException $e) {
            $errors[] = $e->getMessage();
        }
    }
}

$pageTitle = $id ? 'Editar invitado' : 'Nuevo invitado';
$activeMenu = 'invitados';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-account-star"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post" enctype="multipart/form-data">
      <div class="field">
        <label class="label">Nombres *</label>
        <div class="control"><input class="input" type="text" name="nombres" value="<?= e($invitado['nombres']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Apellido paterno</label>
        <div class="control"><input class="input" type="text" name="ap_paterno" value="<?= e($invitado['ap_paterno']) ?>"></div>
      </div>
      <div class="field">
        <label class="label">Apellido materno</label>
        <div class="control"><input class="input" type="text" name="ap_materno" value="<?= e($invitado['ap_materno']) ?>"></div>
      </div>
      <div class="field">
        <label class="label">Cargo / especialidad</label>
        <div class="control"><input class="input" type="text" name="cargo" value="<?= e($invitado['cargo']) ?>" placeholder="Ej. Docente de Ingeniería de Sistemas"></div>
      </div>
      <div class="field">
        <label class="label">Foto</label>
        <div class="control"><input class="input" type="file" name="foto" accept="image/*"></div>
        <?php if (!empty($invitado['foto'])): ?>
          <p class="help">Actual: <img src="<?= e($base) ?>/uploads/invitados/<?= e($invitado['foto']) ?>" style="height:60px;display:inline-block;margin-top:6px;"></p>
        <?php endif; ?>
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
