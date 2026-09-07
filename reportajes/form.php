<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$reportaje = [
    'titulo' => '', 'resumen_corto' => '', 'desarrollo' => '', 'foto_principal' => null,
    'pdf_adjunto' => null, 'fecha_publicacion' => date('Y-m-d'), 'es_destacado' => 0, 'autor_id' => '',
];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM reportajes WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Reportaje no encontrado.');
        redirect('index.php');
    }
    $reportaje = $found;
}

$autores = $pdo->query('SELECT * FROM autores ORDER BY nombres')->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $reportaje['titulo'] = trim($_POST['titulo'] ?? '');
    $reportaje['resumen_corto'] = trim($_POST['resumen_corto'] ?? '');
    $reportaje['desarrollo'] = trim($_POST['desarrollo'] ?? '');
    $reportaje['fecha_publicacion'] = $_POST['fecha_publicacion'] ?? date('Y-m-d');
    $reportaje['es_destacado'] = isset($_POST['es_destacado']) ? 1 : 0;
    $reportaje['autor_id'] = $_POST['autor_id'] !== '' ? (int) $_POST['autor_id'] : null;

    if ($reportaje['titulo'] === '' || $reportaje['desarrollo'] === '') {
        $errors[] = 'Título y desarrollo son obligatorios.';
    }

    if (!$errors) {
        try {
            $uploadDir = __DIR__ . '/../uploads/reportajes';
            $newFoto = handleUpload('foto_principal', $uploadDir, ['jpg', 'jpeg', 'png', 'webp']);
            $newPdf = handleUpload('pdf_adjunto', $uploadDir, ['pdf']);

            if ($newFoto && $id && $reportaje['foto_principal']) {
                deleteUploadedFile($uploadDir, $reportaje['foto_principal']);
            }
            if ($newPdf && $id && $reportaje['pdf_adjunto']) {
                deleteUploadedFile($uploadDir, $reportaje['pdf_adjunto']);
            }

            $fotoToSave = $newFoto ?: $reportaje['foto_principal'];
            $pdfToSave = $newPdf ?: $reportaje['pdf_adjunto'];

            if ($id) {
                $stmt = $pdo->prepare('UPDATE reportajes SET titulo=?, resumen_corto=?, desarrollo=?, foto_principal=?, pdf_adjunto=?, fecha_publicacion=?, es_destacado=?, autor_id=? WHERE id=?');
                $stmt->execute([$reportaje['titulo'], $reportaje['resumen_corto'] ?: null, $reportaje['desarrollo'], $fotoToSave, $pdfToSave, $reportaje['fecha_publicacion'], $reportaje['es_destacado'], $reportaje['autor_id'], $id]);
                flash('success', 'Reportaje actualizado correctamente.');
                redirect('index.php');
            } else {
                $stmt = $pdo->prepare('INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, pdf_adjunto, fecha_publicacion, es_destacado, autor_id, usuario_id) VALUES (?,?,?,?,?,?,?,?,?)');
                $stmt->execute([$reportaje['titulo'], $reportaje['resumen_corto'] ?: null, $reportaje['desarrollo'], $fotoToSave, $pdfToSave, $reportaje['fecha_publicacion'], $reportaje['es_destacado'], $reportaje['autor_id'], currentUser()['id']]);
                $newId = $pdo->lastInsertId();
                flash('success', 'Reportaje creado. Ahora puedes agregar fotos adicionales.');
                redirect('fotos.php?id=' . $newId);
            }
        } catch (RuntimeException $e) {
            $errors[] = $e->getMessage();
        }
    }
}

$pageTitle = $id ? 'Editar reportaje' : 'Nuevo reportaje';
$activeMenu = 'reportajes';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-newspaper-variant"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post" enctype="multipart/form-data">
      <div class="field">
        <label class="label">Título *</label>
        <div class="control"><input class="input" type="text" name="titulo" value="<?= e($reportaje['titulo']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Resumen corto</label>
        <div class="control"><textarea class="textarea" name="resumen_corto" rows="2" maxlength="500"><?= e($reportaje['resumen_corto']) ?></textarea></div>
      </div>
      <div class="field">
        <label class="label">Desarrollo (contenido completo) *</label>
        <div class="control"><textarea class="textarea" name="desarrollo" rows="10" required><?= e($reportaje['desarrollo']) ?></textarea></div>
      </div>
      <div class="field">
        <label class="label">Autor</label>
        <div class="control">
          <div class="select">
            <select name="autor_id">
              <option value="">Redacción (sin autor)</option>
              <?php foreach ($autores as $a): ?>
                <option value="<?= (int)$a['id'] ?>" <?= (string)$reportaje['autor_id'] === (string)$a['id'] ? 'selected' : '' ?>>
                  <?= e(trim($a['nombres'] . ' ' . $a['ap_paterno'])) ?>
                </option>
              <?php endforeach; ?>
            </select>
          </div>
        </div>
      </div>
      <div class="field">
        <label class="label">Fecha de publicación *</label>
        <div class="control"><input class="input" type="date" name="fecha_publicacion" value="<?= e($reportaje['fecha_publicacion']) ?>" required></div>
      </div>
      <div class="field">
        <div class="control">
          <label class="checkbox">
            <input type="checkbox" name="es_destacado" value="1" <?= $reportaje['es_destacado'] ? 'checked' : '' ?>>
            <span class="check"></span>
            <span class="control-label">Marcar como destacado</span>
          </label>
        </div>
      </div>
      <div class="field">
        <label class="label">Foto principal</label>
        <div class="control"><input class="input" type="file" name="foto_principal" accept="image/*"></div>
        <?php if (!empty($reportaje['foto_principal'])): ?>
          <p class="help">Actual: <img src="<?= e($base) ?>/uploads/reportajes/<?= e($reportaje['foto_principal']) ?>" style="height:60px;display:inline-block;margin-top:6px;"></p>
        <?php endif; ?>
      </div>
      <div class="field">
        <label class="label">PDF adjunto</label>
        <div class="control"><input class="input" type="file" name="pdf_adjunto" accept="application/pdf"></div>
        <?php if (!empty($reportaje['pdf_adjunto'])): ?>
          <p class="help">Actual: <a href="<?= e($base) ?>/uploads/reportajes/<?= e($reportaje['pdf_adjunto']) ?>" target="_blank" class="text-blue-500">Ver PDF actual</a></p>
        <?php endif; ?>
      </div>
      <hr>
      <div class="field grouped">
        <div class="control"><button type="submit" class="button blue">Guardar</button></div>
        <?php if ($id): ?>
          <div class="control"><a href="fotos.php?id=<?= (int)$id ?>" class="button">Gestionar fotos adicionales</a></div>
        <?php endif; ?>
        <div class="control"><a href="index.php" class="button">Cancelar</a></div>
      </div>
    </form>
  </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
