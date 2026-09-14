</section>

</div>

<script>const BASE = <?= json_encode(BASE) ?>;</script>
<script src="<?= BASE ?>/admin/vistas/scripts/comun.js"></script>
<script src="<?= BASE ?>/admin/vistas/scripts/editor.js"></script>
<?php if (!empty($scriptPagina)): ?>
<script src="<?= htmlspecialchars($scriptPagina) ?>"></script>
<?php endif; ?>
<script src="<?= BASE ?>/admin/assets/js/main.min.js"></script>
</body>
</html>
