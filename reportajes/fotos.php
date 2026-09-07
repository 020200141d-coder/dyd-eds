<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$reportajeId = (int) ($_GET['id'] ?? 0);

$stmt = $pdo->prepare('SELECT * FROM reportajes WHERE id = ?');
$stmt->execute([$reportajeId]);
$reportaje = $stmt->fetch();
if (!$reportaje) {
    flash('error', 'Reportaje no encontrado.');
    redirect('index.php');
}

$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $uploadDir = __DIR__ . '/../uploads/reportajes_fotos';
        $nuevaFoto = handleUpload('foto', $uploadDir, ['jpg', 'jpeg', 'png', 'webp']);
        if (!$nuevaFoto) {
            $errors[] = 'Selecciona una imagen para subir.';
        } else {
            $descripcion = trim($_POST['descripcion'] ?? '');
            $stmtOrden = $pdo->prepare('SELECT COALESCE(MAX(orden), 0) AS maxorden FROM reportajes_fotos WHERE reportaje_id = ?');
            $stmtOrden->execute([$reportajeId]);
            $orden = (int) $stmtOrden->fetch()['maxorden'] + 1;

            $stmt = $pdo->prepare('INSERT INTO reportajes_fotos (reportaje_id, url_foto, orden, descripcion) VALUES (?,?,?,?)');
            $stmt->execute([$reportajeId, $nuevaFoto, $orden, $descripcion ?: null]);
            flash('success', 'Foto agregada correctamente.');
            redirect('fotos.php?id=' . $reportajeId);
        }
    } catch (RuntimeException $e) {
        $errors[] = $e->getMessage();
    }
}

$stmt = $pdo->prepare('SELECT * FROM reportajes_fotos WHERE reportaje_id = ? ORDER BY orden, id');
$stmt->execute([$reportajeId]);
$fotos = $stmt->fetchAll();

$pageTitle = 'Fotos: ' . $reportaje['titulo'];
$activeMenu = 'reportajes';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-image-multiple"></i></span> Fotos adicionales de "<?= e($reportaje['titulo']) ?>"</p>
    <a href="form.php?id=<?= (int)$reportajeId ?>" class="card-header-icon"><span class="icon"><i class="mdi mdi-arrow-left"></i></span></a>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post" enctype="multipart/form-data" class="mb-6">
      <div class="field">
        <label class="label">Nueva foto</label>
        <div class="control"><input class="input" type="file" name="foto" accept="image/*" required></div>
      </div>
      <div class="field">
        <label class="label">Descripción (opcional)</label>
        <div class="control"><input class="input" type="text" name="descripcion"></div>
      </div>
      <div class="field">
        <button type="submit" class="button blue"><span class="icon"><i class="mdi mdi-plus"></i></span> <span>Agregar foto</span></button>
      </div>
    </form>

    <div class="grid gap-4 grid-cols-2 md:grid-cols-4">
      <?php foreach ($fotos as $f): ?>
        <div class="card">
          <div class="card-content" style="padding:10px;">
            <img src="<?= e($base) ?>/uploads/reportajes_fotos/<?= e($f['url_foto']) ?>" style="width:100%;height:120px;object-fit:cover;border-radius:6px;">
            <p class="mt-2" style="font-size:12px;"><?= e($f['descripcion'] ?? '') ?></p>
            <form method="post" action="foto_delete.php" onsubmit="return confirm('¿Eliminar esta foto?');">
              <input type="hidden" name="foto_id" value="<?= (int)$f['id'] ?>">
              <input type="hidden" name="reportaje_id" value="<?= (int)$reportajeId ?>">
              <button type="submit" class="button small red mt-2" style="width:100%;"><span class="icon"><i class="mdi mdi-trash-can"></i></span></button>
            </form>
          </div>
        </div>
      <?php endforeach; ?>
      <?php if (!$fotos): ?>
        <p>Todavía no hay fotos adicionales para este reportaje.</p>
      <?php endif; ?>
    </div>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
