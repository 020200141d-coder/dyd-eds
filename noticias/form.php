<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$noticia = ['titulo' => '', 'foto' => null, 'link_externo' => '', 'fecha_publicacion' => date('Y-m-d')];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM noticias WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Noticia no encontrada.');
        redirect('index.php');
    }
    $noticia = $found;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $noticia['titulo'] = trim($_POST['titulo'] ?? '');
    $noticia['link_externo'] = trim($_POST['link_externo'] ?? '');
    $noticia['fecha_publicacion'] = $_POST['fecha_publicacion'] ?? date('Y-m-d');

    if ($noticia['titulo'] === '') {
        $errors[] = 'El título es obligatorio.';
    }

    if (!$errors) {
        try {
            $uploadDir = __DIR__ . '/../uploads/noticias';
            $newFoto = handleUpload('foto', $uploadDir, ['jpg', 'jpeg', 'png', 'webp']);
            if ($newFoto && $id && $noticia['foto']) {
                deleteUploadedFile($uploadDir, $noticia['foto']);
            }
            $fotoToSave = $newFoto ?: $noticia['foto'];

            if ($id) {
                $stmt = $pdo->prepare('UPDATE noticias SET titulo=?, foto=?, link_externo=?, fecha_publicacion=? WHERE id=?');
                $stmt->execute([$noticia['titulo'], $fotoToSave, $noticia['link_externo'] ?: null, $noticia['fecha_publicacion'], $id]);
                flash('success', 'Noticia actualizada correctamente.');
            } else {
                $stmt = $pdo->prepare('INSERT INTO noticias (titulo, foto, link_externo, fecha_publicacion, usuario_id) VALUES (?,?,?,?,?)');
                $stmt->execute([$noticia['titulo'], $fotoToSave, $noticia['link_externo'] ?: null, $noticia['fecha_publicacion'], currentUser()['id']]);
                flash('success', 'Noticia creada correctamente.');
            }
            redirect('index.php');
        } catch (RuntimeException $e) {
            $errors[] = $e->getMessage();
        }
    }
}

$pageTitle = $id ? 'Editar noticia' : 'Nueva noticia';
$activeMenu = 'noticias';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-flash"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post" enctype="multipart/form-data">
      <div class="field">
        <label class="label">Título *</label>
        <div class="control"><input class="input" type="text" name="titulo" value="<?= e($noticia['titulo']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Link externo</label>
        <div class="control"><input class="input" type="url" name="link_externo" value="<?= e($noticia['link_externo']) ?>" placeholder="https://..."></div>
      </div>
      <div class="field">
        <label class="label">Fecha de publicación *</label>
        <div class="control"><input class="input" type="date" name="fecha_publicacion" value="<?= e($noticia['fecha_publicacion']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Foto</label>
        <div class="control"><input class="input" type="file" name="foto" accept="image/*"></div>
        <?php if (!empty($noticia['foto'])): ?>
          <p class="help">Actual: <img src="<?= e($base) ?>/uploads/noticias/<?= e($noticia['foto']) ?>" style="height:60px;display:inline-block;margin-top:6px;"></p>
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
