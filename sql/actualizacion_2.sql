-- Segunda tanda de datos reales, tomados de reportajes-1.html y
-- boletines.html (enviados por el usuario). Ejecutar DESPUES de haber
-- corrido sql/datos_reales.sql una vez (no lo vuelvas a correr entero,
-- crearia filas duplicadas).

USE dyd;

-- Corrige la fecha real del reportaje destacado (era 09-09, es 08-09)
UPDATE reportajes
SET fecha_publicacion = '2026-09-08'
WHERE titulo = 'Universidades públicas administran casi S/900 millones de canon, regalías y otros recursos determinados';

-- Reemplaza el video de relleno por el video REAL embebido en el sitio
-- (sección "Nosotros" del inicio, confirmado en el HTML real)
UPDATE videos
SET titulo = 'Conoce Diálogo y Desarrollo Perú',
    url_embed = 'https://www.youtube.com/embed/2jI6fHBtRJU'
WHERE titulo = 'Minería ilegal en Perú: el fracaso del REINFO y su impacto económico';

-- 5 reportajes mas viejos que faltaban (pagina 1 de reportajes-1.html)
-- OJO: no tengo las fotos reales de estos 5 (reportaje-05-08-26.jpg, etc.)
-- asi que foto_principal queda NULL; se ve con la imagen de relleno hasta
-- que subas la foto real desde el panel.
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Minería ilegal: la brecha sigue abierta a una semana del nuevo gobierno',
    NULL,
    '(Completar con el texto real del artículo desde el panel.)',
    NULL,
    '2026-08-05',
    0,
    NULL,
    1
);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Así lavan el oro ilegal plantas procesadoras y mineros con Reinfo',
    NULL,
    '(Completar con el texto real del artículo desde el panel.)',
    NULL,
    '2026-07-30',
    0,
    NULL,
    1
);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Medidas que el nuevo gobierno debe tomar para frenar la minería ilegal',
    NULL,
    '(Completar con el texto real del artículo desde el panel.)',
    NULL,
    '2026-07-24',
    0,
    NULL,
    1
);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Por qué algunas comunidades respaldan actividades de minería ilegal',
    NULL,
    '(Completar con el texto real del artículo desde el panel.)',
    NULL,
    '2026-07-16',
    0,
    NULL,
    1
);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Más reservas, cuencas y zonas protegidas afectadas por la minería ilegal',
    NULL,
    '(Completar con el texto real del artículo desde el panel.)',
    NULL,
    '2026-07-07',
    0,
    NULL,
    1
);

-- 5 boletines mas viejos que faltaban (boletines.html)
-- OJO: no tengo las portadas reales (boletin-ntep-44.png, etc.) ni los
-- PDF reales de estos 5, asi que usan un PDF de RELLENO genérico
-- (admin/files/boletines/pdf/boletin-relleno.pdf). Reemplaza cada uno
-- desde el panel con la portada y el PDF real cuando los tengas.
INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('44', NULL, NULL, 'boletin-relleno.pdf', '2025-08-25', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('43', NULL, NULL, 'boletin-relleno.pdf', '2025-08-21', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('42', NULL, NULL, 'boletin-relleno.pdf', '2025-08-18', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('41', NULL, NULL, 'boletin-relleno.pdf', '2025-08-14', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('40', NULL, NULL, 'boletin-relleno.pdf', '2025-08-11', 1);
