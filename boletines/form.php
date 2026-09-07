<?php
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth.php';
requireLogin();

$pdo = getPDO();
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
$boletin = ['numero_boletin' => '', 'resumen' => '', 'foto_portada' => null, 'archivo_pdf' => null, 'fecha_publicacion' => date('Y-m-d')];
$errors = [];

if ($id) {
    $stmt = $pdo->prepare('SELECT * FROM boletines WHERE id = ?');
    $stmt->execute([$id]);
    $found = $stmt->fetch();
    if (!$found) {
        flash('error', 'Boletín no encontrado.');
        redirect('index.php');
    }
    $boletin = $found;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $boletin['numero_boletin'] = trim($_POST['numero_boletin'] ?? '');
    $boletin['resumen'] = trim($_POST['resumen'] ?? '');
    $boletin['fecha_publicacion'] = $_POST['fecha_publicacion'] ?? date('Y-m-d');

    if ($boletin['numero_boletin'] === '') {
        $errors[] = 'El número de boletín es obligatorio.';
    }
    if (!$id && empty($_FILES['archivo_pdf']['name'])) {
        $errors[] = 'Debes adjuntar el archivo PDF del boletín.';
    }

    if (!$errors) {
        try {
            $portadaDir = __DIR__ . '/../uploads/boletines/portada';
            $pdfDir = __DIR__ . '/../uploads/boletines/pdf';

            $newPortada = handleUpload('foto_portada', $portadaDir, ['jpg', 'jpeg', 'png', 'webp']);
            $newPdf = handleUpload('archivo_pdf', $pdfDir, ['pdf']);

            if ($newPortada && $id && $boletin['foto_portada']) {
                deleteUploadedFile($portadaDir, $boletin['foto_portada']);
            }
            if ($newPdf && $id && $boletin['archivo_pdf']) {
                deleteUploadedFile($pdfDir, $boletin['archivo_pdf']);
            }

            $portadaToSave = $newPortada ?: $boletin['foto_portada'];
            $pdfToSave = $newPdf ?: $boletin['archivo_pdf'];

            if ($id) {
                $stmt = $pdo->prepare('UPDATE boletines SET numero_boletin=?, resumen=?, foto_portada=?, archivo_pdf=?, fecha_publicacion=? WHERE id=?');
                $stmt->execute([$boletin['numero_boletin'], $boletin['resumen'] ?: null, $portadaToSave, $pdfToSave, $boletin['fecha_publicacion'], $id]);
                flash('success', 'Boletín actualizado correctamente.');
            } else {
                $stmt = $pdo->prepare('INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id) VALUES (?,?,?,?,?,?)');
                $stmt->execute([$boletin['numero_boletin'], $boletin['resumen'] ?: null, $portadaToSave, $pdfToSave, $boletin['fecha_publicacion'], currentUser()['id']]);
                flash('success', 'Boletín creado correctamente.');
            }
            redirect('index.php');
        } catch (RuntimeException $e) {
            $errors[] = $e->getMessage();
        } catch (PDOException $e) {
            $errors[] = ($e->getCode() == 23000) ? 'Ese número de boletín ya existe.' : 'Error al guardar: ' . $e->getMessage();
        }
    }
}

$pageTitle = $id ? 'Editar boletín' : 'Nuevo boletín';
$activeMenu = 'boletines';
require __DIR__ . '/../includes/header.php';
?>

<div class="card mb-6">
  <header class="card-header">
    <p class="card-header-title"><span class="icon"><i class="mdi mdi-file-pdf-box"></i></span> <?= e($pageTitle) ?></p>
  </header>
  <div class="card-content">
    <?php foreach ($errors as $err): ?>
      <div class="notification red mb-4"><?= e($err) ?></div>
    <?php endforeach; ?>
    <form method="post" enctype="multipart/form-data">
      <div class="field">
        <label class="label">N° de boletín *</label>
        <div class="control"><input class="input" type="text" name="numero_boletin" value="<?= e($boletin['numero_boletin']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Resumen</label>
        <div class="control"><textarea class="textarea" name="resumen" rows="3"><?= e($boletin['resumen']) ?></textarea></div>
      </div>
      <div class="field">
        <label class="label">Fecha de publicación *</label>
        <div class="control"><input class="input" type="date" name="fecha_publicacion" value="<?= e($boletin['fecha_publicacion']) ?>" required></div>
      </div>
      <div class="field">
        <label class="label">Foto de portada</label>
        <div class="control"><input class="input" type="file" name="foto_portada" accept="image/*"></div>
        <?php if (!empty($boletin['foto_portada'])): ?>
          <p class="help">Actual: <img src="<?= e($base) ?>/uploads/boletines/portada/<?= e($boletin['foto_portada']) ?>" style="height:60px;display:inline-block;margin-top:6px;"></p>
        <?php endif; ?>
      </div>
      <div class="field">
        <label class="label">Archivo PDF <?= $id ? '(dejar vacío para conservar el actual)' : '*' ?></label>
        <div class="control"><input class="input" type="file" name="archivo_pdf" accept="application/pdf"></div>
        <?php if (!empty($boletin['archivo_pdf'])): ?>
          <p class="help">Actual: <a href="<?= e($base) ?>/uploads/boletines/pdf/<?= e($boletin['archivo_pdf']) ?>" target="_blank" class="text-blue-500">Ver PDF actual</a></p>
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
