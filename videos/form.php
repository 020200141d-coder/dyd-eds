<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$video = ['titulo' => '', 'url_embed' => '', 'fecha_publicacion' => date('Y-m-d')];
$errors = [];
$invitadosSeleccionados = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM videos WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Video no encontrado.');
        redirect('index.php');
    }
    $video = $found;
    $stmt = $pdo->prepare('SELECT invitado_id FROM video_invitados WHERE video_id = ?');
    $stmt->execute([$id]);
    $invitadosSeleccionados = array_column($stmt->fetchAll(), 'invitado_id');
}

$todosInvitados = $pdo->query('SELECT * FROM invitados ORDER BY nombres')->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $video['titulo'] = trim($_POST['titulo'] ?? '');
    $video['url_embed'] = trim($_POST['url_embed'] ?? '');
    $video['fecha_publicacion'] = $_POST['fecha_publicacion'] ?? date('Y-m-d');
    $invitadosSeleccionados = array_map('intval', $_POST['invitados'] ?? []);

    if ($video['titulo'] === '' || $video['url_embed'] === '') {
        $errors[] = 'Título y URL son obligatorios.';
    }

    if (!$errors) {
        if ($id) {
            $stmt = $pdo->prepare('UPDATE videos SET titulo=?, url_embed=?, fecha_publicacion=? WHERE id=?');
            $stmt->execute([$video['titulo'], $video['url_embed'], $video['fecha_publicacion'], $id]);
            flash('success', 'Video actualizado correctamente.');
        } else {
            $stmt = $pdo->prepare('INSERT INTO videos (titulo, url_embed, fecha_publicacion, usuario_id) VALUES (?,?,?,?)');
            $stmt->execute([$video['titulo'], $video['url_embed'], $video['fecha_publicacion'], currentUser()['id']]);
            $id = (int) $pdo->lastInsertId();
            flash('success', 'Video creado correctamente.');
        }

        $pdo->prepare('DELETE FROM video_invitados WHERE video_id = ?')->execute([$id]);
        if ($invitadosSeleccionados) {
            $insertInv = $pdo->prepare('INSERT INTO video_invitados (video_id, invitado_id) VALUES (?, ?)');
            foreach ($invitadosSeleccionados as $invId) {
                $insertInv->execute([$id, $invId]);
            }
        }

        redirect('index.php');
    }
}

$pageTitle = $id ? 'Editar video' : 'Nuevo video';
$activeMenu = 'videos';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-video"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post">
      <div class="field">
        <label class="label">Título *</label>
        <div class="control"><input class="input" type="text" name="titulo" value="<?= e($video['titulo']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">URL embed (YouTube, etc.) *</label>
        <div class="control"><input class="input" type="url" name="url_embed" value="<?= e($video['url_embed']) ?>" placeholder="https://..." required></div>
      </div>
      <div class="field">
        <label class="label">Fecha de publicación *</label>
        <div class="control"><input class="input" type="date" name="fecha_publicacion" value="<?= e($video['fecha_publicacion']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Invitados / expositores etiquetados</label>
        <?php if (!$todosInvitados): ?>
          <p class="help">No hay invitados registrados todavía. <a href="../invitados/form.php" class="text-blue-500">Crea uno aquí</a>.</p>
        <?php else: ?>
          <div class="control">
            <?php foreach ($todosInvitados as $inv): ?>
              <label class="checkbox" style="display:block;margin-bottom:6px;">
                <input type="checkbox" name="invitados[]" value="<?= (int)$inv['id'] ?>" <?= in_array($inv['id'], $invitadosSeleccionados) ? 'checked' : '' ?>>
                <span class="check"></span>
                <span class="control-label"><?= e(trim($inv['nombres'] . ' ' . $inv['ap_paterno'])) ?><?= $inv['cargo'] ? ' — ' . e($inv['cargo']) : '' ?></span>
              </label>
            <?php endforeach; ?>
          </div>
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
