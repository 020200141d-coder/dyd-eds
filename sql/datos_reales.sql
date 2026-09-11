-- Carga inicial con contenido real tomado de dialogoydesarrollo.com.pe
-- Ejecutar DESPUES de sql/schema.sql (necesita el usuario admin ya creado).
--
-- OJO: el "desarrollo" (cuerpo completo) de los reportajes NO se pudo
-- copiar del sitio real porque solo tengo la portada (index) guardada,
-- no cada articulo completo. Por ahora "desarrollo" repite el resumen;
-- entra al panel y pega el texto completo real de cada nota cuando puedas.
--
-- El Boletin NTEP Nº45 NO esta aqui porque necesita el PDF real, que yo
-- no pude descargar. Bajalo tu mismo de:
--   https://www.dialogoydesarrollo.com.pe/boletines/boletin-NTEP-edicion-N45-2808.pdf
-- y súbelo desde el panel (Boletines > Nuevo boletín) usando como portada
-- el archivo admin/files/boletines/portada/boletin-ntep-45.png que ya
-- quedo copiado en el proyecto. Datos del boletin: numero 45, resumen
-- "Promueven megaproyectos turísticos por S/ 2,400 mllns. Invertirán S/ 9
-- millones en zonas rurales de Cusco. Producción láctea se duplica en
-- Cajamarca.", fecha 2025-08-28.

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
