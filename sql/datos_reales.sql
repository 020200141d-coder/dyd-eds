-- Carga inicial con contenido real tomado de dialogoydesarrollo.com.pe
-- Ejecutar DESPUES de sql/schema.sql (necesita el usuario admin ya creado).
--
-- OJO: el "desarrollo" (cuerpo completo) de los reportajes NO se pudo
-- copiar del sitio real porque solo tengo la portada (index) guardada,
-- no cada articulo completo. Por ahora "desarrollo" repite el resumen;
-- entra al panel y pega el texto completo real de cada nota cuando puedas.
--
-- El PDF del Boletin NTEP Nº45 es un PDF de RELLENO (no el real, porque
-- no se pudo descargar desde aqui). Reemplázalo entrando al panel
-- (Boletines > editar > Archivo PDF) y subiendo el real, que puedes bajar
-- tu mismo de:
--   https://www.dialogoydesarrollo.com.pe/boletines/boletin-NTEP-edicion-N45-2808.pdf
--
-- El video de YouTube NO es el que aparece embebido en el sitio real (ese
-- ID de YouTube no se pudo identificar desde aqui): es un video público
-- distinto, sobre el mismo tema (REINFO y minería ilegal en Perú), para
-- que la sección de Videos no quede vacía. Reemplázalo por el real cuando
-- lo tengas, desde el panel (Videos > editar).

USE dyd;

-- reportaje destacado (portada del sitio, Set 09 2026)
INSERT INTO reportajes
    (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Universidades públicas administran casi S/900 millones de canon, regalías y otros recursos determinados',
    'Las universidades estatales concentran recursos provenientes de actividades extractivas. Pero han invertido la mitad. Especialistas dicen que una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si esas inversiones producen mejores condiciones en formación e investigación.',
    'Las universidades estatales concentran recursos provenientes de actividades extractivas. Pero han invertido la mitad. Especialistas dicen que una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si esas inversiones producen mejores condiciones en formación e investigación. (Completar con el texto real del artículo desde el panel.)',
    'video-destacado-09-09-26.jpg',
    '2026-09-09',
    1,
    NULL,
    1
);

-- reportaje: 730 mineros con Reinfo
INSERT INTO reportajes
    (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Más de 730 mineros con Reinfo vigente o suspendido participan en las elecciones regionales y municipales',
    '43 candidatos buscan llegar a gobiernos regionales y 692 postulan a alcaldías y regidurías. El analista Iván Arenas advierte los posibles conflictos de interés y el riesgo de que estas autoridades favorezcan las actividades mineras informales.',
    '43 candidatos buscan llegar a gobiernos regionales y 692 postulan a alcaldías y regidurías. El analista Iván Arenas advierte los posibles conflictos de interés y el riesgo de que estas autoridades favorezcan las actividades mineras informales. (Completar con el texto real del artículo desde el panel.)',
    'reportaje-28-08-26.jpg',
    '2026-08-28',
    0,
    NULL,
    1
);

-- reportaje: Quiruvilca
INSERT INTO reportajes
    (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Quiruvilca: el pueblo perforado por la minería ilegal',
    NULL,
    '(Completar con el texto real del artículo desde el panel — no se pudo obtener el resumen ni el cuerpo desde la portada del sitio.)',
    'reportaje-18-08-26.jpg',
    '2026-08-18',
    0,
    NULL,
    1
);

-- reportaje: canon del boom minero
INSERT INTO reportajes
    (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Cómo evitar que el canon del boom minero termine en obras de poco impacto',
    NULL,
    '(Completar con el texto real del artículo desde el panel — no se pudo obtener el resumen ni el cuerpo desde la portada del sitio.)',
    'reportaje-12-08-26.jpg',
    '2026-08-12',
    0,
    NULL,
    1
);

-- noticias recientes (enlazan a otros medios, tal como en el sitio real)
INSERT INTO noticias (titulo, foto, link_externo, fecha_publicacion, usuario_id)
VALUES (
    'Impulsan talento local en Hualgayoc',
    'nota-facebook-21-11-25.png',
    'https://minart.pe/2025/11/07/gold-fields-y-empresas-locales-apuestan-por-el-talento-hualgayoquino-capacitando-a-pobladores-en-manejo-de-camiones-mineros-en-hualgayoc/',
    '2025-11-21',
    1
);

INSERT INTO noticias (titulo, foto, link_externo, fecha_publicacion, usuario_id)
VALUES (
    'Inauguran moderno colegio en Cerro Azul',
    'nota-facebook-21-11-25b.png',
    'https://andina.pe/agencia/noticia-canete-inauguran-moderno-local-colegio-construido-inversion-s30-millones-1051936.aspx',
    '2025-11-21',
    1
);

INSERT INTO noticias (titulo, foto, link_externo, fecha_publicacion, usuario_id)
VALUES (
    'Megaproyecto de saneamiento en Juliaca',
    'nota-facebook-20-11-25.png',
    'https://diarioelnoticiero.com/ministerio-de-vivienda-llego-a-juliaca-para-reafirmar-que-el-proyecto-de-agua-potable-y-alcantarillado-no-se-detiene-2/',
    '2025-11-20',
    1
);

-- Boletin NTEP Nº45 (portada real, PDF de relleno — ver nota arriba)
INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES (
    '45',
    'Promueven megaproyectos turísticos por S/ 2,400 mllns. Invertirán S/ 9 millones en zonas rurales de Cusco. Producción láctea se duplica en Cajamarca.',
    'boletin-ntep-45.png',
    'boletin-ntep-45.pdf',
    '2025-08-28',
    1
);

-- Video relacionado con el tema del sitio (REINFO / minería ilegal en Perú)
-- No es el video embebido real del sitio (ver nota arriba) — reemplázalo
-- desde el panel cuando tengas el ID real de YouTube.
INSERT INTO videos (titulo, url_embed, fecha_publicacion, usuario_id)
VALUES (
    'Minería ilegal en Perú: el fracaso del REINFO y su impacto económico',
    'https://www.youtube.com/embed/VOfLN4ulvLM',
    '2026-04-17',
    1
);
