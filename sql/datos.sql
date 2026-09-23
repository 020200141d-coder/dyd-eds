-- Contenido del sitio: reportajes, noticias, boletines y video.
-- Tomado de dialogoydesarrollo.com.pe.
--
-- Este es el segundo de los dos unicos scripts del proyecto. Se importa
-- DESPUES de sql/schema.sql, que es el que crea las tablas y el usuario
-- admin. Con esos dos archivos la base queda completa; no hay ninguna
-- actualizacion aparte que correr.
--
-- Contiene 64 reportajes (63 con su texto completo y su foto), 3 noticias,
-- 6 boletines y el video embebido del inicio.
--
-- Lo unico que queda pendiente de completar desde el panel:
--   - 3 reportajes sin foto (05-08-26, 18-06-25 y 19-06-25)
--   - 1 reportaje sin texto, el del 05-08-26

-- Los textos llevan tildes y enies: se avisa el juego de caracteres
-- para que no dependa de como este configurado el cliente que importa.
SET NAMES utf8mb4;

-- En un hosting: borra esta linea (la base se elige en phpMyAdmin).
USE dyd;

-- reportaje destacado (portada del sitio, Set 08 2026)
INSERT INTO reportajes
    (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES (
    'Universidades públicas administran casi S/900 millones de canon, regalías y otros recursos determinados',
    'Las universidades estatales concentran recursos provenientes de actividades extractivas. Pero han invertido la mitad. Especialistas dicen que una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si esas inversiones producen mejores condiciones en formación e investigación.',
    'Las universidades estatales concentran recursos provenientes de actividades extractivas. Pero han invertido la mitad. Especialistas dicen que una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si esas inversiones producen mejores condiciones en formación e investigación. (Completar con el texto real del artículo desde el panel.)',
    'video-destacado-09-09-26.jpg',
    '2026-09-08',
    1,
    NULL,
    1
);

-- 5 reportajes mas viejos (reportajes-1.html). No tengo sus fotos reales
-- (reportaje-05-08-26.jpg, etc.) asi que foto_principal queda NULL.
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Minería ilegal: la brecha sigue abierta a una semana del nuevo gobierno', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-08-05', 0, NULL, 1);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Así lavan el oro ilegal plantas procesadoras y mineros con Reinfo', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-30-07-26.jpg', '2026-07-30', 0, NULL, 1);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Medidas que el nuevo gobierno debe tomar para frenar la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-24-07-26.jpg', '2026-07-24', 0, NULL, 1);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Por qué algunas comunidades respaldan actividades de minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-16-07-26.jpg', '2026-07-16', 0, NULL, 1);

INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Más reservas, cuencas y zonas protegidas afectadas por la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-07-07-26.jpg', '2026-07-07', 0, NULL, 1);

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

-- 55 reportajes mas (paginas 2 a 6 del listado de Reportajes del sitio
-- real). Igual que los anteriores, no tengo las fotos reales asi que
-- foto_principal queda NULL; el nombre real de cada foto queda anotado
-- al lado de cada INSERT por si la consigues despues.

-- foto real: reportaje-02-07-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Aportes mineros para las regiones y el gobierno central crecieron 62% en 2026', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-02-07-26.jpg', '2026-07-02', 0, NULL, 1);

-- foto real: reportaje-12-06-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon y regalías mineras sostienen el 70% del presupuesto de la región Moquegua y hasta el 90% en obras y proyectos', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-12-06-26.jpg', '2026-06-12', 0, NULL, 1);

-- foto real: reportaje-04-06-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('742 escolares de Taca y Raccaya reciben kits educativos', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-04-06-26.jpg', '2026-06-04', 0, NULL, 1);

-- foto real: reportaje-21-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Áreas naturales desprotegidas: al menos ocho son impactadas por la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-21-05-26.jpg', '2026-05-21', 0, NULL, 1);

-- foto real: reportaje-14-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Los peligros de trabajar en un socavón ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-14-05-26.jpg', '2026-05-14', 0, NULL, 1);

-- foto real: reportaje-08-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon y regalías mineras y gasíferas sostienen más del 70 % del presupuesto en Cusco', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-08-05-26.jpg', '2026-05-08', 0, NULL, 1);

-- foto real: reportaje-30-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('La violencia ligada a economías ilegales se expande por todo el Perú', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-30-04-26.jpg', '2026-04-30', 0, NULL, 1);

-- foto real: reportaje-24-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Bancada Reinfo: los nuevos aliados de la informalidad en el Congreso', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-24-04-26.jpg', '2026-04-24', 0, NULL, 1);

-- foto real: reportaje-21-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Alianza entre UGEL Melgar, Minsur y Enseña Perú impulsará aprendizajes en estudiantes de Nuñoa', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-21-04-26.jpg', '2026-04-21', 0, NULL, 1);

-- foto real: reportaje-20-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('19 jóvenes cajamarquinos se gradúan como técnicos gracias al programa INSPIRA de Minera La Granja y Cetemin', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-20-04-26.jpg', '2026-04-20', 0, NULL, 1);

-- foto real: reportaje-08-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-08-04-26.jpg', '2026-04-08', 0, NULL, 1);

-- foto real: reportaje-26-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-26-03-26.jpg', '2026-03-26', 0, NULL, 1);

-- foto real: reportaje-24-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Congreso acelera paquetazo a favor de mineros informales en plena campaña', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-24-03-26.jpg', '2026-03-24', 0, NULL, 1);

-- foto real: reportaje-18-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Empresas y regiones que concentran la producción minera en Perú', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-18-03-26.jpg', '2026-03-18', 0, NULL, 1);

-- foto real: reportaje-11-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Crisis del gas: vuelve el debate sobre la seguridad energética del país', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-11-03-26.jpg', '2026-03-11', 0, NULL, 1);

-- foto real: reportaje-10-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Sunat incauta menos del 1% del oro ilegal que el Perú exporta en un año', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-10-03-26.jpg', '2026-03-10', 0, NULL, 1);

-- foto real: reportaje-27-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon minero en La Libertad: mucho dinero ejecutado, pocas brechas cerradas', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-27-02-26.jpg', '2026-02-27', 0, NULL, 1);

-- foto real: reportaje-19-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El canon que Ica no logra convertir en obras', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-19-02-26.jpg', '2026-02-19', 0, NULL, 1);

-- foto real: reportaje-18-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('¿A qué se destinó el canon minero y gasífero en Cusco?', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-18-02-26.jpg', '2026-02-18', 0, NULL, 1);

-- foto real: reportaje-16-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El canon minero como motor de desarrollo social en 2025', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-16-02-26.jpg', '2026-02-16', 0, NULL, 1);

-- foto real: reportaje-13-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Arequipa destina 7 de cada 10 soles del canon minero a obras viales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-13-02-26.jpg', '2026-02-13', 0, NULL, 1);

-- foto real: reportaje-11-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno Regional de Apurímac invirtió el 89,7 % del canon minero y regalías transferidas en 2025', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-11-02-26.jpg', '2026-02-11', 0, NULL, 1);

-- foto real: reportaje-09-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Uso de más de S/3,000 millones de canon minero no muestran impacto real en Áncash', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-09-02-26.jpg', '2026-02-09', 0, NULL, 1);

-- foto real: reportaje-30-01-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-30-01-26.jpg', '2026-01-30', 0, NULL, 1);

-- foto real: reportaje-26-01-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-26-01-26.jpg', '2026-01-26', 0, NULL, 1);

-- foto real: reportaje-17-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Mineros ilegales invaden concesiones mineras formales en regiones', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-17-12-25.jpg', '2025-12-17', 0, NULL, 1);

-- foto real: reportaje-10-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Cómo se posicionan los partidos frente a los mineros informales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-10-12-25.jpg', '2025-12-10', 0, NULL, 1);

-- foto real: reportaje-03-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Candidatos serían financiados por mineros inscritos en el REINFO como en 2021', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-03-12-25.jpg', '2025-12-03', 0, NULL, 1);

-- foto real: reportaje-25-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno observaría ampliación del REINFO si no cumple ciertas condiciones', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-25-11-25.jpg', '2025-11-25', 0, NULL, 1);

-- foto real: reportaje-19-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('¿Congresistas volverán a apostar por la minería ilegal?', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-19-11-25.jpg', '2025-11-19', 0, NULL, 1);

-- foto real: reportaje-12ii-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Por qué ampliar el Reinfo sería un error', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-12ii-11-25.jpg', '2025-11-12', 0, NULL, 1);

-- foto real: reportaje-12-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('La minería ilegal habría lavado unos 22 mil millones de dólares', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-12-11-25.jpg', '2025-11-12', 0, NULL, 1);

-- foto real: reportaje-05-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Investigación revela rechazo ciudadano a minería ilegal o informal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-05-11-25.jpg', '2025-11-05', 0, NULL, 1);

-- foto real: reportaje-31-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Se suman más buses San Antonio de Torontoy en la ruta Hiram Bingham', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-31-10-25.jpg', '2025-10-31', 0, NULL, 1);

-- foto real: reportaje-29-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('CRESPO Cumple compromisos con comunidades de Arcata y Chucñihuaqui en el distrito de Cayarani', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-29-10-25.jpg', '2025-10-29', 0, NULL, 1);

-- foto real: reportaje-15-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Juliane Koepcke, única sobreviviente del accidente aéreo de 1971, denuncia que Minería Ilegal invade Reserva Comunal El Sira', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-15-10-25.jpg', '2025-10-15', 0, NULL, 1);

-- foto real: reportaje-09-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Minería ilegal contamina ríos y deja sin agua a millones de familias', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-09-10-25.jpg', '2025-10-09', 0, NULL, 1);

-- foto real: reportaje-01-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('SUNAT pone en la mira a las plantas de procesamiento de minerales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-01-10-25.jpg', '2025-10-01', 0, NULL, 1);

-- foto real: reportaje-24-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El oro ilegal iguala a la minería formal en exportaciones', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-24-09-25.jpg', '2025-09-24', 0, NULL, 1);

-- foto real: reportaje-17-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Regiones pierden canon y regalías por evasión tributaria de mineros ilegales y por la ineficiencia de las autoridades', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-17-09-25.jpg', '2025-09-17', 0, NULL, 1);

-- foto real: reportaje-10-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Los ríos y lagos que antes se defendieron con marchas, hoy son contaminados por mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-10-09-25.jpg', '2025-09-10', 0, NULL, 1);

-- foto real: reportaje-03-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Nueva Ley MAPE debe frenar a la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-03-09-25.jpg', '2025-09-03', 0, NULL, 1);

-- foto real: reportaje-29-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Cinco de cada diez peruanos no votarían por un candidato defensor de la minería informal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-29-08-25.jpg', '2025-08-29', 0, NULL, 1);

-- foto real: reportaje-21-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Carga explosiva que destruyó viviendas en Trujillo es la misma que usa la minería ilegal en Pataz', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-21-08-25.jpg', '2025-08-21', 0, NULL, 1);

-- foto real: reportaje-11-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El mercurio envenena bosques, ríos y personas', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-11-08-25.jpg', '2025-08-11', 0, NULL, 1);

-- foto real: reportaje-04-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobiernos regionales y locales perderán 2.600 millones a causa de mineros informales e ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-04-08-25.jpg', '2025-08-04', 0, NULL, 1);

-- foto real: reportaje-29-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Dina Boluarte calló sobre la minería informal e ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-29-07-25.jpg', '2025-07-29', 0, NULL, 1);

-- foto real: reportaje-10-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Siete de cada diez mineros del Reinfo operan en concesiones de otros pequeños mineros', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-10-07-25.jpg', '2025-07-10', 0, NULL, 1);

-- foto real: reportaje-08-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Ley MAPE amaneza cuidado de ríos, lagos y quebradas', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-08-07-25.jpg', '2025-07-08', 0, NULL, 1);

-- foto real: reportaje-07-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Colectivo PAS invoca a no ceder a las presiones para frenar combate a la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-07-07-25.jpg', '2025-07-07', 0, NULL, 1);

-- foto real: reportaje-04-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Crece riesgo de que mineros ilegales financien campañas en 2026', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-04-07-25.jpg', '2025-07-04', 0, NULL, 1);

-- foto real: reportaje-19-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Fiscalía advierte que mineros ilegales posiblemente financien a candidatos', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-19', 0, NULL, 1);

-- foto real: reportaje-18-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Colectivo PAS alerta sobre el avance de la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-18', 0, NULL, 1);

-- foto real: reportaje-10-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Regiones y municipios recibieron casi 7,000 millones de soles de canon minero', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-10-06-25.jpg', '2025-06-10', 0, NULL, 1);

-- foto real: reportaje-09-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno no sabe cómo enfrentar la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', 'reportaje-09-06-25.jpg', '2025-06-09', 0, NULL, 1);

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

-- Boletin NTEP Nº45 (portada y PDF reales)
INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES (
    '45',
    'Promueven megaproyectos turísticos por S/ 2,400 mllns. Invertirán S/ 9 millones en zonas rurales de Cusco. Producción láctea se duplica en Cajamarca.',
    'boletin-ntep-45.png',
    'boletin-ntep-45.pdf',
    '2025-08-28',
    1
);

-- Boletines Nº44 a Nº40, con su portada y su PDF real. El resumen de
-- cada uno son los titulares que aparecen en su portada.
INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('44', 'Vía de evitamiento Cusco potenciará el turismo. Gestionarán bosques de Ucayali de forma sostenible. Impulsan energía renovable en el valle de Huarmey.', 'boletin-ntep-44.png', 'boletin-ntep-44.pdf', '2025-08-25', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('43', 'Protegen 35 áreas de conservación regional. Casos de dengue caen 93 % en Ayacucho. Financian estudios para vía de evitamiento Moquegua.', 'boletin-ntep-43.png', 'boletin-ntep-43.pdf', '2025-08-21', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('42', 'Puerto de Paita aumentará exportaciones piuranas. Protegen bosques andinos como estrategia climática. Priorizan 8 proyectos de inversión en Chumbivilcas.', 'boletin-ntep-42.png', 'boletin-ntep-42.pdf', '2025-08-18', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('41', 'Perú busca fortalecer agroexportaciones a Japón. Avanza el terminal portuario de Lambayeque. Impulsan empleabilidad en Hualgayoc.', 'boletin-ntep-41.png', 'boletin-ntep-41.pdf', '2025-08-14', 1);

INSERT INTO boletines (numero_boletin, resumen, foto_portada, archivo_pdf, fecha_publicacion, usuario_id)
VALUES ('40', 'Modernizan aeropuerto en Junín por US$ 62 millones. Nuevo centro de salud de S/ 56 millones en Parcona. Biblioteca virtual para estudiantes en Caylloma.', 'boletin-ntep-40.png', 'boletin-ntep-40.pdf', '2025-08-11', 1);

-- Video REAL embebido en el sitio (seccion "Nosotros" del inicio,
-- confirmado en el HTML real). No se pudo saber el titulo exacto del
-- video de YouTube, se usa uno descriptivo del contexto.
INSERT INTO videos (titulo, url_embed, fecha_publicacion, usuario_id)
VALUES (
    'Conoce Diálogo y Desarrollo Perú',
    'https://www.youtube.com/embed/2jI6fHBtRJU',
    '2026-01-01',
    1
);

-- Texto completo de cada reportaje (cuerpo del articulo y bajada),
-- tomado de la pagina propia de cada nota en el sitio real.

INSERT INTO autores (nombre) VALUES ('Yuri Castro');

UPDATE reportajes SET desarrollo = 'Diecinueve jóvenes de Cajamarca cruzaron el estrado con birrete, diploma y medalla. No como un acto simbólico más, sino como el cierre de un ciclo que ha contribuido a cambiar el rumbo de sus vidas: todos ellos egresaron como técnicos certificados tras completar el programa INSPIRA, impulsado por Minera La Granja en alianza con Cetemin. Un proceso formativo que arrancó en junio de 2025 y que hoy entrega al mercado laboral a profesionales técnicos preparados, con competencias reales y oportunidades concretas de inserción laboral.
 El mérito como puerta de entrada
INSPIRA no es un programa masivo ni genérico. Está diseñado para jóvenes que terminaron el colegio entre los primeros lugares de sus instituciones educativas en Cajamarca. El criterio de selección es claro: el esfuerzo tiene que valer. La iniciativa forma parte del portafolio de programas bandera que Minera La Granja ejecuta a través del Fondo Social La Granja, su brazo de inversión social en la región.
 "Apostamos por las personas"
Jorge Benavides, Gerente General de First Quantum Minerals —empresa operadora de Minera La Granja—, resume así la filosofía detrás del programa: "Apostamos por las personas para contribuir con su formación y brindarles oportunidades que transformen su destino, el de sus familias y, por ende, el de sus comunidades." Una apuesta que no se queda en el discurso: se mide en 19 graduados con título técnico en la mano.
 La alianza que hace posible el cambio
El socio estratégico en esta ecuación es Cetemin, institución reconocida a nivel nacional por su enfoque en formación profesional orientada al desarrollo productivo y sostenible. Su participación en el programa INSPIRA valida que la articulación entre empresa privada y academia es una fórmula que funciona —y que puede replicarse— para generar bienestar real en territorios donde la minería tiene presencia.', resumen_corto = 'La iniciativa, impulsada a través del Fondo Social La Granja y en alianza con el Centro Tecnológico Minero (Cetemin), apuesta por convertir el mérito académico en oportunidad real de vida.'
WHERE titulo = '19 jóvenes cajamarquinos se gradúan como técnicos gracias al programa INSPIRA de Minera La Granja y Cetemin' AND fecha_publicacion = '2026-04-20';

UPDATE reportajes SET desarrollo = 'Como parte del programa Regresando a clases 2026, Catalina Huanca Sociedad Minera entregó materiales escolares a estudiantes, docentes y personal administrativo de 16 instituciones educativas en las comunidades de Taca, Raccaya, Uyuccasa y Apongo, en la provincia de Víctor Fajardo, Ayacucho.', resumen_corto = 'La acción benefició a 742 personas y se realizó en alianza con las autoridades educativas locales y los padres de familia.'
WHERE titulo = '742 escolares de Taca y Raccaya reciben kits educativos' AND fecha_publicacion = '2026-06-04';

UPDATE reportajes SET desarrollo = 'Representantes de la empresa entregaron las unidades que fueron oficialmente recepcionadas por el alcalde distrital de Cayarani, Lic. John Raúl Uracahua Condori; el alcalde del Centro Poblado de Arcata, Martín Huamani Quispe; el presidente de la Comunidad Campesina de Chucñihuaqui, Sr. Roberto Chaco Ninasivincha; y la teniente alcaldesa de Cayarani, Emperatriz Ccallo Quispe.

Las camionetas fueron asignadas al Centro Poblado de Arcata y a la Comunidad Campesina de Chucñihuaqui, con el objetivo de contribuir a las labores de gestión, supervisión y coordinación en beneficio de la población local.

“Seguimos cumpliendo nuestros compromisos que generan un impacto positivo en la comunidad”, señaló la empresa, reafirmando su política de trabajo conjunto y transparente con las autoridades locales.

Con esta entrega, Crespo consolida su compromiso con el desarrollo sostenible y la mejora de la calidad de vida de las comunidades vecinas.', resumen_corto = 'En cumplimiento del convenio específico suscrito entre la Municipalidad Distrital de Cayarani, el Centro Poblado de Arcata y Crespo, se realizó la entrega de dos camionetas Toyota Hilux destinadas a atenciones de emergencia en comunidades y anexos de difícil acceso, educación y actividades colectivas de desarrollo comunitario.'
WHERE titulo = 'CRESPO Cumple compromisos con comunidades de Arcata y Chucñihuaqui en el distrito de Cayarani' AND fecha_publicacion = '2025-10-29';

UPDATE reportajes SET desarrollo = 'La Superintendencia Nacional de Administración Tributaria (SUNAT) anunció acciones para fiscalizar y trazar la producción de minerales de origen informal e ilegal. La superintendenta, Marilú Llerena, afirmó que el control se concentrará en las plantas de procesamiento que acopian material en zonas de extracción.

Aunque resulta imposible rastrear toda la cadena —desde la extracción y el transporte hasta la exportación—, SUNAT aplicará un modelo de control inteligente que combine puestos de vigilancia física y supervisión directa en las plantas.

“Cuando analizamos todo este circuito, hay un actor clave: las plantas de procesamiento, principalmente las que no están integradas a la extracción. Tenemos más de 350 plantas donde converge la producción de la minería artesanal, informal e ilegal. La estrategia es reforzar los controles en esas plantas”, explicó Llerena.

Con esos datos se buscará detectar inconsistencias en la declaración de volúmenes de producción. La SUNAT cruzará la información reportada al Ministerio de Energía y Minas con sus propias estadísticas tributarias para identificar irregularidades en producción, ventas y transporte.

Las plantas de procesamiento son un eslabón central en el lavado de dinero proveniente de la minería ilegal e informal. Desde el Observatorio de Minería Ilegal (OMI) ya se había propuesto mejorar la fiscalización de estas plantas, que operan en la sombra y blanquean mineral ilegal. César Ipenza, abogado especialista en temas ambientales, insistió en que se debe trabajar junto a la SUNAT y la Unidad de Inteligencia Financiera (UIF) con equipos técnicos y tecnología.', resumen_corto = 'La entidad anunció controles para rastrear el mineral de origen informal e ilegal. El foco estará en las plantas de beneficio, clave en el lavado de oro y en la evasión tributaria.'
WHERE titulo = 'SUNAT pone en la mira a las plantas de procesamiento de minerales' AND fecha_publicacion = '2025-10-01';

UPDATE reportajes SET desarrollo = 'El departamento del Cusco recibió en 2025 la suma de 3,326 millones 558 mil 087 soles provenientes de canon, sobrecanon y regalías mineras y gasíferas, casi 300 millones menos de lo previsto a inicios de año. De esa cantidad, el Gobierno Regional del Cusco y los gobiernos municipales gastaron el 88,9 %. En general, quedó un saldo cercano a 260 millones de soles.

De todo lo ejecutado, el gobernador regional Werner Salcedo Álvarez y los alcaldes provinciales y distritales destinaron 404 millones 888 mil 726 soles a bienes y servicios, y 216 millones 952 mil 565 soles al pago de servicios de la deuda pública —intereses, entre otros conceptos—.

Sin embargo, el grueso del presupuesto del canon, 2,968 millones 675 mil 046 soles, se destinó a la construcción de edificios y estructuras, la adquisición de vehículos y maquinaria, la compra de activos no producidos, otros activos fijos, inversiones intangibles y otros gastos no financieros.

En el rubro de construcción figuran carreteras; sistemas de electricidad; obras agrícolas; agua y saneamiento; plazas, parques y jardines; monumentos históricos; así como instalaciones educativas, médicas, sociales y culturales.

En el caso de compras, se registran elementos para oficina; equipos informáticos y de comunicaciones; mobiliario; equipos y aparatos médicos; equipos de uso agrícola y pesquero; equipamiento deportivo y recreativo; además de adquisición de terrenos.

Gasto de canon y regalías mineras
En el caso específico del canon y regalías mineras, el Gobierno Regional del Cusco recibió transferencias por 786 millones de soles y gastó el 93,88 %, según el Ministerio de Economía y Finanzas (MEF). Los gobiernos municipales, en conjunto, recibieron 2,840 millones de soles y lograron ejecutar, en promedio, el 91,31 %.

Debido a la poca especificidad de los registros del MEF, no es posible identificar con precisión en qué obras o proyectos concretos se invirtieron esos recursos.

No obstante, de acuerdo con el análisis del Instituto Videnza, los sectores a los que el gobierno regional destinó el canon minero fueron: planeamiento, gestión y reserva de contingencia (31%), transporte (23%), salud (11%) y educación (8%).

Por su parte, los alcaldes provinciales y distritales destinaron los recursos principalmente a agropecuario (19%), planeamiento, gestión y reserva de contingencia (18%), transporte (15%) y cultura y deporte (10%).', resumen_corto = 'El gobierno regional y los gobiernos municipales ejecutaron casi el 90% del canon y regalías en 2025, pero aún quedaron S/ 260 millones sin usar. La mayor parte se destinó a obras de infraestructura y compras de maquinaria, mientras que transporte, salud y educación concentraron una parte del gasto.'
WHERE titulo = '¿A qué se destinó el canon minero y gasífero en Cusco?' AND fecha_publicacion = '2026-02-18';

UPDATE reportajes SET desarrollo = 'Ayaviri, 20 de abril de 2026.– La Unidad de Gestión Educativa Local (UGEL) Melgar, la empresa Minsur –a través de su Proyecto Santo Domingo– y la asociación civil Enseña Perú firmaron una alianza para fortalecer la educación en el distrito de Nuñoa, en la región Puno.
 Durante el 2026, la intervención priorizará el desarrollo de capacidades pedagógicas y de liderazgo en docentes y equipos directivos, con el fin de mejorar los aprendizajes de más de 270 estudiantes de educación primaria y secundaria. Entre las instituciones educativas beneficiarias se encuentran la IE Tupac Amaru y la IE Domingo Savio, así como escuelas de primaria ubicadas en Nuñoa.
 El trabajo contempla acompañamiento pedagógico en aula, promoción de la innovación educativa y fortalecimiento del liderazgo escolar. De manera especial, se realizará un acompañamiento intensivo en instituciones educativas de los sectores de Anansaya Puna y Huaycho, con foco en el desarrollo de competencias de lectoescritura y en la gestión directiva.

El director de la UGEL Melgar, Dr. Julio Antonio Jara Aguirre, destacó que este convenio “representa un paso clave para articular los esfuerzos del sector público, la empresa privada y la sociedad civil en favor de una educación de calidad en contextos rurales”.

“Impulsar esta alianza interinstitucional reafirma el compromiso de Minsur y su Proyecto Santo Domingo de ser un aliado estratégico para contribuir al desarrollo de Nuñoa”, señaló Rafael Armas, representante de la empresa.

Por su parte, Enseña Perú subrayó que el trabajo colaborativo y el liderazgo educativo son herramientas fundamentales para cerrar brechas de inequidad y generar oportunidades para las y los estudiantes del país. La iniciativa busca, además, sentar las bases para una intervención de mayor alcance a partir de 2027, ampliando sus resultados y beneficiando a más comunidades educativas de la localidad.', resumen_corto = 'Más de 270 estudiantes de Nuñoa se beneficiarán con el fortalecimiento de capacidades pedagógicas y de liderazgo de docentes y directivos durante el 2026.'
WHERE titulo = 'Alianza entre UGEL Melgar, Minsur y Enseña Perú impulsará aprendizajes en estudiantes de Nuñoa' AND fecha_publicacion = '2026-04-21';

UPDATE reportajes SET desarrollo = 'En cuatro meses, entre enero y abril de 2026, la recaudación proveniente de la minería formal sumó S/15,272 millones, un aumento de 62.8 % en comparación con los S/9,379 millones recaudados en ese cuatrimestre de 2025. La cifra equivale a casi todo lo recaudado durante 2023: S/16,112 millones.

Según el Ministerio de Energía y Minas, solo en abril la recaudación minera sumó S/6,353 millones, el monto mensual más alto del año, con un crecimiento de 92.1 % respecto a los S/ 3,307 millones recaudados en abril del año pasado.

Ese incremento también benefició a los gobiernos regionales, municipalidades y universidades públicas mediante transferencias por S/4,121 millones en los primeros meses de este año. Ese aumento corresponde, sobre todo, a regalías mineras, cuya recaudación aumentó 143 % en abril. La bonanza también se refleja en las exportaciones. Durante el primer trimestre de 2026, las ventas mineras al exterior alcanzaron los US$ 21,425 millones, un crecimiento de 57.3 %.

Como se sabe, el sistema actual de impuestos y aportes de la minería formal prevé que haya una mayor recaudación para el gobierno central y los gobiernos locales y regionales, ya sea por incremento de precios de los minerales como por incremento en los volúmenes exportado.

En este caso, el valor exportado aumentó pese a que los volúmenes enviados al exterior disminuyeron. Las exportaciones de cobre sumaron 697,400 toneladas métricas finas entre enero y marzo, 1.9 % menos que en ese cuatrimestre del año anterior; mientras que las de oro alcanzaron 1.62 millones de onzas, una reducción de 1.4 %.

Esto se debió a que desde 2024 el cobre y el oro registran una escalada sostenida de precios y han roto los récords alcanzados durante la pandemia. Por eso el valor de las exportaciones creció incluso con menores volúmenes de producción y venta.

No obstante, detrás de estas cifras récord aparece una limitación: el crecimiento de la recaudación no proviene de una expansión de la producción minera, sino del aumento de los precios internacionales.

El especialista tributario Marcial García Schreck advirtió que no se está aprovechando plenamente esta coyuntura favorable. Aunque la producción de cobre aumentó 3.6 % de enero a abril, la extracción anual está estancada en alrededor de 2.7 millones de toneladas. En el caso del oro, la producción retrocedió 4.1 % en los primeros cuatro meses del año.

Es decir, el Perú recauda más, exporta más valor y transfiere más recursos a las regiones gracias al precio de los minerales, pero, al mismo tiempo, no produce más cobre ni más oro.', resumen_corto = 'La minería formal aportó S/15,272 millones a la recaudación fiscal entre enero y abril. Regiones recibieron S/4,121 millones de minería formal en los primeros meses de 2026.'
WHERE titulo = 'Aportes mineros para las regiones y el gobierno central crecieron 62% en 2026' AND fecha_publicacion = '2026-07-02';

UPDATE reportajes SET desarrollo = 'Unos mil mineros ilegales están destruyendo la Reserva Nacional de Tambopata, en Madre de Dios. Según un estudio de Conservación Amazónica (ACCA), solo entre 2025 y los primeros meses de 2026 desaparecieron más de 500 hectáreas de bosques amazónicos en esta reserva. Las imágenes satelitales de ACCA muestran decenas de campamentos, infraestructura minera y maquinaria pesada ocupando esta área natural protegida que el Estado no protege. “Es especialmente preocupante que una parte importante del avance de la minería ilegal se esté registrando dentro de la reserva y en zonas cercanas a puestos de control”, explica Sidney Novoa, director de tecnologías para la conservación de ACCA.

A poca distancia de Tambopata, entre Puno y Madre de Dios, los mineros ilegales destruyen el Parque Nacional Bahuaja Sonene. Cerca de 500 hectáreas fueron deforestadas dentro y alrededor del área protegida, muy cerca del río Inambari y la comunidad de Kotsimba. La Fiscalía Especializada en Materia Ambiental de Puno identificó hasta 18 puntos de minería ilegal que colindan con la zona de amortiguamiento del parque. Estas actividades continúan expandiéndose sin control hacia sectores sensibles. El uso de mercurio destruye el hábitat de peces y taricayas y obliga a migrar al lobo de río.

En Quebrada Honda y Cajavilca (Áncash), contaminan cabeceras de cuenca y aceleran el retroceso glaciar en el Parque Nacional Huascarán, así como amenazan glaciares, lagunas, pastizales, matorrales, bofedales, zorros andinos, pumas y venados. En este parque, los mineros también avanzan hacia zonas altoandinas de Recuay y Pallasca. Según OjoPúblico, entre 2016 y 2020, el Ministerio Público destruyó en Quebrada Honda campamentos, equipos, herramientas y minerales de 23 minas ilegales.

Más zonas afectadas
En Cajamarca, esta minería pone en peligro la diversidad del Santuario Nacional Tabaconas Namballe, porque contamina ríos con metales pesados, deforesta cabeceras de cuenca y degrada un ecosistema de páramo y bosque de neblina, hábitat del tapir de montaña, una especie en peligro. Hay impacto en el río Samaniego y en la quebrada Machete, frontera con Piura, donde se destruye el “colchón” hídrico del páramo por la presencia de mercurio y sedimentos que comprometen la calidad del agua para consumo humano y riego en los distritos de Tabaconas y San Ignacio.

Pasa lo mismo con la Reserva Nacional de San Fernando, en Marcona, Nasca (Ica), donde el incremento de la minería informal afecta la fauna marina. San Fernando es el hogar de especies tan emblemáticas y frágiles, como el pingüino de Humboldt. En marzo de este año, la Fiscalía Especializada en Materia Ambiental de Ica destruyó ocho campamentos rústicos y un socavón vinculado a la minería ilegal en el sector sur del cerro Huaricangana, dentro de la reserva nacional.

La minería ilegal también avanza sobre el área protegida de las Líneas de Nasca y destruye geoglifos, acueductos y zonas arqueológicas que sobrevivieron más de dos mil años. En Tulín instalaron una planta minera cerca de un geoglifo trapezoidal, mientras que, en Quemazón, Socos y Los Paredones se registran detonaciones con dinamita, apertura de zanjas y perforaciones profundas. Leonardo Fabio Rojas Escajadillo, conocido como el Caminante del desierto, denuncia que el Estado no protege el patrimonio y solo reacciona cuando el daño ya es irreversible.

En Puno, la zona de amortiguamiento del lago Titicaca está siendo invadida por mineros ilegales. Reportes del Sernanp advierten la expansión de esta actividad ilícita desde hace más de una década, que amenaza especies como la rana gigante y aves acuáticas andinas, así como extensas hectáreas de totorales. Según especialistas y organismos ambientales, si no hay una respuesta estatal efectiva, el daño será irreversible.

La Reserva Paisajística Subcuenca del Cotahuasi es otra área natural ubicada en Arequipa que está en permanente riesgo. Inclusive en años anteriores se hicieron labores de interdicción y se destruyó maquinaria y equipos empleados por la minería ilegal.

Un Estado debilitado
Para el abogado especialista en temas ambientales y miembro del Observatorio de Minería Ilegal (OMI), César Ipenza, varias leyes aprobadas por el actual Congreso facilitaron el avance de esta minería. Explicó que el auge de la minería ilegal en zonas protegidas obedece al precio récord del oro, que ha superado los 5 mil dólares la onza, a la reducción a cero soles del presupuesto para la Fiscalía Especializada en Materia Ambiental, y al debilitamiento del Ministerio del Ambiente y del Servicio Nacional de Áreas Naturales Protegidas. “Si no hay esta capacidad de los operadores y actores de la interdicción, difícilmente podrán operar en estas zonas”, señaló.

Según Ipenza, todavía existe una visión equivocada sobre la importancia de las áreas naturales protegidas y tampoco hay conciencia de que la protección de estos espacios está garantizada por la Constitución.

En medio de esta catástrofe en áreas protegidas, el Congreso busca aprobar una norma (Proyecto de Ley 3377) para autorizar o facilitar concesiones mineras en Madre de Dios, formalizando mineros con REINFO que actualmente operan sin permiso. Eso solo alentará la expansión descontrolada de esta actividad en la Amazonía.', resumen_corto = 'Varios sitios protegidos son invadidos por cientos de mineros que operan dentro de ellos o en sus zonas de amortiguamiento. El Estado desprotege estas áreas de valor natural para el país y el Congreso impulsa normas que favorecerían la expansión de la ilegalidad.'
WHERE titulo = 'Áreas naturales desprotegidas: al menos ocho son impactadas por la minería ilegal' AND fecha_publicacion = '2026-05-21';

UPDATE reportajes SET desarrollo = 'La abundancia de recursos no siempre es sinónimo de desarrollo. En Arequipa, una de las regiones que más dinero recibe por concepto de canon y regalías mineras en el país, la riqueza que llega de esa actividad extractiva hacia las cuentas públicas no se traduce necesariamente en mejoras sustanciales en la calidad de vida de la población. Por el contrario, su uso revela una desconexión entre gasto público y cierre de brechas sociales.
 Entre el 60 % y el 70 % de los recursos del canon y regalías mineras que recibe Arequipa se destinan a obras de infraestructura vial. Así lo concluye un estudio elaborado por la Iniciativa para la Transparencia en las Industrias Extractivas (EITI), que analizó cómo 16 instituciones públicas de la región ejecutaron estos fondos en los últimos años. El problema no es solo la concentración del gasto en un solo sector, sino el bajo impacto real de esos proyectos.
 Según la investigación, gran parte de estas obras viales son de pequeña escala, con presupuestos inferiores al medio millón de soles. Eso limita significativamente su capacidad de generar bienestar sostenido. Mientras tanto, sectores estratégicos como educación y salud quedan relegados, a pesar de ser fundamentales para reducir desigualdades y mejorar oportunidades.
 En 2025, Arequipa recibió 1,035 millones de soles de canon. Una cifra significativa que pudo ayudar a reducir las brechas sociales.
 Si vemos las cifras de años anteriores, Arequipa recibió entre 2019 y 2024 un total de 7,131 millones de soles por concepto de canon minero, regalías mineras y derecho de vigencia de mina. 
 El Gobierno Regional de Arequipa concentra la mayor cantidad de recursos, cerca del 25 % del total. El 2025 recibió 258 millones de soles de canon minero: 60 % se destinó a actividades y 35% a proyectos. 
 Financió, por ejemplo, el mejoramiento de la carretera Vizcachani–Callalli–Sibayo–Achoma, en Caylloma, y de la infraestructura de algunas instituciones educativas como Medalla Milagrosa, en el distrito de Hunter.
 50 % del canon en dos distritos
Casi la mitad de las transferencias por canon se queda en dos distritos: Yarabamba y Cerro Colorado.
 El caso de Yarabamba es especialmente revelador. Con apenas 1,700 habitantes, recibió 292 millones de soles, convirtiéndose en el distrito con mayor transferencia per cápita de la región. Sin embargo, esta bonanza no se refleja en servicios básicos como el acceso al agua potable, una carencia que sigue afectando a sus vecinos. Hay millones pero permanecen, en gran medida, en las cuentas municipales.
 Cerro Colorado, por su parte, recibió 118 millones de soles. A pesar de su mayor población y dinamismo urbano, el distrito tampoco destaca por una ejecución eficiente ni por servicios públicos acordes a sus ingresos extraordinarios.
 Otros distritos como Tiabaya, Socabaya, Uchumayo, Alto Selva Alegre y Paucarpata también reciben montos significativos, mientras que zonas como San Juan de Siguas, Polobaya o Yanahuara perciben cifras marginales. Esta desigualdad responde a la actual ley del canon, que prioriza la cercanía a los proyectos mineros y la población.
 En los últimos ocho años, los gobiernos locales de Arequipa han recibido más de 5,200 millones de soles por canon, frente a los 1,500 millones del gobierno regional y los 450 millones de la universidad pública. 
 Que un distrito tenga más de un millón de soles por habitante y carezca de agua potable es la imagen más clara del fracaso del sistema.
 Canon no cierra brechas
Para Patricio Lewis, especialista de la Red de Estudios para el Desarrollo, el problema no radica solo en cuánto se gasta, sino en cómo y dónde. “Las entidades suelen priorizar proyectos muy visibles, mayormente en zonas urbanas, pero eso no garantiza el cierre de brechas en educación y salud”, explica.
 Advierte que gobernadores y alcaldes cuentan con un amplio margen de discrecionalidad para decidir el destino de estos recursos.
 Distritos como Cerro Colorado, Yarabamba, La Joya y Majes fueron los que más dinero recibieron en la última década. Sin embargo, en Majes y La Joya las desigualdades en el desarrollo local siguen siendo marcadas. Eso sugiere que el volumen de recursos no es suficiente si no existe una adecuada planificación y capacidad de ejecución. Una de las hipótesis es que estos distritos tienen una mayor población rural, con necesidades más complejas y dispersas.
 El consejero regional, César Huamantuma, coincide en que el canon no está siendo bien canalizado. Señala que el énfasis excesivo en transporte e infraestructura deja de lado sectores como educación y salud, y plantea la necesidad de una mejor programación del gasto. “Eso permitiría evitar la atomización de proyectos y apostar por iniciativas de mayor impacto, el uso del canon, hasta el momento, es una oportunidad perdida para la región”, sostiene.', resumen_corto = 'Solo en 2025, el departamento de Arequipa recibió 1,035 millones de soles de canon. Su uso, sin embargo, no ha contribuido a reducir las brechas y dar bienestar a la población. Especialistas señalan que el problema no solo es cuánto se gasta, sino cómo y dónde.'
WHERE titulo = 'Arequipa destina 7 de cada 10 soles del canon minero a obras viales' AND fecha_publicacion = '2026-02-13';

UPDATE reportajes SET desarrollo = 'Un maletín que no pasó por los rayos X en el aeropuerto de Trujillo (La Libertad) destapó una operación de lavado de activos. En agosto de 2022, Sonia Mallqui de la Cruz intentó abordar la nave con destino a Chagual, en Pataz, con sobres de manila que contenían S/1 733 277 en efectivo. La dueña del dinero, señaló Mallqui, era Orlando Tumbajulca, un minero en proceso de formalización.

Cuatro años después, en abril de 2026, el Poder Judicial condenó a 25 años de cárcel a Tumbajulca y a Mallqui por lavado de activos. Ambos están prófugos. El Juzgado Penal Colegiado Supraprovincial Transitorio de Trujillo probó que el dinero provenía de la venta de oro de procedencia ilícita y que Tumbajulca utilizó su Reinfo para legalizarlo.

El proceso fue así. Tumbajulca, gracias a su Reinfo, acopió mineral de mineros ilegales en Pataz. Luego, lo vendió como si lo hubiera extraído de su concesión autorizada, la mina Río Bravo. Pero el dueño de esa concesión dijo que no tenía ningún vínculo con su mina y aseguró que en ella no se extrae oro.

Así, un Reinfo bastó para que el oro fuera vendido a una planta procesadora o de beneficio, se efectuara el pago de casi S/2 millones al minero con Reinfo y el dinero fuera depositado en una cuenta bancaria. Aunque la transacción fue bancarizada, los jueces concluyeron que "el dinero incautado tiene una procedencia ilícita vinculada a la minería ilegal".

Este caso muestra, una vez más, que las plantas procesadoras son uno de los eslabones de la minería ilegal. Varios estudios hablan de cerca de 400 plantas a nivel nacional. En su mayoría, operan en el sur y en la costa. Hay plantas en Junín, Puno, Ayacucho, Pasco y Apurímac, así como en Arequipa, La Libertad, Áncash, Lima e Ica. Solo en La Libertad, el Instituto Geológico, Minero y Metalúrgico (INGEMMET) registró 38 plantas. Entre Nasca (Ica) y Chala (Arequipa) hay instalaciones industriales con pozas de relaves, algunas que no figuran en los registros oficiales, según investigaciones recientes.

Todo indica que estas plantas operan con trazabilidad mínima o sin trazabilidad. Tal vez por eso, la jefa de la Superintendencia Nacional de Aduanas y de Administración Tributaria (SUNAT), Marilú Llerena, anunció meses atrás una mayor supervisión a las plantas que acopian material minero.

De acuerdo con Iván Arenas Ramírez, director de la consultora Diálogo Social, la mayoría de las plantas procesadoras compra oro a terceros. Al hacerlo, solo se fijan en si el productor tiene Reinfo y RUC vigentes, pero no se ocupan del origen del oro. Por eso, señala Arenas, "pueden decir que yo le compro a tal minero con documentos", aunque eso no garantice el origen legal del mineral.

Esto se relaciona con el aumento de oro exportado sin que se precise su origen. Según el Instituto Peruano de Economía (IPE), más del 40 % del oro vendido por canales formales al extranjero no tiene un origen conocido. Se trata de más de 100 toneladas vendidas, gracias a las plantas de procesamiento y a los mineros con Reinfo.', resumen_corto = 'La condena a 25 años de cárcel a dos personas por vender oro ilícito a una planta de beneficio muestra cómo estas compran el mineral sin preguntar por su origen. Y los vendedores usan el Reinfo como fachada para el blanqueo.'
WHERE titulo = 'Así lavan el oro ilegal plantas procesadoras y mineros con Reinfo' AND fecha_publicacion = '2026-07-30';

UPDATE reportajes SET desarrollo = 'En julio próximo se instalará el nuevo Congreso peruano con sus dos cámaras, la de senadores y la de diputados. Hasta el cierre de esta nota, era casi seguro que un número importante de virtuales legisladores tenían nexos con la minería informal.

En la elección del 12 de abril fueron elegidos y reelegidos operadores políticos que defienden, representan y buscan dar un nuevo marco legal que favorece a este sector de la economía informal. Los nuevos integrantes del Parlamento, usando las palabras del analista Iván Arenas, conformarán la nueva “Bancada Reinfo”.

En el saliente Congreso también hubo una bancada multipartidaria que jugó a favor de esta actividad económica que ha ocasionado muchos problemas. Ha estado conformado tanto por congresistas de izquierda como de derecha. La nueva Bancada Reinfo también tiene voceros de diferentes tiendas, entre ellas Juntos por el Perú, Fuerza Popular y Renovación Popular, principalmente.

DYD revisó los vínculos de algunos virtuales senadores y diputados con la minería ilegal e identificó a posibles aliados de este sector. Uno de ellos es Víctor Raúl Cutipa Cama, actual congresista por Ilo y presidente de la Comisión de Energía y Minas. Cutipa, virtual reelegido como senador por Juntos por el Perú, se ha convertido en uno de los principales impulsores de cambios al régimen de concesiones mineras que favorecerían a los informales. Aunque no figura en el padrón de formalización minera (Reinfo), su papel ha sido clave en el objetivo de modificar las normas que impactan directamente en contra de la minería formal y favorecen a la informal.

El profesor y dirigente Andrés Avelino Ramos Huillcas es el virtual senador por Apurímac de Juntos por el Perú. Él ha tomado posición sin rodeos para respaldar la actividad minera informal y cuestionar la presencia de grandes empresas. En la misma región y partido aparece el dirigente minero Jesús Pérez Alccahuamán, que cuenta con el respaldo político de la Federación Regional de Comunidades Indígenas Mineras de Apurímac (FEDECIM). Su agenda consiste en impulsar la Ley MAPE, modificar la Ley General de Minería y revisar el sistema de concesiones. Es decir, seguir cambiando las reglas del juego para que la informalidad tenga respaldo legal.

Desde Arequipa, el virtual senador por el Partido del Buen Gobierno Juver Nilson Flores Suárez se mueve en el nivel de la vocería. Como abogado y consultor, ha sido asesor del Congreso y de la Federación de Mineros Artesanales de Arequipa. Aparece como posible vocero de los mineros artesanales, y su rol político podría contribuir a instalar en la agenda nacional este tema.

En La Libertad, el patrón se repite, pero con más poder acumulado. Diego Bazán Calderón, actual congresista y virtual diputado por Renovación Popular, apoyó la ampliación del Reinfo, una decisión política que extendió la vida legal de miles de operaciones informales. A su lado estará Víctor Sefererino Flores Ruiz, de Fuerza Popular, quien fue uno de los parlamentarios que votó a favor de leyes que benefician a la minería ilegal, como la norma que dejó de considerarla organización criminal. Llegó a tener nueve concesiones mineras en La Libertad y Piura: cinco fueron extinguidas entre 2017 y 2021 por caducidad o falta de pago, mientras que las otras fueron transferidas. El parlamentario impulsa, además, el proyecto de ley 11238/2024-CR, que propone un nuevo régimen para la minería artesanal y de pequeña escala (MAPE).

Gilmer Trujillo Zegarra, también de Fuerza Popular, plantea formalizar sin criminalizar a los “mineros artesanales”. La frase parece conciliadora, pero en la práctica abre una puerta amplia para formalizar sin fiscalizar y sin señalar cómo se regularía sin sancionar.

En Puno, el virtual diputado de Ahora Nación Helard Bladimir Sonco Villanueva tiene cercanía con la minería artesanal, por lo que podría sumarse a este bloque. Y en Cajamarca, el virtual diputado de Juntos por el Perú es Gabriel Robertino Gonzles Delgado. Fue vicepresidente del Frente Ambiental y en campaña señaló que defenderá la inviabilidad del megaproyecto Conga de Minera Yanacocha. Anunció también la presentación de un proyecto de ley para que los grandes grupos de poder paguen por el uso de las aguas subterráneas y que la SUNAT fiscalice la salida de los minerales de las mineras al extranjero.

No todos han declarado abiertamente su respaldo a la minería informal; algunos mostrarán su postura cuando asuman sus cargos y deban tomar decisiones respecto al control y supervisión de las actividades mineras fuera de la ley. Lo que sí hay es un bloque que defenderá a esta actividad desde dentro del poder político.

Lo que preocupa
Víctor Fuentes, especialista del Instituto Peruano de Economía, advierte que los cambios que impulsaría este grupo tendrían un impacto negativo. “En el Perú, sacar adelante un proyecto minero formal toma décadas. Si el Congreso amplía esquemas transitorios como el Reinfo, envía una pésima señal: incumplir reglas puede terminar premiado con más plazo y menos exigencias”, señala.

Para Fuentes, el riesgo es que se golpea a la minería formal por varios frentes. “Se rompe la cancha —el formal paga impuestos y cumple estándares; el informal muchas veces no—, se deterioran las expectativas de inversión y se debilitan la recaudación, el empleo formal y el crecimiento”, explica.

Además, identifica tres focos críticos. Desde la ampliación del Reinfo, que prolonga un régimen temporal sin solución de fondo; pasando por la nueva ley para la pequeña minería, que plantea beneficios y esquemas especiales; hasta el más delicado con los cambios a la Ley General de Minería y al sistema de concesiones, con propuestas como sancionar concesiones llamadas “ociosas” o imponer exigencias rígidas de producción.', resumen_corto = 'Virtuales congresistas promueven cambios legales en favor de la minería informal. Pertenecen a Juntos por el Perú, Fuerza Popular, Renovación Popular, Partido del Buen Gobierno y Ahora Nación. Sus propuestas apuntan a flexibilizar normas y ampliar el Reinfo.'
WHERE titulo = 'Bancada Reinfo: los nuevos aliados de la informalidad en el Congreso' AND fecha_publicacion = '2026-04-24';

UPDATE reportajes SET desarrollo = 'En 2021, según el portal Congrezoo, cuatro políticos de tres partidos financiados por mineros inscritos en el REINFO fueron elegidos congresistas y, en estos años, impulsaron o respaldaron leyes y medidas a favor de este mecanismo, a pesar de que su fracaso es evidente. Se trata de Lady Camones Soriano, de Alianza para el Progreso (APP); Heidy Juárez Calle, elegida por APP y que ahora pertenece a Podemos Perú; Ariana Orué Medina, de Podemos Perú; y María Taipe Coronado, de Perú Libre.
 En aquella campaña electoral, otros 24 candidatos recibieron aportes de los mineros inscritos en el Registro Integral de Formalización Minera (Reinfo), pero no ganaron. Estos pertenecían al Partido Morado, Acción Popular, Avanza País, Renovación Popular y Somos Perú. Lo publicado por Congrezoo solo recoge datos de los reportes entregados a la Oficina Nacional de Procesos Electorales (ONPE). ¿Cuántos no reportaron aportes de los mineros del REINFO?
 Parece que la influencia de este sector aumentará en las elecciones del próximo año. Según recientes estudios, siete de cada diez electores consideran probable que la minería informal e ilegal financie la próxima campaña electoral.
 En varias regiones hay candidatos a la Cámara de Senadores y a la Cámara de Diputados con mucha cercanía a los mineros informales. Guido Bellido Ugarte, confirmado candidato al Senado por Podemos Perú, impulsó varias iniciativas vinculadas a la minería informal.
 Entre junio de 2022 y noviembre de 2025, según Ojo Público, Bellido sostuvo más de 50 reuniones con miembros de la Confederación Nacional de Pequeña Minería y Minería Artesanal del Perú (Confemin) en su despacho congresal. Uno de sus visitantes fue Brussi Elwis Vilca Vilcapaza, quien fue dirigente de la minería ilegal de La Pampa, en Madre de Dios, aunque él lo niega.
 Bellido no solo atiende a los mineros ilegales en su despacho: ha viajado en varias ocasiones a zonas mineras donde se realizaron las sesiones descentralizadas de la Comisión de Energía y Minas del Congreso. En esas audiencias se recogieron propuestas que forman parte de la última propuesta de Ley de Minería Artesanal y de Pequeña Escala (MAPE).
 Partidos políticos como Podemos y Renovación Popular, por ahora, tienen entre sus precandidatos a personas vinculadas con la minería informal, a pesar de que, según el Centro Wiñaq, más de la mitad de los ciudadanos (54,6 %) votará, en 2026, por un candidato que proponga controlar y restringir estas actividades informales e ilegales. Solo el 8,9 % respondió que votaría por uno que sea cercano a estos sectores.
 Mientras tanto, el Congreso podría ampliar el Reinfo hasta diciembre de 2027, pese a la oposición de especialistas. Al respecto, el Observatorio de Minería Ilegal (OMI) consideró, en un comunicado, que la prórroga permitiría que miles de operadores continúen sin instrumentos de gestión ambiental aprobados, sin autorización de uso de agua, sin certificación de insumos fiscalizados y sin obligaciones de remediación.', resumen_corto = 'Los aportes de mineros con REINFO a candidatos y partidos colocan al país frente a un riesgo mayor: que el próximo Congreso legisle a favor de un sector cuyo avance ha erosionado ecosistemas, corrompido instituciones y desafiado al Estado de derecho.'
WHERE titulo = 'Candidatos serían financiados por mineros inscritos en el REINFO como en 2021' AND fecha_publicacion = '2025-12-03';

UPDATE reportajes SET desarrollo = 'La Libertad es una de las regiones del país que más recursos recibe por concepto de canon, sobrecanon, regalías mineras, renta de aduanas y participaciones. Sin embargo, el contraste entre los montos transferidos y la realidad social de sus provincias, sobre todo de la sierra, vuelve a poner en cuestión la eficiencia, el enfoque y la calidad del gasto público regional.

Los datos oficiales del Ministerio de Economía y Finanzas (MEF), obtenidos de la herramienta Consulta Amigable, revelan una paradoja persistente: altos niveles de ejecución presupuestal, pero impactos limitados en servicios básicos, cierre de brechas y desarrollo sostenible.

De acuerdo con la información del MEF, el Gobierno Regional de La Libertad ha manejado en los últimos años montos superiores a los 110 millones de soles anuales provenientes del canon y recursos asociados. En términos técnicos, el presupuesto se ejecuta. En términos sociales, la pregunta es otra: ¿en qué se gasta y qué resultados concretos se obtienen?

De acuerdo con los registros del MEF, durante el 2025 el Gobierno Regional de La Libertad ejecutó más de S/ 118 millones por concepto de canon, sobrecanon, regalías, renta de aduanas y participaciones. El nivel de avance supera el 91 %, un indicador que, en términos administrativos, suele presentarse como sinónimo de eficiencia. Sin embargo, un análisis económico más fino muestra que ejecutar no es lo mismo que invertir estratégicamente.

El dato más revelador del presupuesto 2025 es la concentración del gasto en la categoría “Asignaciones presupuestarias que no resultan en productos”, que absorbe más de S/ 92 millones, es decir, alrededor del 78 % del total del canon ejecutado. Se trata de recursos que no están directamente asociados a bienes o servicios finales claramente identificables para la ciudadanía.

En contraste, los programas orientados a resultados concretos reciben montos significativamente menores. Educación básica regular, saneamiento rural, salud mental, desarrollo infantil temprano o reducción de vulnerabilidad ante desastres concentran presupuestos que, sumados, no alcanzan ni una fracción de lo destinado a asignaciones sin producto.

En educación básica regular, el Gobierno Regional ejecutó más de S/ 12 millones, con un avance cercano al 97 %. Aunque el porcentaje es alto, el monto resulta modesto frente a las brechas persistentes en infraestructura escolar, conectividad y calidad educativa, especialmente en provincias del ande liberteño.

En salud, el panorama es aún más revelador. Programas como salud materno neonatal y salud mental presentan presupuestos reducidos, pese a que La Libertad enfrenta altos indicadores de embarazo adolescente, depresión, violencia y problemas de acceso a servicios especializados. La lógica del gasto prioriza la ejecución contable antes que una respuesta proporcional a la magnitud de los problemas sociales.

El análisis de los proyectos de inversión financiados con canon minero en 2025 expone otra debilidad estructural. Iniciativas emblemáticas, como el mejoramiento del Hospital Provincial de Virú (S/ 37 millones) o la ampliación de la Escuela Superior de Arte Dramático Virgilio Rodríguez Nache (S/ 17.5 millones), figuran con ejecución cero o prácticamente nula.

Desde el punto de vista económico, estos proyectos representan capital inmovilizado. El dinero existe, está presupuestado, pero no se traduce en obra, empleo ni servicios. Mientras tanto, pequeñas inversiones en mobiliario escolar, campos deportivos comunales o sistemas informáticos alcanzan el 100 % de ejecución.

El problema no es solo técnico, sino territorial. Provincias como Pataz, Santiago de Chuco, Otuzco o Sánchez Carrión, directamente impactadas por la actividad minera —formal, informal e ilegal— no reflejan mejoras proporcionales a los recursos que el canon genera. Persisten problemas de agua potable, caminos, servicios de salud y alternativas productivas.

El caso del canon minero en La Libertad durante 2025 deja una lección clara: una alta ejecución presupuestal no garantiza desarrollo. El énfasis en “gastar todo” antes de fin de año termina desplazando la discusión central: qué se gasta, para qué y con qué resultados.', resumen_corto = 'Aunque La Libertad ejecuta más del 90 % de los recursos del canon y transferencias asociadas, la mayor parte del gasto se concentra en asignaciones sin productos concretos, mientras salud, educación y saneamiento reciben montos marginales. El resultado: alta ejecución contable, pero escaso impacto social en las provincias más afectadas por la actividad minera.'
WHERE titulo = 'Canon minero en La Libertad: mucho dinero ejecutado, pocas brechas cerradas' AND fecha_publicacion = '2026-02-27';

UPDATE reportajes SET desarrollo = 'El presupuesto de muchos gobiernos regionales, municipalidades provinciales y distritales no se explica sin el canon y las regalías mineras. En Moquegua, estos recursos representan hasta el 90% del total disponible para ejecutar obras, es decir, nueve de cada diez soles del financiamiento de obras, provienen directamente de la actividad extractiva minera.
 Solo en 2025, la región Moquegua recibió poco más de 1,290 millones de soles por canon y regalías mineras vinculadas a la actividad de las minas Cuajone de la empresa minera Southern Perú y la mina Quellaveco de Anglo American. En términos presupuestales, estas transferencias explican más del 90 % del gasto regional y una proporción aún mayor en los municipios distritales y provinciales.
 Sin embargo, en Moquegua persisten los niveles anemia, superando el promedio nacional, mientras que los servicios básicos siguen siendo insuficientes en algunas zonas críticas de la región.
 Los problemas
El canon sirve para financiar infraestructura y también para garantizar el funcionamiento cotidiano del Estado en las regiones. Pero esta dependencia también tiene costos. Las regiones altamente vinculadas al canon son más vulnerables a los cambios en el sector, que son afectados sobre todo por la volatilidad de los precios internacionales de los minerales. Cuando los ingresos caen, los presupuestos disminuyen; cuando aumentan, ocurre lo contrario.
 A ello se suma un problema más difícil de enfrentar, la limitada capacidad de gestión y la baja calidad del gasto. Estos recursos no siempre se destinan a cerrar brechas sociales ni a atender las necesidades de la población, así, regiones y municipios con presupuestos millonarios tienen dificultades para ejecutar obras de calidad.
 La región Moquegua no es ajena a la crisis en la eficiencia de gasto público. De acuerdo a ComexPerú, a finales del 2025, Moquegua ocupaba el puesto 12 del ranking nacional, con 51 obras paralizadas con un presupuesto truncado de 1 199 millones de soles. Entre las obras paralizadas figuran los 115 kilómetros de la carretera pendientes de asfalto en la ruta Moquegua–Omate–Arequipa y el camal municipal de Mariscal Nieto. 
 Un ejemplo de obra cuyo presupuesto y plazo de ejecución se extendió más de lo previsto es la construcción del camal municipal ejecutada por la Municipalidad Provincial de Mariscal Nieto. El proyecto comenzó en 2019 con un presupuesto de 39 millones de soles y un plazo de ejecución de 660 días. Hoy lleva poco más de 5 años sin culminar y su presupuesto se incrementó a 58 millones de soles. 
 Otro ejemplo. En agosto de 2025, el alcalde del distrito de San Antonio en la provincia de Mariscal Nieto, Eulogio Santos Villegas, inauguró un parque temático en un área de 3 mil metros cuadrados. Contagiado por la fiebre de la tendencia y la popularidad, ideó un parque en homenaje al Capibara, para ello destinó 10 millones de soles del canon minero, además el municipio viene ejecutando el primer parque temático en homenaje a Dragon ball con un presupuesto de 26 millones de soles, recientemente, inauguró un parque temático alusivo al amor, con un presupuesto que bordeó los 12 millones de soles.
 El economista Javier Flores Arocutipa señala que las obras de impacto superan presupuestos por encima de los 500 millones de soles. Anualmente, Moquegua podría cubrir el costo de dos obras de gran impacto, sin embargo, el dinero se distribuye entre los gobiernos provinciales y distritales. “No veo que haya proyectos emblemáticos e importantes a nivel de Moquegua con un impacto regional”, sostuvo en diversos medios de prensa.
 Encontrar ese equilibrio depende de la continuidad del modelo de financiamiento que sostiene a las regiones. Porque, en la práctica, el canon es la columna vertebral del gasto público descentralizado y, como toda columna vertebral, su estabilidad también depende de la estabilidad política y económica del país. A ello se suman medidas urgentes para fortalecer los controles institucionales y prevenir actos de corrupción.', resumen_corto = 'En varias regiones del Perú, hasta el 70 % del presupuesto depende de las transferencias por minería. Sin ese flujo, los gobiernos regionales y los municipios verían limitado el presupuesto disponible para ejecución de obras en beneficio de su localidad.'
WHERE titulo = 'Canon y regalías mineras sostienen el 70% del presupuesto de la región Moquegua y hasta el 90% en obras y proyectos' AND fecha_publicacion = '2026-06-12';

UPDATE reportajes SET desarrollo = 'El presupuesto de muchos gobiernos regionales y municipalidades provinciales y distritales no se explica sin el canon y las regalías mineras y gasíferas. En algunos casos, estos recursos representan alrededor del 70 % del total disponible para ejecutar obras. Es decir, siete de cada diez soles que financian obras, servicios y el funcionamiento del Estado subnacional provienen directamente de la actividad extractiva minera y gasífera.

La región Cusco recibió, solo en 2024, unos 3,000 millones de soles por canon y regalías gasíferas y mineras, vinculadas al proyecto Camisea, en la provincia de La Convención, así como a las actividades mineras en Chumbivilcas y Espinar. En La Convención, de donde se extrae el gas, ese flujo ha llegado a superar los 1,000 millones de soles anuales. En términos presupuestales, estas transferencias explican más de los dos tercios del gasto regional y una proporción aún mayor en los municipios distritales de esa provincia.

El año pasado, La Convención absorbió más de la mitad del canon y las regalías gasíferas de toda la región, con más de mil millones de soles, mientras que Chumbivilcas y Espinar encabezaron las transferencias por renta minera, al concentrar más del 50 % de todo el canon minero regional. Por su parte, el Gobierno Regional del Cusco recibió más de 718 millones de soles por canon minero y gasífero (ver infografía).

Las brechas que no se cierran
Ese dinero que, en teoría, debería traducirse en obras, servicios y cierre de brechas; pero eso no sucede. En estas localidades, los niveles de pobreza, anemia y desnutrición superan el promedio nacional, mientras que los servicios básicos siguen siendo insuficientes. Según el último estudio del Instituto Nacional de Estadística e Informática (INEI), dieciocho de cada cien cusqueños se encuentran en condición de pobreza monetaria.

Es cierto que el canon sirve para financiar infraestructura y también para garantizar el funcionamiento cotidiano del Estado en las regiones, pero esta dependencia también tiene costos. Las regiones altamente vinculadas al canon son más vulnerables a la volatilidad de los precios internacionales de los minerales y a las decisiones de inversión de las grandes empresas extractivas. Cuando los ingresos caen, los presupuestos disminuyen.

A ello se suma un problema más difícil de enfrentar: la limitada capacidad de gestión y la baja calidad del gasto. Estos recursos no siempre se destinan a cerrar brechas sociales ni a atender las necesidades de la población. Así, regiones y municipios con presupuestos millonarios tienen dificultades para impulsar obras de calidad.

Al respecto, Fernando Santoyo, presidente de la Cámara de Comercio del Cusco, señaló, en un evento organizado por REDES, que regiones como Cusco enfrentan una crisis en la eficiencia del gasto público. Esto se traduce en obras paralizadas, proyectos de escaso impacto y carencias en servicios básicos de infraestructura, salud y saneamiento.

Santoyo planteó la necesidad de establecer una planificación articulada entre el gobierno regional, las municipalidades y el sector privado para priorizar la inversión del canon y convertirla en mejores servicios públicos.

De encontrar ese equilibrio depende la continuidad del modelo de financiamiento que sostiene a las regiones. Porque, en la práctica, el canon es la columna vertebral del gasto público descentralizado y, como toda columna vertebral, su estabilidad también depende de la estabilidad política y económica del país.

La corrupción de siempre
A ello se deben sumar medidas urgentes para fortalecer los controles institucionales y prevenir actos de corrupción. Y es que más de una docena de anteriores y actuales alcaldes de La Convención son investigados: algunos presos y otros fugados, por presuntos actos de corrupción. La semana pasada, el alcalde de La Convención, Alex Curi León, pasó a la clandestinidad para huir de una orden de detención dictada por un caso de presunto cobro de coimas para favorecer con contratos.

Asimismo, dos exgobernadores regionales (Hugo Gonzales y Jorge Acurio) han sido condenados por corrupción, y otras exautoridades están siendo investigadas por esos mismos delitos.
 DATOS

 La Convención concentra el 57,2 % del total del canon y regalías gasíferas de la región, con más de mil millones de soles transferidos en 2025.

Chumbivilcas y Espinar lideran el canon minero, con más de S/112 millones y S/123 millones, respectivamente. Eso representa el 54 % de la renta minera regional.

GORE Cusco recibió más de S/718 millones por canon minero y gasífero.

El canon gasífero representa más del 70 % del total de recursos distribuidos entre el GORE y las provincias.

El canon minero aporta el 20 % del total de recursos distribuidos entre el GORE y las provincias.

Según el INEI, la pobreza monetaria en Cusco ascendió a 18,8% en 2025. 

VER INFOGRAFIA', resumen_corto = 'La región imperial recibe miles de millones por canon y regalías, pero esa riqueza no logra cerrar brechas básicas. Todavía hay pobreza, servicios precarios y una gestión pública sin eficiencia. Sin ese flujo financiero, el GORE y los municipios verían paralizada su capacidad de gasto.'
WHERE titulo = 'Canon y regalías mineras y gasíferas sostienen más del 70 % del presupuesto en Cusco' AND fecha_publicacion = '2026-05-08';

UPDATE reportajes SET desarrollo = 'Por: Yuri Castro

Hasta hace algunos años, las organizaciones criminales en Trujillo se limitaban a disparar contra las casas de sus víctimas o dejar una carta con balas como advertencia para forzar el pago de cupos. Hoy usan dinamita y cargas explosivas completas en zonas urbanas. Según fuentes policiales, las bandas de extorsionadores usan al mes de 50 a 100 cartuchos de dinamita.

El ataque de la semana pasada en la avenida Santa, donde una carga voló una vivienda y dañó más de 200 inmuebles y negocios, muestra que las mafias tienen alianzas con otras actividades ilícitas, lo que les da acceso directo a material explosivo.

¿De dónde obtienen los explosivos? De acuerdo con las fuentes policiales y de la Superintendencia Nacional de Control de Servicios de Seguridad, Armas, Municiones y Explosivos de Uso Civil (Sucamec), los consiguen de la minería ilegal, esa que se ha camuflado con la etiqueta de “en proceso de formalización”.

Los mineros inscritos en el Registro Integral de Formalización Minera (Reinfo) compran explosivos sin ninguna fiscalización, para luego venderla en el mercado negro. Si bien son adquiridos legalmente, ya que el REINFO se los permite, son desviados hacia las organizaciones criminales. Un cartucho de dinamita se vende a 10 soles en el “mercado muerto”. No es casualidad quecada semana seann detenidos 5 o 7 delincuentes con artefactos de este tipo.

El vacío legal
Un cambio hace cinco años a la Ley que regula el uso civil de armas de fuego, municiones y explosivos agravó el problema. Antes, se obligaba a un policía en actividad a custodiar cada embarque de dinamita adquirido por mineras, desde la compra hasta su traslado a la zona de exploración y explotación. Toda compra y traslado tenía guías de remisión verificada.

Hoy la situación cambió. No es necesaria la presencia de un policía, basta con vigilancia privada que no rinde cuentas a la autoridad. El control del traslado se redujo a un trámite burocrático sin garantías de seguridad.

Las mafias, con la complicidad de mineros con Reinfo, le han sacado provecho. La dinamita que antes usaban en socavones hoy se usa como arma para extorsionar en Trujillo y otras provincias de La Libertad.

“Los cartuchos de dinamita se venden como pan caliente en el mercado negro. Si el Estado no corta el desvío desde la minería informal, la próxima tragedia podría costar decenas de vidas. Sucede que al no existir un custodio policial que controle la carga explosiva, una parte de ella puede ser bajada por el camino. Debería regresar a como era antes para evitar este desvío, pues de darse este desvío, el policía, que responde a sus superiores, puede formular un acta advirtiendo lo sucedido”, explicó una fuente policial.

Ahora para manipular y usar explosivo basta con una autorización de la Sucamec, tener un polvorín donde se almacenará la carga, contar con personal autorizado para la manipulación y listo. Se puede trasladar la carga explosiva como si se tratara de un cargamento de verduras. Las fuentes explicaron que, incluso, mineros con REINFO que operan en Pataz (La Libertad), sospechosamente, cuentan con polvorines en Arequipa y Tacna, lo que dificulta más el control. “La ley se los permite lamentablemente”, explicaron.

“Destruyen rocas”
El exintegrante de la Unidad de Desactivación de Explosivos (UDEX) de la Policía, Ángel Santoyo Puicón, calcula que el 5 % de la dinamita adquirida por los mineros en vías de formalización en un mes termina en manos de las organizaciones criminales. “De 1000 cartuchos adquiridos, unos 50 van a parar a la extorsión. No hay control”, refirió el exagente, quien en la década de los 80 y 90 luchó contra el terrorismo.

Para Santoyo Puicón, las consecuencias son destructivas y podrían agravarse. Según su experiencia, en el ataque de la semana pasada usaron de 15 a 20 cartuchos de dinamita de 5 mil de emulsión. “Con todos sus componentes, es decir con su detonador y mecha. Un explosivo muy potente que se usa para destruir rocas en los cerros en la minería ilegal e informal en Pataz. De allí la destrucción que ha causado en las viviendas y alrededores”, explicó el experto.

En Trujillo, según Santoyo Puicón, sólo hay cuatro especialistas en desactivación de explosivos. “Éramos cinco, pero pasé al retiro. Ahora solo son cuatro que deben atender emergencias en la desactivación de explosivos en toda La Libertad”, comentó.

“Es un negocio aparte”
Greco Quiroz Díaz, abogado penalista y exconsejero regional de La Libertad, tiene estimaciones más preocupantes. “Hay una ganancia extrema que explica por qué más del 50 % de la dinamita que se compra de forma legal termina desviada hacia actividades ilícitas. Cada dinamita cuesta entre 20 a 50 soles”, advierte.

Cuestiona que la norma actual no obligue a que policías en actividad custodien el traslado y uso de explosivos. “Mineros informales con credenciales de ‘en proceso de formalización’ acceden a comprar grandes lotes de dinamita con autorización de la Sucamec, pero en la práctica destinan buena parte al negocio ilegal, es un negocio aparte. Un minero artesanal con una operación pequeña no necesita mil cartuchos de dinamita, pero los adquiere igual porque sabe que la mitad los venderá a organizaciones criminales”, sostiene Quiroz.

Greco Quiroz plantea que cada cartucho de dinamita tenga un código de serie, como ocurre con las balas. “De esta manera, si se incauta un explosivo en manos de extorsionadores, se podrá rastrear con exactitud al comprador formal que desvió el material. También hay que fortalecer a la Sucamec, dotándola de ingenieros de minas y articulando sus registros con la Dirección de Fiscalización Minera y las Gerencias Regionales. Sin ese cruce de información, seguirá siendo fácil comprar dinamita en exceso bajo fachada de ‘uso minero’, añadió.', resumen_corto = 'El 5 % de dinamita comprada por mineros con REINFO va a parar a manos de criminales y es usada en actos de intimidación y extorsión.

 Cargamento explosivo que es adquirido por mineros e proceso de formalización no es custodiado por policías, como antes se hacía. Variación de la Ley que regula el uso y manipulación de explosivos es letal para la población.'
WHERE titulo = 'Carga explosiva que destruyó viviendas en Trujillo es la misma que usa la minería ilegal en Pataz' AND fecha_publicacion = '2025-08-21';

UPDATE reportajes SET desarrollo = 'Según un reciente estudio del Centro Wiñaq sobre el impacto político de la minería ilegal, a ningún candidato presidencial o congresal le conviene estar del lado de esa actividad ilícita. Eso se debe a que, para la mayoría (65,8 %), de acuerdo con los resultados de encuestas y focus group, la minería ilegal es percibida como destructiva, muy contaminante, violenta y ligada a redes criminales. En contraste, solo el 16,9 % dijo que esta actividad es positiva para el país porque crea empleos y tiene poco impacto en el medioambiente. Para la mayoría, esta minería aumenta el crimen, tanto en áreas específicas o en todo el país.

Apoyar la minería ilegal haría que varios candidatos pierdan a sus electores, quienes se manifestaron en contra de esta actividad. Por ejemplo, el 68,8 % de los votantes de Keiko Fujimori considera que la minería informal es negativa para el país, así como el 80 % de los electores de Rafael López Aliaga, el 70 % de Carlos Álvarez, el 80 % de López Chau, el 58 % de Phillip Butters, entre otros.

Por esa razón, la mayoría de los ciudadanos (54,6 %) afirmó que, en las elecciones generales del próximo año, votaría de preferencia por un candidato que proponga controlar y restringir las actividades de la minería informal e ilegal en el país. Este hallazgo es relevante porque obligará a los partidos y candidatos con vínculos con gremios de mineros ilegales camuflados en la informalidad a replantear su postura respecto de esta actividad. No hay que olvidar que este sector perjudica al Estado peruano al evadir el impuesto a la renta por 5.200 millones de soles, de los cuales el 50 % debería llegar a las cuentas de los gobiernos regionales y municipales, para luego traducirse en obras para los ciudadanos.

Para el Centro Wiñaq, esta respuesta es parte de una extensión del enfoque de “mano dura” que la población demanda para controlar los efectos de las economías ilegales en la inseguridad ciudadana, que va en aumento. En cambio, cuando se les preguntó si votarían por un candidato que defienda la minería ilegal, solo el 8,9 % respondió que sí. “La gente no está reconociendo a ningún político por apoyar a la minería informal. No hay capitales políticos que estén ganando. Lo están viendo de manera muy negativa”, dijo Franco Olcese, socio del Centro Wiñaq.

Asimismo, según el estudio, existe la percepción de que la minería ilegal ejerce una fuerte influencia negativa en el Congreso y que, para evitar esa influencia, los ciudadanos votarían por un candidato que la controle o la restrinja. El 70,2 % consideró que los congresistas que respaldan propuestas vinculadas a este tipo de minería —que se realiza sin controles legales, tributarios ni ambientales— lo hacen porque reciben financiamiento de actores ilegales.

El estudio también reveló que la mayoría de los ciudadanos (60,5 %) opinó que ninguna de las bancadas está haciendo un buen trabajo respecto de la minería ilegal, mientras que el 22 % dijo que no está informado sobre el tema.

La minería ilegal se ha convertido en un problema medular para el país, profundamente arraigado en la percepción ciudadana. De cara a las elecciones presidenciales, los peruanos tienen claro que no respaldarán a candidatos que defiendan esta actividad ilícita. La exigencia de control y restricción refleja una demanda colectiva por mayor seguridad, legalidad y justicia.', resumen_corto = 'Un reciente estudio del Centro Wiñaq concluyó que la mayoría de los ciudadanos peruanos votaría por un candidato que aplique medidas para reducir la minería no formal. Esa mayoría exige control esa actividad a la que asocia con la inseguridad, la contaminación ambiental y la corrupción.'
WHERE titulo = 'Cinco de cada diez peruanos no votarían por un candidato defensor de la minería informal' AND fecha_publicacion = '2025-08-29';

UPDATE reportajes SET desarrollo = 'El peligro de la minería ilegal está llegando a las regiones. Si llegaron a Pataz y sembraron muerte y contaminación, pronto entrarán a Piura y Cajamarca a hacer lo mismo; si llegaron a Madre de Dios, ya están cerca del Cusco; si se empoderaron y liberaron territorios en La Rinconada, en Puno, también lo están haciendo en Atico, en Arequipa.

Ese es el mensaje y la advertencia que deja la campaña de sensibilización contra el avance de la minería ilegal que el Colectivo PAS empezó en varias regiones del país. Se centra en dar mensajes en espacios públicos que visibilizan los impactos y el peligro de esta actividad, que se expande rápidamente en regiones andinas y amazónicas donde hay grandes reservas de minerales.

La minería ilegal no solo destruye bosques y contamina fuentes de agua con metales pesados como el mercurio, sino que también está asociada a redes de trata de personas, trabajo infantil, evasión fiscal y violencia armada. Aunque durante años se ha concentrado en zonas como Madre de Dios, La Libertad o Puno, sus tentáculos, en la actualidad, alcanzan otras regiones.

Según el Colectivo PAS, el avance de la minería ilegal pone en riesgo a las comunidades rurales, a los ecosistemas andinos y a los territorios ancestrales de pueblos originarios. Su campaña busca movilizar a la ciudadanía y exigir al Estado una respuesta más firme y coordinada.

En el Perú, la minería ilegal ha superado, en algunos casos, a la formal en volumen de oro extraído, y ha colocado al país como el principal exportador sudamericano de oro ilegal. Se calcula que sus ganancias anuales suman alrededor de 24 mil millones de soles, el 2.5 % del Producto Bruto Interno del Perú.

El aumento de esta actividad ilegal se debe a la vigencia del Registro Integral de Formalización Minera (Reinfo), que no ha formalizado sino apenas al 2.4 % de los mineros informales en casi 20 años; a la inexistencia de herramientas que permitan controlar toda la cadena productiva de la pequeña minería y minería artesanal, para determinar que el origen, procesamiento y destino final del mineral sean legales; a la falta de control de las plantas procesadoras; y a la corrupción de funcionarios públicos.

En lo ambiental, las consecuencias están relacionadas con la deforestación de bosques amazónicos, la contaminación de ríos, la pérdida de biodiversidad y la afectación a las comunidades indígenas.

Con esta campaña en las regiones, el Colectivo PAS espera crear conciencia y generar reacción social para detener el avance de una actividad que trae muerte, destrucción ambiental y corrupción.', resumen_corto = 'Si llegaron a Pataz y sembraron muerte y contaminación, pronto entrarán a otras regiones a hacer lo mismo.'
WHERE titulo = 'Colectivo PAS alerta sobre el avance de la minería ilegal' AND fecha_publicacion = '2025-06-18';

UPDATE reportajes SET desarrollo = 'Desde el Colectivo PAS – País Seguro, una organización que surge como respuesta a la inseguridad ciudadana producto de actividades ilícitas en el Perú como la minería ilegal, instamos a los Poderes del Estado a mantener la búsqueda de una solución real para la minería artesanal y pequeña minería, y no tomar decisiones apresuradas ni bajo ningún tipo de presión, como los bloqueos de carreteras y protestas, que terminan, incluso en el corto plazo, agravando los problemas institucionales, ambientales, de seguridad y contra el patrimonio que ya aquejan al país.

En el caso del Legislativo, advertimos el peligro de buscar una aprobación de la Ley MAPE sin un debate técnico y sin tener en cuenta las diferentes voces -que desde distintas posturas- han señalado que el pre-dictamen planteado, lejos de ofrecer una solución real para la minería artesanal, continúa facilitando el crecimiento de la minería ilegal y sus delitos conexos.

El propio Tribunal Constitucional ha advertido que ya no debería existir un mecanismo permanente de formalización y que fomente la impunidad, como el Registro Integral de Formalización Minera (REINFO), que ha sido utilizado de manera perversa por mineros ilegales y que tampoco se debe eximir a los inscritos en dicho mecanismo de la responsabilidad penal, como hasta ahora sucede.

En el caso del Ejecutivo, exhortamos a continuar con la depuración del REINFO y mantenerse firme, tanto en el cierre definitivo de este mecanismo -que no ha cumplido con su objetivo-, como también en la decisión de trabajar con aquellos que realmente tienen la intención de formalizarse.

Estamos en un momento de inflexión, en el cual debemos preguntarnos qué tipo de país queremos; y, sobre todo, trabajar por la seguridad y el respeto de los derechos de todos los peruanos.

#QueremosPAS
07 de julio de 2025', resumen_corto = 'Un reciente estudio del Centro Wiñaq concluyó que la mayoría de los ciudadanos peruanos votaría por un candidato que aplique medidas para reducir la minería no formal. Esa mayoría exige control esa actividad a la que asocia con la inseguridad, la contaminación ambiental y la corrupción.'
WHERE titulo = 'Colectivo PAS invoca a no ceder a las presiones para frenar combate a la minería ilegal' AND fecha_publicacion = '2025-07-07';

UPDATE reportajes SET desarrollo = 'Hasta julio de este año, los gobiernos regionales recibieron más de 2 500 millones de soles por canon y regalías mineras, mientras que los municipios superaron los 9 000 millones. Todo indica que el superciclo de los precios de los minerales seguirá elevando estas transferencias durante los próximos años.

Las nuevas autoridades regionales y municipales, que asumirán en enero de 2027, administrarán más recursos. El reto será convertirlos en desarrollo sostenible. Luis Miguel Castilla Rubio, exministro de Economía y director ejecutivo de Videnza Instituto, sostiene que estos recursos deben formar parte de una estrategia regional de largo plazo que reduzca desigualdades y disminuya la dependencia de los precios de los minerales.

Para Castilla existe una contradicción evidente entre los ingresos que genera la minería y los beneficios que percibe la población. "Hay un divorcio muy grande entre los recursos transferidos por canon y regalías y el cierre efectivo de brechas sociales", afirma.

Explica que la amplia autonomía de los gobiernos subnacionales permite que muchos destinen el canon a proyectos alejados de las necesidades más urgentes. Así, mientras algunos municipios reciben cientos de millones de soles por actividad minera, todavía existen comunidades sin agua potable, alcantarillado, servicios de salud o infraestructura educativa adecuada.

En cambio, gran parte del presupuesto termina convertido en estadios, plazas, losas deportivas y otras obras de bajo impacto. A eso se suma la atomización del gasto. En lugar de concentrar recursos en proyectos que transformen una localidad, muchas municipalidades realizan pequeñas inversiones que consumen presupuesto sin mejorar las condiciones de vida de la población.

El riesgo del clientelismo
Castilla también cuestiona el uso excesivo de la administración directa. Bajo esta modalidad, los gobiernos locales ejecutan las obras sin procesos de licitación y actúan como empresas constructoras al contratar directamente personal, maquinaria y servicios.

Diversos estudios, señala Castilla, muestran que este mecanismo favorece el empleo temporal con fines políticos, alimenta redes de clientelismo y eleva los riesgos de corrupción. Para el exministro, el país también debe dejar atrás la idea de que el desarrollo depende únicamente del cemento. Carreteras, hospitales y colegios siguen siendo indispensables, pero ya no bastan.

Las inversiones con mejores resultados sociales son las que mejoran la vida y fortalecen las capacidades de la población: agua potable y saneamiento, salud y nutrición infantil, educación de calidad, conectividad vial y digital, electrificación y otras que impulsen la producción regional y generen empleo privado.

Castilla también propone ampliar el uso del canon a proyectos productivos que mejoren la competitividad regional y fortalezcan las cadenas agrícolas, industriales y de servicios, siempre que no generen gastos permanentes para el Estado. Advierte que sería un error utilizar estos recursos para financiar burocracia o crear nuevas plazas laborales. "Los ingresos volátiles deben financiar inversiones temporales y no gastos permanentes".

Según el economista, el nuevo ciclo de ingresos mineros exige revisar la Ley del Canon para que estos recursos ayuden al cierre de brechas y al desarrollo productivo, y fortalecer el planeamiento regional para impedir que cada nueva gestión abandone proyectos estratégicos y priorice obras de corto plazo.
 Castilla sostiene que el próximo quinquenio ofrece una oportunidad difícil de repetir. Si el canon se invierte con visión de largo plazo, se traducirá en mejor educación, salud y desarrollo productivo. Si no, la bonanza minera volverá a dejar miles de millones de soles en obras que no mejoran la vida de la población.', resumen_corto = 'El nuevo ciclo de altos precios de los minerales volverá a elevar las transferencias a regiones y municipios. El desafío de las autoridades que asumirán en 2027 será usar esos recursos para cerrar brechas y generar desarrollo.'
WHERE titulo = 'Cómo evitar que el canon del boom minero termine en obras de poco impacto' AND fecha_publicacion = '2026-08-12';

UPDATE reportajes SET desarrollo = 'La ampliación del Registro Integral de Formalización Minera (Reinfo) hasta diciembre de 2026 dejó claro qué partidos respaldan a los mineros informales, un sector que se diferencia cada vez menos de la minería ilegal. Optaron por apoyar a quienes no avanzaron en la formalización minera las bancadas de Fuerza Popular (FP), Alianza para el Progreso (APP), Podemos Perú, Juntos por el Perú (JP), Perú Libre y parte de Somos Perú y Renovación Popular.

Estos partidos llevan candidatos vinculados a esta actividad ilegal. En Renovación Popular, Javier Bernal Salas, dirigente de la Confederación Nacional de Pequeña Minería y Minería Artesanal (Confemin), encabeza la lista por Puno. Podemos Perú postula al Senado al congresista Guido Bellido, uno de los que más presionó por ampliar el Reinfo. Fuerza Popular tiene al minero Joseph Aguirre como candidato a diputado por Cusco. En Juntos por el Perú, el candidato presidencial Roberto Sánchez es un defensor del sector e incluso propuso extender el Reinfo hasta 2027. Somos Perú impulsa la candidatura de Guillermo Aliaga, quien reconoce que militantes del partido están inscritos en dicho registro.

En Acción Popular, el congresista Edwin Martínez afirma que el Reinfo es necesario para proteger a los pequeños productores. Luis Aragón, parlamentario por Cusco, critica el proceso de formalización porque, según sostiene, criminaliza a todos sin distinción. En APP, Lady Camones, quien recibió aportes de mineros con Reinfo en 2021, es de sus principales defensoras.

Voces en contra
Algunos partidos empezaron a tomar distancia. En Avanza País, la candidata Karol Paredes afirma que las prórrogas del Reinfo mantienen un sistema que alimenta la informalidad y las economías ilegales. La congresista Diana González sostiene que el Estado no tiene que gastar recursos en quienes no quieren formalizarse. En Libertad Popular, el precandidato presidencial Rafael Belaunde señala que el Reinfo se convirtió en un motor de criminalidad. Propone cerrarlo definitivamente y reemplazarlo por una legislación clara bajo la ley MAPE.

Enrique Valderrama, del Partido Aprista Peruano (APRA), asegura que el registro dejó de ser una solución y plantea un nuevo proceso de formalización con incentivos reales. Además, Paul Jaimes, candidato presidencial de Progresemos, dice que no será cómplice frente a la minería ilegal que destruye la Amazonía.

Asimismo, Roberto Chiabra, de la Alianza Electoral Unidad Nacional, acusa a los defensores del Reinfo de recibir financiamiento de economías ilegales. Propone mesas de trabajo que permitan enfrentar el problema sin más ampliaciones. A su vez, Carlos Espá, de SíCreo, exige diferenciar minería ilegal, criminal, informal y artesanal. Plantea atacar redes criminales en Pataz, La Pampa y La Rinconada y hacer esfuerzos para formalizar a quienes estén dispuestos a hacerlo.

La ampliación del Reinfo no solo reveló qué partidos respaldan la informalidad minera, sino también cómo esta práctica se ha convertido en un terreno fértil para intereses políticos y candidaturas vinculadas a economías ilegales. Mientras algunos actores insisten en prórrogas que perpetúan el problema, otros advierten que el registro dejó de ser una solución y proponen medidas más firmes.

Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae, amet
 fuga harum
 nulla laborum
 aliquid maxime accusamus vitae quas minima nisi facere quidem omnis perferendis
 voluptatum corrupti,
 voluptatem aperiam quod.

Vestibulum feugiat tortor vitae diam euismod, ut et inter
 dum nisi fermentum.
 Pellentesque sed
 sodales nunc. Vestibulum laoreet erat nisi, sit amet ultrices. Vestibulum
 feugiat tortor vitae
 diam euismod, ut et inter dum nisi fermentum. Pellentesque sed sodales nunc.
 Vestibulum laoreet
 erat nisi.', resumen_corto = 'La ampliación del Reinfo expuso a quiénes respaldan a la informalidad minera y su continuidad: Fuerza Popular, Alianza para el Progreso, Podemos Perú, Juntos por el Perú, Perú Libre y parte de Somos Perú y Renovación Popular.'
WHERE titulo = 'Cómo se posicionan los partidos frente a los mineros informales' AND fecha_publicacion = '2025-12-10';

UPDATE reportajes SET desarrollo = 'En medio de la campaña electoral, la Comisión de Energía y Minas del Congreso, que está de salida, aprobó un dictamen que modifica el régimen de concesiones mineras y altera reglas que durante décadas definieron la estabilidad jurídica del sector.

Víctor Cutipa Ccama, presidente del grupo de trabajo y militante de Juntos por el Perú, aceleró su aprobación, agrupando nueve proyectos de ley que buscaban introducir cambios en ese régimen.

El dictamen recoge propuestas contenidas en el plan de gobierno de Juntos por el Perú, que postula a la presidencia a Roberto Sánchez, quien ha defendido públicamente a los mineros informales.

En ese documento se plantea establecer la propiedad social de los medios de producción en la pequeña minería y la minería artesanal, mediante la organización de los trabajadores en cooperativas. En esa línea, se propone que las concesiones extinguidas pasen al control del Estado y sean entregadas a pequeños mineros asociados bajo ese modelo organizativo.

Sánchez plantea también reducir el plazo de caducidad de las concesiones, que actualmente puede extenderse hasta 30 años, a periodos de cuatro o cinco años. Sostiene que no deberían existir concesiones ociosas: aquellas que permanezcan sin actividad serían reasignadas a pequeños mineros y mineros artesanales organizados en cooperativas.

Pero el dictamen consolida iniciativas presentadas por Alejandro Muñante (Renovación Popular), Pasión Dávila (Bancada Socialista), Edwin Martínez (no agrupado), Paúl Gutiérrez (Bloque Magisterial), Roberto Sánchez y Wilson Quispe (Juntos por el Perú), Guido Bellido (Podemos Perú) y Flavio Cruz (Perú Libre).

Renovación, Perú Libre y Podemos también tienen propuestas favorables la minería ilegal e informal o no proponen ninguna medida para enfrentarlas.

Los cambios
El texto sustitutorio busca obligar a las empresas mineras a suscribir acuerdos de participación en beneficios con comunidades del área de influencia directa. Estos acuerdos podrían incluir aportes a fondos comunales, programas de empleo o incluso participación en instrumentos financieros.

El cambio abre un debate jurídico. Diversos especialistas advierten que, en la práctica, obligaría a transferir parte del patrimonio empresarial sin indemnización, lo que podría configurar una expropiación indirecta.

Otro cambio elimina el carácter irrevocable de las concesiones mineras. Hasta ahora, una concesión solo podía revertirse si el titular incumplía obligaciones específicas. Según el dictamen, la medida abre la puerta a que la autoridad administrativa pueda revocarla de forma discrecional.

También eleva hasta en 300 % el derecho de vigencia de las concesiones y aumenta en 400 % las penalidades por no acreditar producción o inversión mínima. Al mismo tiempo, reduce de 30 a 15 años el plazo para iniciar producción.

Ese plazo, según especialistas del sector, desconoce la complejidad de desarrollar un proyecto minero, proceso que suele tomar, en el mejor de los casos, entre 25 y 45 años. Solo la etapa exploratoria puede superar los 18 años.

La norma también obliga a presentar un plan quinquenal de trabajo e inversión desde las primeras etapas de exploración, cuando todavía no existen certezas geológicas suficientes para proyectar inversiones con precisión.

Durante el debate, la vicepresidenta de la comisión, Diana Gonzales, cuestionó un presunto direccionamiento en la agenda por parte de la bancada de Juntos por el Perú, lo que generó un debate tenso durante la sesión.

“Actuar al margen de la ley no es emprender. Los mineros ilegales contaminan, evaden impuestos, precarizan el trabajo y amparan la trata de personas. Este absurdo dictamen busca satisfacer caprichos ideológicos”, afirmó.

El Congreso también pretende aplicar retroactivamente nuevos costos a concesiones ya otorgadas, lo que podría entrar en conflicto con el principio constitucional de irretroactividad de la ley.

Un Congreso a favor de la minería informal
Mientras el Congreso de la coalición discute medidas que endurecen las condiciones para la minería formal, la minería ilegal continúa expandiéndose. Diversos estudios muestran que esta economía ilegal mueve miles de millones de dólares al año y ya supera a otras actividades ilícitas como el narcotráfico o la trata de personas.

Además, el Registro Integral de Formalización Minera (Reinfo) ha sido ampliado en varias ocasiones y aún no se tramita una nueva Ley MAPE. Creado en 2016, el Reinfo acumula miles de inscritos, de los cuales apenas unos 2.000 mineros lograron formalizarse, lo que representa alrededor del 2,6 % del total.

El dictamen aprobado por la comisión deberá pasar ahora al Pleno del Congreso, donde será debatido y sometido a votación.', resumen_corto = 'La Comisión de Energía y Minas aprobó un dictamen que modifica el régimen de concesiones mineras. Recoge propuestas promovidas por congresistas y partidos vinculados a la defensa de la minería informal. Especialistas advierten que esos cambios podrán afectar la estabilidad jurídica del sector.'
WHERE titulo = 'Congreso acelera paquetazo a favor de mineros informales en plena campaña' AND fecha_publicacion = '2026-03-24';

UPDATE reportajes SET desarrollo = 'El Congreso busca cambiar el régimen de concesiones mineras, lo que golpearía el financiamiento de obras en regiones con la reducción de transferencias por canon y regalías. Reducir plazos, endurecer sanciones y encarecer las concesiones afectaría a las empresas y comprometería los recursos que llegan a gobiernos regionales y municipales.

Estos gobiernos reciben miles de millones de soles cada año. Según el Ministerio de Energía y Minas (Minem), solo en 2025, las transferencias por canon, regalías y otros conceptos superaron los 10,045 millones de soles. De ese total, el canon aportó más de 6,992 millones y las regalías sumaron 2,687 millones.

Con ese dinero se financian carreteras, colegios, hospitales y sistemas de agua potable. Para muchas regiones, estos recursos representan hasta tres cuartas partes de su presupuesto. Áncash recibió cerca de 1,790 millones de soles en 2025. Le siguen Arequipa con 1,285 millones, Moquegua con 1,025 millones y Tacna con 978 millones.

El canon equivale al 50 % del impuesto a la renta que pagan las empresas mineras. La mitad se queda en el gobierno nacional y la otra se distribuye entre las regiones productoras. “Su adecuada orientación permite fortalecer la legitimidad del sector minero, consolidar una relación virtuosa entre actividad extractiva y desarrollo local, y sentar las bases para un crecimiento económico inclusivo”, señala el Minem.

Para que estos recursos lleguen, los proyectos deben desarrollarse y entrar en producción. Sin producción no hay impuesto a la renta; sin impuesto, no hay canon; sin canon, no hay obras.

Plazos reales y demoras
Según el Instituto Peruano de Economía (IPE), sacar adelante un proyecto puede tomar hasta 45 años desde el descubrimiento hasta la producción. Mientras que entre 1970 y 1990 tomaba en promedio 19.8 años, entre 2015 y 2025 ese tiempo se elevó a 39.2 años.

Estas demoras responden, principalmente, a retrasos en permisos y altos costos para mantener concesiones. Los plazos reales suelen superar los tiempos legales. Por eso, los cambios que impulsa la Comisión de Energía y Minas agravan esta situación al acortar plazos de concesión, elevar penalidades y encarecer proyectos.

Con dinero del canon y regalías se han financiado carreteras, hospitales, colegios y sistemas de agua y riego en la última década. El Minem reconoce que estas transferencias fortalecen la autonomía financiera de los gobiernos subnacionales y sostienen inversiones públicas.

Un régimen con más restricciones frenaría esas inversiones, paralizaría proyectos en exploración y desalentaría nuevas operaciones. El impacto se sentirá en pocos años cuando haya menos canon y, en consecuencia, menos dinero para hospitales, colegios y carreteras.', resumen_corto = 'Acortar plazos y elevar costos a las concesiones mineras desincentivaría inversiones y reduciría el pago de impuestos que sostiene gran parte del gasto público en las regiones.'
WHERE titulo = 'Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales' AND fecha_publicacion = '2026-04-08';

UPDATE reportajes SET desarrollo = 'Quizás después de las elecciones generales y regionales y municipales de 2026 muchos alcaldes y gobernadores, congresistas o el presidente ya no representarán al Estado, sino a los intereses de economías ilegales.

Según el estudio Tendencias y alertas 4 – Estimaciones de economías ilegales en el Perú, hay un alto riesgo de que esas mafias financien 2,368 campañas presidenciales, 57,728 campañas congresales y más de 51,000 campañas regionales, según cálculos del estudio.

Y los mineros ilegales serían los más interesados en hacerlo. Tienen dinero de sobra para hacerlo. Ganan más de 4,600 millones de dólares al año, lo que los ha convertido en la economía ilícita más lucrativa que el narcotráfico y el contrabando.

De acuerdo con el estudio, en 2026, los mineros podrían fortalecer la elección de congresistas que defiendan sus intereses, así como contar con personas funcionales a ellos en los gobiernos regionales y los municipios con representantes.

En la actualidad hay autoridades que defienden sus intereses. Según César Ipenza, abogado especialista en derecho ambiental, los mineros ilegales cuentan con una bancada multipartidaria ene l Congreso. En efecto, así parece ser. Las bancadas que impulsaron o apoyaron leyes a favor de estos mineros fueron Fuerza Popular, Avanza País, Perú Libre, Acción Popular, Alianza Para el Progreso, Somos Perú, Renovación Popular y Podemos Perú.

Estrategia de infiltración
Los especialistas refieren que el riesgo en la próxima campaña es que se infiltren en todo el proceso electoral: desde la afiliación a los partidos, selección de candidatos, influencia en las agendas locales y el debate público, hasta la llegada al poder. Moverán el dinero sucio en las campañas, posiblemente, usando fundaciones y donaciones, empresas fantasma y testaferros, pago a consultoras y asesores, manipular encuestas y pagar publicidad política en medios.

Lo que pasó con el Registro Integral de Formalización Minera (Reinfo) es un pequeño ejemplo de lo que podrían hacen los mineros con una bancada en el Congreso y presencia en los gobiernos subnacionales.

Es un patrón, según el informe, en el que las economías ilegales han aprendido a “producir” candidatos afines, infiltrar partidos o financiar líderes locales que pueden ser elegidas. Teniendo operadores dentro del sistema, se aseguren protección e impunidad.

Desde el Estado no se hace mucho para controlar la infiltración del dinero sucio en la campaña. No se fortalece la inteligencia financiera, ni se audita el origen de los aportes de campaña, tampoco se exige estándares éticos públicos y verificables a partidos y candidatos.', resumen_corto = 'Con más de 4,600 millones de dólares anuales en movimiento, el dinero de la minería ilegal tiene capacidad para financiar miles de campañas electorales en el país. El riesgo no es solo de corrupción, sino la captura del poder.'
WHERE titulo = 'Crece riesgo de que mineros ilegales financien campañas en 2026' AND fecha_publicacion = '2025-07-04';

UPDATE reportajes SET desarrollo = 'Dos autos taxi incendiados en Lima por usar gas licuado de petróleo (GLP) en vez de gas natural vehicular (GNV); empresas sin suministro o con restricciones en el suministro de gas; millones de familias en todo el país haciendo colas por un balón de GLP que subió de precio; y pérdidas por 2.800 millones de dólares. Este, en un resumen apretado, ha sido el resultado de la deflagración registrada en la estación de válvulas y en la tubería principal del sistema de transporte de gas operado por Transportadora de Gas del Perú (TGP) en el distrito de Megantoni, provincia de La Convención (Cusco).
 El accidente dañó entre 20 y 30 metros de los tubos de gas y líquidos y provocó la paralización temporal de la producción de gas natural y GLP. Al mismo tiempo, puso en debate la necesidad de reevaluar las políticas estatales para garantizar la seguridad energética del país.
 Del gas de Camisea, que se extrae de la selva del Cusco desde 2004, depende más del 40 % de la energía eléctrica y gran parte del abastecimiento nacional de este combustible, más barato y menos contaminante.
 Hasta el cierre de esta nota, la reparación de la tubería alcanzaba el 48 %. Para la quincena, el sistema debería estar operativo nuevamente. El presidente José María Balcázar dijo que desde este fin de semana empezarían a normalizarse el suministro de gas.
 El problema de fondo
Pedro Gamio, exviceministro de Energía y Minas, dijo en el pódcast de César Hildebrandt que el problema empieza porque no se construyó el proyecto de redundancia del gasoducto de TGP. En 2011, recordó Gamio, sumaron ese componente al proyecto del Gasoducto Sur Peruano, concesionado a Odebrecht, que posteriormente quedó paralizado.
 A estas alturas, según Gamio, el proyecto del ducto al sur parece ya inviable. En su concepción se basaba en dos principales demandas: la petroquímica del etano, para la que no quedan moléculas necesarias, y dos centrales térmicas que todavía son viables. “Eso lleva a hacer un ducto de menor dimensión y a menor costo”, dijo.
 Sin embargo, desde el gobierno solo anunciaron medidas de corto plazo. Nada sobre reactivar el proyecto de redundancia ni el gasoducto al sur.
 Cuando la presidenta del Consejo de Ministros, Denisse Miralles, habló del tema, solo mencionó algunas medidas para enfrentar la escasez de energía y garantizar el abastecimiento. El gobierno autorizaba la liberación y flexibilización de las mezclas de combustibles con biocombustibles y otras exigencias en la producción de hidrocarburos para ampliar la disponibilidad en el mercado.
 Asimismo, se aplicaba la racionalización del gas natural, priorizando el suministro a más de dos millones de hogares y a sectores esenciales como salud, industria alimentaria, servicios básicos, telecomunicaciones, transporte y logística, sistema financiero, entre otros. El gobierno también incrementará el vale del Fondo de Inclusión Social Energético (FISE) para la compra del balón de gas de 10 kilos y aplicará una medida de compensación para taxistas cuyos vehículos funcionan con gas natural.
 Propuestas de candidatos
El accidente ocurre en periodo electoral. Pese a ese contexto, pocos candidatos han propuesto medidas concretas en materia energética. Desde el Cusco, Alfonso López Chau, candidato de Ahora Nación, solo se animó a exigir al gobierno hacerse presente en la zona del accidente.
 En los planes de gobierno de la mayoría de los candidatos se coincide en que el país necesita fortalecer su seguridad energética y aprovechar mejor el gas natural. Las propuestas repiten una misma idea con distintos matices: masificar el acceso al gas, ampliar las redes de distribución y reducir la dependencia de combustibles más caros.
 Varios postulantes plantean llevar el gas a más ciudades, abaratar su costo para hogares e industrias y convertirlo en el eje de una política energética que garantice abastecimiento estable y precios competitivos.
 Otra coincidencia atraviesa casi todos los programas: destrabar o reactivar el gasoducto del sur. Algunos candidatos lo presentan como la obra clave para cerrar la brecha energética entre Lima y el sur andino. Con ese proyecto buscan llevar el gas de Camisea a regiones como Cusco, Arequipa, Puno, Moquegua y Tacna, impulsar la industria, ampliar el consumo doméstico y abrir la puerta a un polo petroquímico en el sur.
 En la mayoría de las propuestas, el gasoducto no aparece solo como infraestructura energética, sino como una apuesta para dinamizar la economía regional y equilibrar el desarrollo del país.
 Una salida inmediata
En esta situación, la alternativa más inmediata para llevar gas a más hogares del país consiste en construir pequeños ductos o transportar el combustible en camiones, lo que se conoce como gas virtual.
 La empresa Cálidda, que actualmente distribuye gas natural en Lima y Callao, desarrolla una propuesta para expandir el suministro de gas natural a siete regiones: Junín, Apurímac, Ayacucho, Ucayali, Cusco, Puno y Huancavelica.
 La estrategia incluye el uso de camiones cisterna y la instalación de una Planta Satélite de Regasificación. Según el proyecto, a Ucayali y Ayacucho llevarán el gas por medio de ductos; en Ayacucho se conectarán a un ramal de TGP; en Ucayali lo harán vía Aguaytía; y al resto de las regiones mediante camiones cisterna.
 El gas natural, a diferencia del GLP, es una alternativa económica para hogares y negocios. Un hogar en Lima paga aproximadamente 20 soles por gas natural, en contraste con los 50 soles de un balón en ciudades de regiones y hasta 150 soles en localidades alejadas de los centros urbanos. Esta diferencia representa un ahorro significativo para las familias.
 Cálidda ha permitido el acceso al gas a ocho millones de peruanos, 36.000 comercios y 120.000 vehículos, además de conectar gratuitamente a más de 2.000 comedores populares. La compañía cuenta con cerca de 19.000 kilómetros de redes entre polietileno y acero.
 El gasoducto del sur postergado
En esta campaña, el tema del gas está menos presente que en las últimas cuatro elecciones. Desde 2011, el gas siempre estuvo en el centro del debate. Desde Ollanta Humala, pasando por Pedro Pablo Kuczynski, hasta Pedro Castillo prometieron llevar gas al sur mediante un gasoducto. Ninguno, sin embargo, lo consiguió.
 La historia de las promesas sin cumplir comenzó en marzo de 2008. Kuntur Transportadora de Gas presentó su propuesta para construir el Gasoducto Andino del Sur. Seis meses después, el gobierno de Alan García aprobó el proyecto y, un mes más tarde, lo concesionó por un plazo de 30 años.
 El ducto de 33 pulgadas tendría 743 kilómetros. Kuntur iba a invertir 1.334 millones de dólares y entregó una carta fianza de 64 millones. La red principal recorrería desde Malvinas, en La Convención, hasta Puno, Arequipa y Moquegua. En el trayecto dejaría válvulas para los ramales a Cusco, Juliaca, Matarani e Ilo.
 Hasta ese momento parecía que el viento soplaba a favor. Tal vez los problemas empezaron con la compra del 51 % de las acciones de Kuntur por parte de Odebrecht, en abril de 2011.
 Al poco tiempo, Kuntur quiso modificar el contrato. Le pidió al gobierno que garantizara reservas de gas para disminuir el riesgo de su inversión. Una comisión del gobierno respondió que el pedido no era legal. Las negociaciones se estancaron.
 Kuntur insistió y el gobierno conformó una segunda comisión. Mientras tanto, Odebrecht absorbió todas las acciones de Kuntur. Para entonces, las negociaciones se habían congelado por completo.
 El tiempo pasó y el segundo gobierno del APRA terminó sin que comenzara la construcción del gasoducto.
 En los meses anteriores, durante la campaña, el nacionalista Ollanta Humala prometió en plazas y mítines que él sí construiría el gasoducto al sur. Seis de cada diez cusqueños votaron por Humala en primera vuelta; en el ballotage fueron casi ocho de cada diez. En el sur, fueron cinco de cada diez en primera vuelta y siete de cada diez en la segunda.
 Poco después, su ministro de Energía y Minas, Jorge Merino, solicitó a Proinversión incorporar en su cartera el proyecto “Mejoras a la seguridad energética del país y desarrollo del Gasoducto Sur Peruano (GSP)”. Proinversión obedeció, a pesar de la vigencia de la concesión de Kuntur, y esta empresa renunció al proyecto a los pocos meses. Solicitó la terminación de la concesión, pidió transferir sus bienes y estudios y la devolución de la garantía de 64 millones de dólares. El gobierno aceptó.
 Así desapareció el Gasoducto Andino del Sur y empezó el GSP. El consorcio Gasoducto Sur Peruano (Odebrecht y Enagás) ganó la concesión en julio de 2014. Graña y Montero se uniría después al consorcio con el 20 % de las acciones. Odebrecht tenía el 55 % y Enagás, el 25 %.
 La foto del presidente Ollanta Humala en Quillabamba, descubriendo una tela roja para mostrar un tubo que simbolizaba que el gas, por fin, llegaría a las casas, negocios y empresas del sur, se convirtió en un símbolo de engaño.
 La empresa obtuvo los permisos, trasladó los tubos y removió el suelo húmedo en los valles amazónicos de La Convención, así como en las montañas rocosas de los Andes en Calca. Inició el tendido y la soldadura de la tubería principal. Pero la obra quedó en la nebulosa con el escándalo del caso Lava Jato en Brasil. Odebrecht, accionista mayoritario del consorcio, enfrentaba problemas económicos. No podía acreditar el cierre financiero dentro de los plazos. No tenía dinero ni acceso a préstamos. Dejó de ser una empresa confiable para los bancos y para el gobierno peruano, que decidió terminar la concesión.
 En enero de 2017, la empresa cesó a sus trabajadores y retiró la maquinaria de las zonas de trabajo. Los campamentos fueron desarmados y, en algunos almacenes al aire libre, quedaron tubos apilados. La obra tenía 37 % de avance.
 Nada cambió, o no mucho, en el gobierno de Pedro Pablo Kuczynski. Él también ganó las elecciones prometiendo el gasoducto. Su ministro de Energía y Minas, Francisco Ísmodes, anunció el Sistema Integrado de Transporte de Gas (SIT Gas), un nombre nuevo para el antiguo GSP. Proinversión contrató a la consultora Mott MacDonald para el estudio del trazo y las mejores condiciones. Tenía un año para hacerlo, pero no cumplió. Después, poco se hizo para reactivar el proyecto gasífero.
 ¿Se agotan las reservas?
Otra preocupación es que el país, en el corto plazo, podría enfrentar una escasez de reservas de gas. Pedro Gamio dijo a Hildebrandt que quedan reservas solamente para los próximos quince años y que, si se instalara una nueva central térmica a gas, este periodo podría reducirse a siete u ocho años, porque el sector eléctrico “devora el gas”.
 Eso se debe a que el gobierno paralizó la exploración de reservas de gas en el yacimiento Candamo, ubicado en Madre de Dios, donde se estiman reservas certificadas de entre 3 y 3.5 TCF (trillones de pies cúbicos) de gas natural y condensados.
 Ya en agosto de 2025, el presidente del directorio de Perupetro, Pedro Chira, dijo que la producción nacional de gas natural era de 1.300 millones de pies cúbicos diarios y que las reservas no se estaban reponiendo, porque no existían contratos activos de exploración.
 “Si no incorporamos nuevas reservas en el corto plazo, enfrentaremos una producción declinante que nos colocará en una situación crítica de dependencia energética hacia el 2037”, señaló entonces Chira. Eso quiere decir que, a partir de 2037, el Perú debería comenzar a importar gas natural, lo que impactaría significativamente en los costos de generación eléctrica.
 Para que eso no suceda, según Gamio, “se debe promover la exploración para completar y con eso tener 4 TCF o, en un escenario optimista, duplicar las reservas de Camisea con Candamo”.
 Ahora bien, según el optimista Ministerio de Energía Minas, el Perú dispone de recursos prospectivos de gas natural que superan los 43 trillones de pies cúbicos (TCF), de los cuales casi la mitad se concentran en Madre de Dios, con 20.4 TCF.
 También se menciona un potencial aún no explorado en Camisea, donde Perupetro estima hasta 5 TCF adicionales en zonas cercanas a los lotes 57 y 88, además de la puesta en valor comercial de 3.5 TCF en el Lote 58.
 Todo, sin embargo, son cifras que no se traducen en actividades de exploración para confirmar la existencia de esas reservas ni la viabilidad técnica, ambiental y económica para su explotación antes de 2037.
 Tampoco debemos olvidar, de acuerdo con Gamio, que el Perú necesita más de 260 mil barriles diarios de combustible, de los cuales solo produce poco más de 40 mil. “Somos importadores netos”.', resumen_corto = 'La explosión en el sistema de transporte de gas de Camisea dejó taxis incendiados, empresas sin suministro, largas colas por balones de GLP y pérdidas por US$2.800 millones. El accidente evidenció la fragilidad de la seguridad energética del país. Se volvió a hablar de la urgencia de construir el gasoducto al sur, mientras expertos advierten que las reservas de gas podrían agotarse en quince años.'
WHERE titulo = 'Crisis del gas: vuelve el debate sobre la seguridad energética del país' AND fecha_publicacion = '2026-03-11';

UPDATE reportajes SET desarrollo = 'La presidenta Dina Boluarte, en su último mensaje a la nación, solo nombró seis veces a la minería ilegal, la misma cantidad que usó para llamarlos “pequeños mineros artesanales”. No mencionó ni anunció medidas concretas para enfrentar el crimen organizado y la minería ilegal e informal en el país.

Dijo que se aprobó una estrategia nacional para la reducción e interdicción de esta actividad al 2030 y que se hicieron operativos en Pataz, La Libertad, y Madre de Dios, afectando a las organizaciones criminales con más de 181 millones de soles.

El discurso de Boluarte se puede explicar porque la presidenta no quiere poner en riesgo el apoyo que tiene en el Congreso, de congresistas que tienen vínculos con los mineros, quienes impulsaron y aprobaron, por ejemplo, el Registro Integral de Formalización Minera (Reinfo).

Dice mucho de las prioridades de este gobierno que haya dedicado pocas líneas a esta actividad cuando, según Ipsos, el 81 % de peruanos considera a la minería ilegal una amenaza para la seguridad nacional y la relaciona con el lavado de activos, la trata de personas, la extorsión y la deforestación.

Así, Boluarte y sus aliados en el Congreso inician su último año sin mencionar el avance de las economías ilegales. Tal vez por eso, en la calle los ven, según las encuestas, como socios de un poder que legisla de espaldas al país y facilita el avance de la minería informal e ilegal, así como del crimen organizado.

Un sector de la población asocia cada norma que amplía la formalización minera, debilita la fiscalización ambiental o reduce sanciones al transporte de insumos con un pacto entre gobierno y estas organizaciones, que en los hechos no quieren formalizarse.

Lo que pasa es que este Congreso aprobó, en el último año, un paquete de normas que, según especialistas, representan “un retroceso de más de diez años” en la lucha contra la minería ilegal, y la presidenta Boluarte las publicó con premura. Entre ellas: la Ley 31973, que amplió plazos de formalización; la modificación de la Ley Forestal, que permite el uso de tierras en zonas de alto valor ecológico; la eliminación de sanciones penales para el transporte de insumos químicos; la reducción del presupuesto de interdicción; y la ley que debilita la Unidad de Inteligencia Financiera, dificultando el rastreo de capitales del oro ilegal.

Y, en las siguientes semanas, tratará de aprobar la nueva Ley de la Pequeña Minería y Minería Artesanal (Ley MAPE), que, tal como está redactada, según varios especialistas, abrirá la puerta a que las mafias del oro ilegal sigan operando sin control. Al reducir exigencias ambientales, esta norma permitiría que se camuflen bajo la etiqueta de “formalizables”.', resumen_corto = 'En su último mensaje a la nación, la presidenta obvió ese problema pese a que la minería ilegal y el crimen organizado asociado a ella ya controla el negocio del oro. Ese silencio podría deberse a que la presidenta se cuida de chocar con sus aliados en el Congreso que tienen intereses mineros.'
WHERE titulo = 'Dina Boluarte calló sobre la minería informal e ilegal' AND fecha_publicacion = '2025-07-29';

UPDATE reportajes SET desarrollo = 'Por: José Luis Gonzales

El uso del canon minero por parte de los gobiernos locales y los gobiernos regionales es un tema de interés en la colectividad. En el caso de Cajamarca, durante el 2025, los gobiernos locales, recibieron un presupuesto de S/492.39 millones y ejecutaron S/321.38 millones. Quedó un saldo sin ejecutar de S/171.01 millones.

Por su parte, al cierre del ejercicio fiscal 2025, el Gobierno Regional de Cajamarca consolidó una gestión presupuestaria eficiente. Alcanzó una ejecución del 91.3% de su Presupuesto Institucional Modificado (PIM). Con una inversión total de 977 millones de soles, la región no solo demuestra capacidad de gasto, sino una clara hoja de ruta en la asignación de sus recursos, donde el canon minero juega un rol estratégico.

Si bien el grueso de la inversión proviene del Fondo de Compensación Regional (FONCOR), la administración de los 75 millones de soles derivados del canon, sobrecanon y regalías revela las prioridades políticas y sociales de la actual gestión. La distribución sectorial de estos fondos se concentró en tres pilares.

En educación se usó el 41.3%: Con 31 millones de soles, este sector fue el principal receptor. La apuesta es transformar la renta finita de la minería en capital humano sostenible.

En transporte usó el 33.3%, que equivale a 25 millones de soles para reducir brechas de conectividad, un factor crítico para la competitividad regional.

Para el sector agropecuaria destinó el 9.3%: 7 millones para atender la base productiva de la región, enfocándose en la infraestructura hídrica para la agricultura familiar.

por otro lado, la eficacia de esta inversión se puede medir en la culminación de proyectos emblemáticos que impactan directamente en la calidad de vida.

La ejecución al 100 % de instituciones educativas en Jaén (Alfonso Villanueva Pinillos) y San Ignacio (IE 16470) aporta a la descentralización de la inversión. Estas obras son vitales en zonas donde el acceso a servicios básicos históricamente ha sido deficiente.

En cuanto a corredores económicos, se trabaja en el tramo Namora – Laguna San Nicolás (93.7% de avance, una obra que une el turismo con el comercio agrícola.

En salud pública se puede mencionar la culminación de proyectos de saneamiento en seis localidades con una inversión de 2 millones de soles, que busca un impacto directo contra la anemia y enfermedades infecciosas.

Desafíos
A pesar del balance positivo, el análisis económico identifica puntos críticos que requieren atención inmediata para el periodo 2026.

El reporte de 0 % de ejecución en el centro de educación básica especial en Baños del Inca evidencia una desconexión en la atención a poblaciones vulnerables, un contraste severo frente a los éxitos en educación regular.

Asimismo, la baja ejecución en Chugur (37.7 %) advierte sobre posibles problemas técnicos o de gestión en proyectos específicos de transporte que limitan el impacto del canon en el distrito.

Un reto latente es la "atomización de proyectos". La proliferación de obras menores a un millón de soles corre el riesgo de diluir el impacto económico. El desafío para el Gobierno Regional de Cajamarca es transitar hacia proyectos de mayor escala y de impacto macro-regional.

Así, Cajamarca cerró el 2025 con una salud fiscal mejor a la de años anteriores. Sin embargo, la sostenibilidad de este crecimiento dependerá de su capacidad para integrar la inversión del canon en una planificación territorial que priorice la calidad del gasto sobre la velocidad de ejecución.', resumen_corto = 'El Gobierno Regional de Cajamarca priorizó la inversión de los fondos provenientes de la minería en educación y vías de comunicación. No obstante, el uso de este recurso todavía no es del todo eficiente por la dispersión en obras pequeñas que no ayudan a cerrar brechas sociales.'
WHERE titulo = 'El canon minero como motor de desarrollo social en 2025' AND fecha_publicacion = '2026-02-16';

UPDATE reportajes SET desarrollo = 'Ica es una de las pocas regiones del país donde la minería es una realidad consolidada. Desde Marcona sale el 100 % del hierro que produce el Perú, una actividad que durante años ha sostenido exportaciones millonarias, empleo formal y más del 21 % del PBI regional. Sin embargo, fuera de los balances macroeconómicos, la vida cotidiana en la región sigue marcada por carencias estructurales que las autoridades, pese a contar con montos millonarios del canon minero, no han logrado resolver.

La paradoja es que, a mayor producción minera, mayor flujo de recursos públicos; a mayor flujo de recursos, menores resultados visibles. En el primer trimestre de 2025, Ica recibió alrededor de S/250 millones por canon, regalías y derechos mineros, ubicándose entre las regiones que más dinero captan por esta vía. En todo el año, el presupuesto por canon bordea los S/769 millones, una cifra que la coloca en el podio nacional, solo por debajo de Áncash y Arequipa.

Pese a ello, el territorio no muestra una transformación proporcional. Persisten brechas en agua potable, saneamiento, salud e infraestructura vial, incluso en zonas directamente impactadas por la actividad minera. La riqueza fluye, pero no logra anclarse en el territorio en forma de servicios básicos ni proyectos de largo plazo.

El problema no es nuevo ni exclusivo de Ica, pero en esta región adquiere mayor peso por la magnitud de los recursos involucrados. En la última década, la ejecución promedio del canon minero apenas alcanzó el 55 %, lo que significa que casi la mitad del dinero disponible no se convirtió en obras concluidas. Expedientes técnicos deficientes, obras paralizadas, cambios constantes de autoridades y una débil capacidad de planificación explican buena parte de este cuello de botella.

Las cifras del Ministerio de Economía y Finanzas muestran un contraste interno. En 2025, el Gobierno Regional de Ica administró S/174 millones por canon, sobrecanon y regalías, y logró invertir el 94,4 %. Para 2026, el monto asignado supera los S/175 millones.

Por ley, el canon minero solo puede destinarse a proyectos de inversión: colegios, hospitales, carreteras o infraestructura social. En teoría, se trata de una herramienta potente para cerrar brechas. En la práctica, su impacto se diluye en proyectos mal priorizados, diseños incompletos o gestiones que no logran sostener los procesos de inversión en el tiempo. A ello se suma una permanente sospecha de corrupción que erosiona la confianza ciudadana.

El debate, entonces, ya no gira en torno a si Ica recibe o no recursos suficientes por minería. Los recibe, y en grandes cantidades. La discusión de fondo apunta a la capacidad de las autoridades regionales y locales para administrarlos y convertirlos en desarrollo tangible.', resumen_corto = 'Pese a recibir cientos de millones por canon minero, Ica arrastra brechas en servicios básicos y baja ejecución histórica, lo que pone en cuestión la capacidad de sus autoridades para transformar recursos mineros en desarrollo real.'
WHERE titulo = 'El canon que Ica no logra convertir en obras' AND fecha_publicacion = '2026-02-19';

UPDATE reportajes SET desarrollo = 'Desde 2011, solo en La Pampa, Madre de Dios, se han liberado más de 600 toneladas de mercurio, envenenando bosques, ríos y personas. En esta región se ha deforestado más de 20 000 hectáreas de Amazonía.

Al liberarse en la naturaleza, el mercurio se convierte en metilmercurio, un veneno que sube por la cadena alimenticia: contamina peces, envenena animales y termina en los cuerpos humanos. Ataca el sistema nervioso, daña riñones y afecta a bebés en gestación, dejando secuelas irreversibles. En plantas, se acumula en suelos y debilita bosques enteros. No desaparece: viaja por aire, agua y tierra, contaminando a generaciones.

Hoy los mineros ilegales lo usan para amalgamar oro mientras se filtra en riachuelos y grandes ríos. En decenas de comunidades indígenas ya se sienten los efectos. El mercurio se acumula en órganos humanos, daña riñones, hígado y sistema nervioso. Madres gestantes y recién nacidos consumen peces contaminados. En los niños provoca déficit cognitivo y problemas motores. Los índices de contaminación en sangre y cabello superan los límites considerados seguros por la Organización Mundial de la Salud (OMS).

Daños ecológicos
Los daños ecológicos también son irreversibles en las cuencas del Marañón y el Cenepa. Más de 200 dragas operan sin descanso, removiendo sedimentos y liberando más mercurio al agua. Las balsas oxidadas drenan el lecho fluvial mientras grupos armados vigilan la actividad ilegal.

“El río Cenepa está muriendo, porque todos tienen problemas por el mercurio que usan. Obviamente ellos dicen que también están preocupados, pero morir de hambre o morir mañana, mejor yo quiero comer, dicen”, afirmó Agustina Mayanna Apikey.

La expansión minera se extiende ya a 21 de las 25 regiones del país y amenaza 15 áreas naturales protegidas, así como comunidades nativas defensoras de los bosques. Rubén Guinaguanca, abogado de la asociación Paya Esperanza, que lleva cinco años protegiendo a defensores de la cuenca del Cenepa, explica: “Estamos aquí acompañando a líderes que vienen siendo amenazados de muerte por la actividad ilegal, específicamente por el oro. En 2022 encontramos alrededor de 25 puntos de extracción. En 2023, 70 puntos”.
 Los hallazgos presentados en esta nota fueron obtenidos del documental “Nuestro Oro: sombras y brillo”, realizado por Latina, una obra que arroja luz sobre las consecuencias de la minería ilegal en el país.', resumen_corto = 'El mercurio no huele, no tiene sabor, es plateado y líquido, y fluye como si fuera agua pesada. Es mortal: uno de los venenos más persistentes y peligrosos. Los mineros ilegales usan esta sustancia para procesar el oro en la Amazonía peruana.'
WHERE titulo = 'El mercurio envenena bosques, ríos y personas' AND fecha_publicacion = '2025-08-11';

UPDATE reportajes SET desarrollo = 'Un informe de Bank of America (BofA), basado en cálculos del Instituto Peruano de Economía (IPE), encontró que las exportaciones de oro ilegal alcanzarían este año los 12 000 millones de dólares, equivalentes al 4 % del producto bruto interno (PBI) del país. Esa cifra es cuatro veces mayor de lo registrado hace seis años, en 2019, y casi el mismo volumen de las actuales exportaciones legales.

Según Víctor Fuentes, gerente de políticas públicas del IPE, las estimaciones incluso estarían por debajo de lo que realmente representa esta economía. Es decir, en el peor de los escenarios para los mineros ilegales, la exportación ilegal de oro igualará a la producción legal; en el mejor, logrará superarla.

Como había advertido el Observatorio de Minería Ilegal (OMI), el blanqueo ocurre en las plantas procesadoras que han aumentado en número y que facilitan que el oro ilegal ingrese al circuito formal. No es extraño que algunas de esas plantas aparezcan hoy entre las diez empresas que más oro producen, pese a no tener minas propias.

José de Echave, economista y exviceministro de Gestión Ambiental, recordó que el año pasado se produjeron unas 90 toneladas de oro, pero se exportaron 170. Asegura que el país vive el momento de mayor diferencia entre exportaciones y producción: “Se está exportando de lejos mucho más oro del que se produce”.

De acuerdo con el exviceministro, la minería ilegal se expande en regiones como Cusco, Apurímac, Piura, Ica o Arequipa. No sorprende —añade— que la actividad se haya multiplicado por cuatro entre 2019 y 2025, periodo en el que el precio del oro y también del cobre se dispararon.

Esto podría ser resultado de varios factores, entre ellos el fracaso del Registro Integral de Formalización Minera (Reinfo), que en más de una década solo logró formalizar al 2 % de inscritos. De Echave lo atribuye también a la falta de voluntad política del actual gobierno, que redujo en unos 20 millones de soles el presupuesto para combatir la minería ilegal. La partida 0-128, destinada a la reducción de esta actividad, pasó de 90,8 millones en 2024 a 70,6 millones en 2025.

Con exportaciones de oro ilegal que ya se comparan con las legales, plantas procesadoras que blanquean el oro sin minas propias y un Estado que reduce recursos para combatirla, la minería ilegal seguirá creciendo sin reparos.', resumen_corto = 'Este negocio ilícito podría mover hasta 12 000 millones de dólares en este año, lo que representa el 4% del PBI nacional. Las exportaciones de oro ilegal se han cuadruplicado desde 2019, evidenciando su acelerado crecimiento.'
WHERE titulo = 'El oro ilegal iguala a la minería formal en exportaciones' AND fecha_publicacion = '2025-09-24';

UPDATE reportajes SET desarrollo = 'En el Perú no pasa un mes sin denuncias por contaminación o episodios de violencia asociados a la minería ilegal (y a veces informal). Diversos estudios advierten que esta actividad alimenta redes de crimen organizado, lavado de activos y trata de personas. En regiones como Madre de Dios, Puno y La Libertad, su expansión ha provocado disputas armadas por el control de socavones, extorsiones y asesinatos, mientras contamina ríos con mercurio, arrasa bosques y destruye territorios indígenas.
 A pesar de este escenario, el tema apenas aparece en la campaña electoral. Según un informe del Observatorio de Minería Ilegal (OMI), solo la tercera parte de los 36 partidos que compiten por en las elecciones 2026 presenta propuestas concretas para enfrentar esta actividad.
 El OMI revisó los planes de gobierno e identificó tres grupos: Unos plantean medidas de control más estrictas; otros proponen políticas más favorables para los mineros informales; y algunos apenas mencionan el problema o lo omiten.
 De acuerdo con el abogado César Ipenza, miembro del OMI, la revisión mostró qué organizaciones políticas hacen un esfuerzo por comprender la dimensión del fenómeno. “Hay quienes sí separan lo informal de lo ilegal, pero la mayoría no”, explicó.
 Control y cierre del Reinfo
Los partidos que proponen medidas más duras son Salvemos al Perú y Avanza País. Ambos plantean cerrar definitivamente el Registro Integral de Formalización Minera (Reinfo), fortalecer la fiscalización ambiental y perseguir el lavado de activos asociado al oro ilegal.
 Sus propuestas incluyen terminar con las prórrogas del registro y reemplazarlo por un régimen de formalización con plazos estrictos. Buscan controlar la cadena de comercialización del oro mediante trazabilidad obligatoria, certificación de origen y mayor supervisión sobre plantas de beneficio y exportadoras. El objetivo es impedir que el oro ilegal ingrese al mercado formal.
 Como complemento, proponen sancionar a operadores que no cumplan con estándares ambientales, tributarios y laborales, así como establecer cronogramas obligatorios de formalización e interdicción para los que permanezcan en el sistema sin avances.
 Un enfoque más flexible
El grupo de partidos plantea un enfoque distinto. Podemos Perú, Venceremos y Juntos por el Perú proponen facilitar el acceso a financiamiento, asistencia técnica y mercados para quienes operan en condiciones informales.
 Las iniciativas incluyen mecanismos para que el Estado participe en la compra de minerales o promueva circuitos de comercialización para pequeños productores, siempre que cumplan estándares básicos de trazabilidad o manejo ambiental.
 Venceremos, por ejemplo, propone actualizar la ley de concesiones mineras para evitar el acaparamiento de tierras y establecer áreas destinadas al desarrollo de la pequeña minería.
 Para estos partidos, es clave diferenciar al minero informal del operador ilegal vinculado a organizaciones criminales. La idea, según señalan, es integrar a los pequeños productores al sistema formal sin criminalizar su actividad. Sin embargo, especialistas advierten que esa frontera suele ser difusa, ya que redes ilegales operan utilizando registros o permisos de mineros en proceso de formalización.
 El silencio de varios partidos
El informe del OMI identifica otros planes de gobierno que apenas mencionan la minería ilegal o no presentan medidas concretas para enfrentarla. El tema se diluye dentro de capítulos generales sobre minería, desarrollo productivo o ambiente.
 Figuran en esta categoría Renovación Popular, Fe en el Perú y el Partido de los Trabajadores y Emprendedores, cuya plancha presidencial quedó fuera de carrera tras la muerte de su candidato, Napoleón Becerra.
 Según el Observatorio, esta ausencia preocupa si se considera el crecimiento de la economía del oro ilegal y su impacto en la seguridad, el ambiente y las instituciones del país.
 Los rostros de los informales
Parte de ese silencio puede explicarse por la presencia de candidatos vinculados al sector en las listas al Congreso. Según un informe del medio Territorio Tomado, al menos 64 postulantes tienen el Registro Integral de Formalización Minera (Reinfo) vigente o suspendido.
 Se trata de voceros, asesores y operadores vinculados a organizaciones de mineros informales, así como de congresistas que promovieron las ampliaciones del registro y buscan la reelección.
 Javier Bernal Salas, representante de la Confederación Nacional de Pequeña Minería y Minería Artesanal del Perú (Confemin) y vinculado a concesiones mineras en Carabaya, Puno, busca una curul en la Cámara de Diputados por Renovación Popular, el partido de Rafael López Aliaga.
 En Perú Libre, organización fundada por Vladimir Cerrón, se otorgó un cupo a Adolfo Valverde Calipuy, asesor de Confemin que postula como candidato a diputado por La Libertad.
 Otro caso es el de Raúl Noblecilla, asesor legal de la Asociación de Mineros Ancestrales, organización vinculada a Confemin. Noblecilla integra la plancha presidencial con José Luna y al mismo tiempo busca un escaño en el Senado. Por ese mismo partido postula al Senado el congresista Guido Bellido, uno de los impulsores de las ampliaciones del Reinfo.
 Poder político del sector
La presencia de este sector no se limita a las candidaturas. Según Territorio Tomado, varios partidos cuentan entre sus militantes con personas vinculadas al registro minero.
 Alianza para el Progreso, de César Acuña, tiene 1.083 militantes asociados a 1.393 registros mineros. Le sigue Perú Libre, con 736 militantes vinculados a 943 registros, y Somos Perú, con 606 militantes relacionados con 773 registros dentro del sistema.
 Estos datos muestran cómo la minería informal ha empezado a construir poder político propio, un fenómeno que influirá en el debate sobre la formalización minera, el futuro del Reinfo y la eventual discusión de una nueva Ley MAPE.
 A ello se suma, según Nicolás Zeballos Trigoso, abogado y director de CriminologiaPe, la enorme capacidad de la minería ilegal para financiar estructuras políticas e influir en campañas electorales. “El oro tiene capacidad de financiar aproximadamente 36 campañas presidenciales”, dijo a Territorio Tomado.
 El futuro del Reinfo
El destino del Reinfo es uno de los puntos centrales del debate. El registro fue creado para formalizar a los mineros informales, pero ha sido prorrogado en varias ocasiones pese a los escasos resultados.
 Mientras algunos partidos plantean cerrarlo definitivamente y reemplazarlo por un nuevo régimen de formalización con plazos estrictos, otros proponen reformarlo para facilitar la formalización y vincularlo a financiamiento o asistencia técnica.
 Diversos estudios del Instituto Peruano de Economía (IPE) y del propio OMI sostienen que el Reinfo ha terminado funcionando, en muchos casos, como un mecanismo de protección temporal para operaciones que no avanzan hacia la formalización y otras ilegales.
 Las recomendaciones de los especialistas
Para el Observatorio de Minería Ilegal, enfrentar el problema exige intervenir en toda la cadena de valor del oro ilegal. Recomienda, entre otras cosas, mejorar la trazabilidad del mineral, reforzar el control sobre plantas de procesamiento y exportadoras, fortalecer las capacidades de fiscalización del Estado y combatir la corrupción que facilita la expansión de esta economía.
 Sin reformas que cierren esos espacios, advierte el OMI, cualquier política contra la minería ilegal seguirá siendo limitada, incluso si aparece en los discursos de campaña.', resumen_corto = 'Mientras la minería ilegal expande su poder económico y político, los partidos que compiten en las elecciones de 2026 se dividen entre quienes proponen endurecer el control, quienes plantean facilitar la formalización y quienes apenas mencionan el problema en sus planes de gobierno. Según el Observatorio de Minería Ilegal, solo el 30 % tiene propuestas claras sobre este tema.'
WHERE titulo = 'Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales' AND fecha_publicacion = '2026-03-26';

UPDATE reportajes SET desarrollo = 'De acuerdo con esos datos, la minería formal tiene presencia importante en regiones como Áncash, Junín, Lima, Pasco, Moquegua, Arequipa y Apurímac.

La importancia del cobre
La producción anual de cobre, entre enero y diciembre de 2025, alcanzó 2 769 794 TMF, un 1.2 % más que en el mismo periodo de 2024 (2 736 237 TMF). Este resultado marca la mayor producción anual de cobre en la historia del país.

A nivel empresarial, Southern Perú lideró la producción nacional con 14.84 % del total. Le siguieron Minera Las Bambas, con 14.83 %, y Sociedad Minera Cerro Verde, con 14.7%. Las tres compañías concentraron casi la mitad de toda la producción.

En el plano regional, Moquegua lideró con 17.2 % del total nacional. Arequipa ocupó el segundo lugar con 14.9 %, seguida por Apurímac y Áncash, con 14.8 % y 14.6 %, respectivamente. Cuatro regiones que concentraron más del 60 % de la producción nacional.

La plata y el zinc
La producción de zinc alcanzó 1 506 413 toneladas métricas finas (TMF). Antamina lideró la producción con 34.4 %, seguida por Volcan, con 11 %, y Nexa Resources, con 6.2 %. Estas tres empresas concentraron más de la mitad de la producción nacional.

Desde una mirada nacional, Áncash encabezó el ranking regional con 38.6 % del total, muy por encima de Junín, con 15.6 %, y Lima, con 13.4 %. Tres regiones que reunieron más de dos tercios de la producción de zinc.

En plata, Antamina ocupó el primer lugar con 15.4 % del total nacional, seguida por Compañía de Minas Buenaventura, con 11 %, y Minera Chinalco Perú, con 6.2 %. A nivel regional, la producción se concentró principalmente en Áncash, Lima y Pasco, que en conjunto superaron el 50 % del total nacional.

El oro que brilla
La producción nacional acumulada de oro llegó a 108 906 740 gramos finos, una ligera reducción de 0.7 % frente a 2024.

A nivel empresarial, Yanacocha lideró la producción nacional con 14.7 %, seguida por Poderosa, con 7.9 %, y Boroo Misquichilca, con 5.4 %. Las tres compañías concentraron un tercio de la producción nacional.

La Libertad se mantuvo como el principal productor con 27.9 %, seguida por Cajamarca, con 23.9 %, y Arequipa, con 21.5 %. Allí se concentró más de dos tercios de la producción aurífera del país.

Resultado de estas cifras, entre enero y noviembre de 2025, las exportaciones mineras sumaron 54 535 millones de dólares, lo que representó un aumento de 24 % frente al mismo periodo de 2024, cuando las ventas afuera sumaron 43 987 millones de dólares.

En un contexto de creciente demanda de minerales a nivel mundial, estas cifras aportan una mirada clara sobre el desempeño de la minería formal en el país, evidenciando cómo esta industria sostiene economías y concentra esfuerzos productivos en regiones clave.', resumen_corto = 'El sector minero cerró el 2025 con niveles récord de producción y consolidó su contribución como eje constante y dinamizador de la economía peruana. Según el Boletín Estadístico Minero del Ministerio de Energía y Minas (Minem), ese crecimiento fue impulsado por el cobre, el zinc y la plata. Estos minerales mantuvieron altos volúmenes de producción. El oro no se quedó muy atrás.'
WHERE titulo = 'Empresas y regiones que concentran la producción minera en Perú' AND fecha_publicacion = '2026-03-18';

UPDATE reportajes SET desarrollo = 'La extracción ilegal de oro y otros minerales ya no es un fenómeno aislado. Es uno de los problemas más graves de los últimos años. A medida que el precio del oro sube a máximos históricos, la minería ilegal también crece. Se sabe que llega llegado a movilizar más de 12 000 millones de dólares al año, cifra comparable a sectores formales de la economía.

Según datos oficiales y académicos, esta actividad ilícita genera pérdidas fiscales estimadas en más de 22 000 millones de soles anuales (2,5 % del Producto Interno Bruto). Para el Ministerio Público, este sector ilegal mueve siete veces más dinero que el narcotráfico. De igual forma, las exportaciones de oro no declaradas alcanzaron igualmente cifras récord: en 2024 se estimó exportaciones ilegales de oro por 7 400 millones de dólares y habría alcanzado más de 12 000 millones de dólares en 2025.

Las consecuencias son graves daños ambientales y el aumento de la violencia. En regiones como Madre de Dios, La Libertad, Puno, Arequipa y Loreto, la minería ilegal deforestó decenas de miles de hectáreas de bosque tropical, contaminó ríos con mercurio y desplazó a comunidades indígenas.

En muchos casos, la minería ilegal está controlada o explotada por redes criminales que combinan tráfico de insumos, lavado de activos, extorsión y violencia armada. Eso lo convierte en un problema ambiental y de seguridad.

Con ese gran problema llegamos a la campaña electoral. Se ha visto que algunos partidos respaldan abierta o solapadamente a los mineros informales e ilegales, mientras otros anuncian una lucha frontal y su erradicación. En muchos casos son frases declarativas; en otras, propuestas genéricas; solo pocas tienen cierta precisión sobre lo qué se debe hacer para frenar la minería ilegal y formalizar la informal.

Más allá de eso, lo cierto es que estos mineros son protagonistas de la campaña electoral. El portal Congrezoo.pe reveló que, por lo menos, 28 partidos políticos tienen entre sus candidatos al Senado y a Diputados a 55 personas que Registro Integral de Formalización Minera (REINFO) vigente o suspendido. Entre esos partidos se puede mencionar a Fuerza Popular, Podemos Perú, Perú Libre, Apra, País Para Todos, Somos Perú, Partido Democrático Federal, Partido Patriótico del Perú, alianza Unidad Nacional, etc.

Lo que dicen los planes
D&D revisó los planes de gobiernos de 33 partidos que postulan a la presidencia para conocer sus propuestas sobre este problema. La mayoría reconoce en los diagnósticos que la minería ilegal es hoy uno de los principales problemas de seguridad, ambientales y económicos del país. Algunos combinan propuestas de mano dura e interdicción con algún esquema de formalización de la pequeña minería y la nueva Ley MAPE. Otros quieren cerrar el REINFO por considerarlo un manto de impunidad. Otro grupo prefiere reformarlo y simplificar trámites para atraer a los mineros a la legalidad.

Se puede decir que, como eje común, aparece el control de insumos críticos (mercurio, combustibles y explosivos), la trazabilidad del oro, la creación de unidades élite o comandos mixtos y la recuperación de territorios afectados, sobre todo en la Amazonía y áreas protegidas. Se repite también la idea de reformar la Ley Minera, caducar “concesiones ociosas” y crear bancos o empresas mineras estatales, con metas de reducción de deforestación y minería ilegal.

Cada partido con su camino
Ahora Nación plantea que la minería ilegal está articulada con redes criminales y corrupción, y propone un enfoque técnico: laboratorio estatal en el Instituto Geológico, Minero y Metalúrgico (INGEMMET), con filtros anticorrupción; unidades policiales especializadas contra el desvío de químicos; centros regionales de formalización y un sistema integral de trazabilidad del oro. Su apuesta es ambiciosa: formalizar al 50 % de los mineros y reducir en 20 % las áreas degradadas.

Alianza para el Progreso (APP) ve la minería ilegal ligada al narcotráfico y la trata. Proponer cerrar el REINFO y un nuevo régimen MAPE por tramos, con trazabilidad de explosivos y mercurio, créditos con garantía estatal y hasta títulos de propiedad con blockchain para facilitar financiamiento. Pero este partido tiene a mineros informales entre sus candidatos al Legislativo.

Avanza País acusa al REINFO de burocrático e ineficaz y habla de 110 toneladas de mercurio vertidas cada año en ríos. Propone un Nuevo Código Minero, el programa “Cero Mercurio”, auditorías sorpresa a compradores de oro y una fuerza de tarea permanente contra mafias mineras. Es el partido que más frontal se muestra, al menos en los papeles, frente a esta actividad ilícita.

Buen Gobierno mira el problema como territorial y estructural: plantea una Agencia Nacional de Formalización Minera, corredores mineros sostenibles, sustitución progresiva del mercurio y penalización de la minería en cabeceras de cuenca y áreas protegidas.

Cooperación Popular apuesta por mapear las zonas invadidas por minería ilegal y declarar intangibles los terrenos del Estado, defendiendo con dureza las áreas naturales protegidas.

Hay partidos que prácticamente guardan silencio, como Fe en el Perú, Partido de los Trabajadores y Emprendedores o Renovación Popular, lo que también es una posición política: dejar el problema fuera de la agenda.

Otros plantean enfoques sociales
Frente de la Esperanza pide un censo minero in situ y formalización con concertación comunitaria. Juntos por el Perú cuestiona la concentración de concesiones y propone cooperativas mineras, parques mineros y comercialización estatal del oro, buscando proteger a los mineros más vulnerables.

Fuerza Popular, Partido Morado, Integridad Democrática y Alianza Unidad Nacional convergen en crear comandos mixtos Policía–Ejército–Fiscalía–SUNAT, control de insumos, persecución financiera del delito y presencia permanente en zonas críticas, aunque Fuerza Popular es otro de los partidos con mineros informales como candidatos.

El Partido Morado plantea cerrar definitivamente el REINFO y desplegar una Fuerza Amazónica, con bases y drones. Fuerza y Libertad proponer introducir tecnología: drones e inteligencia artificial para monitoreo ambiental, con metas al 2031 de reducir 50 % del territorio afectado por minería ilegal y lograr trazabilidad digital total en minería formal.

Para el Partido Aprista, se debe cerrar el REINFO entre 2026 y 2027, eliminar el mercurio con subsidios tecnológicos y democratizar el acceso a concesiones vía INGEMMET.

En Podemos Perú apuestan por industrializar minerales en el país para dejar de exportar solo materia prima; son muy permisivos a esta actividad porque en sus filas hay varios mineros informales y voceros oficiosos de estos, como el congresista Guido Bellido Ugarte. Mientras tanto, Perú Acción quiere recuperar concesiones ociosas y priorizar empresas colectivas de mineros.

Somos Perú conecta la minería ilegal con los subsidios a combustibles en la Amazonía y propone eliminarlos, además de intervenir seis territorios críticos y aumentar el presupuesto contra minería ilegal a 500 millones de soles. Es otro partido con varios mineros candidatos.

Sí Creo y Libertad Popular ponen el acento en el control de insumos y la bancarización total de la venta de explosivos y maquinaria pesada.

En una versión más estatista, Venceremos plantea destruir dragas en ríos amazónicos, crear un Banco Minero del Estado y hasta modificar la Constitución para reforzar la soberanía sobre los recursos minerales. También propone comandos permanentes PNP–FFAA–Fiscalía, trazabilidad de químicos con vigilancia satelital y zonas de exclusión minera.

El dilema de fondo
Más allá de las diferencias, la campaña muestra que la minería ilegal dejó de ser un tema sectorial para convertirse en un debate sobre el modelo de país que queremos en este sector: ¿mano dura o integración económica?, ¿Estado fuerte o permisividad y complicidad?, ¿castigo a la ilegalidad o formalización de lo ilícito?

Si todo marcha como hasta ahora, con autoridades que miran para otro lado, la próxima administración heredará un serio problema de ilegalidad en la minería, con vínculos con organizaciones criminales. Pero, por ahora, poco se discute todavía sobre este tema en la campaña.', resumen_corto = 'Muchos partidos coinciden en que la minería ilegal es hoy uno de los principales problemas de seguridad, ambiental y económico. Lo que varía es su propuesta para hacerle frente. Algunos combinan interdicción más dura; unos, se fijan en el castigo al crimen organizado y el cierre del REINFO; otros, apuestan por reformarlo y simplificar trámites. Unos pocos guardan silencio.'
WHERE titulo = 'Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal' AND fecha_publicacion = '2026-01-26';

UPDATE reportajes SET desarrollo = 'El fiscal superior coordinador de las Fiscalías Especializadas en Materia Ambiental (FEMA), Frank Almanza, se sumó a las voces que consideran muy posible que los mineros ilegales financien a políticos en las elecciones generales, regionales y municipales del 2026.

“Todo aquel que tiene poder económico busca poder político. Así que no sería extraño que el dinero de la minería ilegal financie candidaturas”, respondió Almanza a la pregunta de si creía que el avance de la minería ilegal perturbaría las próximas elecciones.

No solo el fiscal Almanza piensa así. Según un estudio de Ipsos, el 70 % de peruanos dijo que esta actividad financiará la próxima campaña electoral, mientras que el 82 % señaló que este grupo tiene actualmente influencia en el Congreso y los gobiernos regionales.

Según el fiscal, ahora que se aproximan las elecciones, los candidatos a diputados, senadores y presidente deben plantear soluciones claras sobre esta situación. “Debería ser un punto imprescindible en el debate de las campañas”, señaló Almanza.

Para Almanza, lo importante en este momento es que el problema de la minería ilegal ha sido visibilizado. Nadie puede decir que no sabía, y la población ya está sensibilizada.

Interdicción no es suficiente
El fiscal refirió que las fiscalías ambientales persiguen los delitos de minería ilegal y realizan acciones de interdicción, como la destrucción de maquinaria, dragas, tracas (explosivos) y retroexcavadoras.

Sin embargo, precisó que el número de maquinaria en Puerto Maldonado, por ejemplo, es muy alto. En La Pampa, en Delta 1, habría cerca de 5,000 dragas y tracas, cada una con su respectiva máquina de lavado. Incluso tienen puentes; casi 700 máquinas entre cargadores, retroexcavadoras y camiones. “Las interdicciones ayudan. Se destruyen diez maquinarias por operativo, pero la minería ilegal, con el poder adquisitivo que tiene y el alto valor del oro hoy día, vuelve a adquirir estos equipos. Por eso creo que, si bien las interdicciones avanzan, no son la única solución”, señaló.

Para el fiscal, lo más importante para enfrentar a los mineros ilegales es identificar a los que están detrás de las organizaciones dedicadas a la minería ilegal. Para eso, dijo, es relevante contar con trabajo de inteligencia operativa, una búsqueda que conduzca a ellos. “Si solo intervenimos a los que están al lado de una máquina, capturamos al peón. Esa es la parte que falta. A partir de allí se podría empezar a hacer un trabajo serio”.

El Reinfo
El fiscal Almanza también consideró que el Registro Integral de Formalización Minera (Reinfo) se ha convertido en un escudo para operar ilegalmente. Recordó que, desde el 2012, menos del 2 % se ha formalizado y que actualmente hay más de 80,000 Reinfo, de los cuales 60,000 están suspendidos. “Pero estar suspendido no les impide operar. Y la norma —el Decreto Legislativo 1351, con una disposición complementaria final— dice que basta con tener el Reinfo para estar exonerado de delitos. Es una exención de responsabilidad. Nos hemos opuesto a que se siga prorrogando”, explicó.

Pese a eso, las fiscalías hacen esfuerzos para perseguir los delitos contra el medio ambiente. Sin embargo, no tienen la logística que hace falta. Almanza precisó que necesitan camionetas 4x4 para la sierra; deslizadores y chalupas para la selva; chalecos antibalas, ropa adecuada, botas con punta de acero, linternas, videocámaras, chalecos salvavidas, cuchillos de supervivencia, machetes, carpas y bolsas de dormir. “Pero el presupuesto para este año ha sido cero. Para Pataz sí se abrió presupuesto, pero solo después de la tragedia”.', resumen_corto = 'Frank Almanza, fiscal coordinador de las Fiscalías Especializadas en Materia Ambiental, alertó sobre posible influencia de estas mafias en la política, porque “todo aquel que tiene poder económico busca poder político”. Cuestionó también la falta de recursos logísticos para enfrentar esa actividad ilegal que se sigue expandiendo bajo el amparo del Reinfo.'
WHERE titulo = 'Fiscalía advierte que mineros ilegales posiblemente financien a candidatos' AND fecha_publicacion = '2025-06-19';

UPDATE reportajes SET desarrollo = 'La minería ilegal empezó aproximadamente en 2003 y, desde entonces, ha crecido tanto que se ha convertido en una amenaza para la economía y la seguridad nacional. Es una actividad actualmente vinculada al sicariato, la extorsión, los ajustes de cuentas, la trata y explotación de personas, y la corrupción.

De este problema se ocupan especialistas, funcionarios y algunas autoridades. Ellos saben que esta actividad ocasiona daños ambientales, genera riesgos a la salud por el uso de mercurio y amenaza la vida de los peruanos.

Martín Arana, líder de Gestión Territorial Amazónica de la Fundación para la Conservación y el Desarrollo Sostenible (FCDS), es uno de ellos. Arana expuso en el conversatorio “Estimaciones sobre la dimensión de la minería ilegal en el Perú- 2025”, un reporte sobre la dimensión de la minería ilegal en el Perú entre 2003 y 2023.

Para elaborarlo, analizó 16 estudios sobre minería ilegal realizados en esos 20 años, los cuales abordaron las brechas entre exportaciones de oro y volúmenes de producción. Una tercera parte de los estudios fue publicada en 2024.

El especialista realizó estimaciones mínimas y máximas de los volúmenes de producción de oro y del valor de su comercialización. La producción mínima estimada entre 2003 y 2023 fue de 475.83 toneladas, con un valor de comercialización de 23,361.48 millones de dólares; la producción máxima fue de 3,620.09 toneladas, vendidas por 165,357.57 millones de dólares.

El auge de esta actividad empezó en 2014. El pico más alto de producción fue en 2018, y el de valor de comercialización, en 2023. Es probable que el año pasado se hayan batido todos los récords debido al aumento del precio del oro, que superó los 3,200 dólares la onza.

En contraste, mientras aumentaban las ganancias, los recursos públicos para luchar contra los mineros ilegales se redujeron en 37 % desde 2019. Ese año el presupuesto fue de 121 millones de soles, y para 2024 disminuyó a 89 millones. “Es como pretender matar dragones con matamoscas”, dijo Arana.

Se sabe poco
Uno de los problemas más graves, según Arana, para enfrentar a los ilegales, es que el Estado no cuenta con un sistema integral de monitoreo de la minería ilegal. No se puede entonces dimensionar, optimizar ni hacer efectivas las políticas públicas para combatirla.

“La falta de variables e indicadores para dimensionar la minería ilegal, acordes con la realidad, se refleja en la insuficiencia o ineficacia de las medidas”, anotó.

Al respecto, Sidney Novoa, director de SIG y Tecnologías para la Conservación de ACCA, consideró importante la creación de un sistema de monitoreo integrado, como el que existe para el caso de la hoja de coca. Así sería más fácil contrastar los niveles de producción de oro con los de exportación. Dijo que la Unidad de Inteligencia Financiera (UIF) y la Sunat deberían trabajar como parte de ese sistema.

Asimismo, Dante Vera, director y fundador de V&C Analistas, expuso la necesidad de que el Estado realice un censo para saber cuántos mineros hay, cuántos trabajan en las minas y en qué áreas. Solo así, dijo, se pueden dictar medidas efectivas.

La criminalidad
Con el secuestro, tortura y ejecución de 13 trabajadores en Pataz, La Libertad, vimos el nivel de violencia que rodea a la minería ilegal.

Frank Almanza, coordinador nacional de las Fiscalías de Medio Ambiente (FEMA), reconoció que hay alrededor de diez lugares en el país donde, si no se toman medidas en el corto plazo, puede haber violencia como la de Pataz. “No estamos avanzando; estamos retrocediendo en tiempos en los cuales la criminalidad se está desbordando”.

Almanza también admitió que, a pesar del incremento de denuncias por minería ilegal y delitos afines, las tasas de sentencias son mínimas, debido a las normas que se aprobaron en el Congreso, y porque los recursos son escasos y las carencias, grandes.

Por ejemplo —dijo— la minería ilegal no puede ser investigada como organización criminal porque las penas no superan los cinco años, como se exige. “Minería ilegal es sacar oro, pero no es delito el transporte ni la venta. Son conductas típicas, pero no son sancionables. Tenemos absoluta carencia de normas”, explicó el fiscal.

Tampoco se pueden hacer denuncias a causa del Registro Integral de Formalización Minera (Reinfo). “Si queremos hacer una denuncia penal, el informal tiene un escudo protector que es el Reinfo, un Reinfo que pareciera que se quiere perpetuar”.', resumen_corto = 'En el conversatorio “Estimaciones sobre la dimensión de la minería ilegal en el Perú- 2025”, se señaló que, desde 2003, la minería ilegal ha crecido hasta convertirse en una amenaza nacional. Genera miles de millones, contamina, explota personas y se asocia al crimen organizado, mientras el Estado pierde capacidad para enfrentarla y carece de información básica para actuar.'
WHERE titulo = 'Gobierno no sabe cómo enfrentar la minería ilegal' AND fecha_publicacion = '2025-06-09';

UPDATE reportajes SET desarrollo = 'El presidente de la República, José Jerí Oré, consideró “razonable” la extensión del Registro Integral de Formalización Minera (Reinfo), pero se mostró en contra de que la prórroga sea por dos años, hasta diciembre de 2027, como señala el dictamen aprobado por la Comisión de Energía y Minas del Congreso. “Dos años no; un año, porque si ponemos seis meses le vamos a dejar una cierta situación complicada al próximo gobierno”, dijo Jerí Oré este fin de semana.

Ya la semana pasada, en Trujillo, Jerí Oré había dicho: “En el pleno tenemos que ponernos de acuerdo con el Congreso y buscar fórmulas intermedias, eclécticas, que no impliquen retroceder al 100 % con lo que ya se ha avanzado como Estado”.

Asimismo, el presidente del Consejo de Ministros (PCM), Ernesto Álvarez, señaló que el Ejecutivo observará la extensión de la vigencia del Reinfo si la norma se aprueba tal como está, sin diferenciar a los mineros informales y artesanales de los ilegales. “El Congreso tiene los instrumentos adecuados para separar la paja del trigo. Si ellos no lo hacen, nosotros primero vamos a observar la ley; pero, si no hay la decisión del Congreso de hacer algo bien hecho, entonces van a superar la insistencia y nosotros llevaremos el tema al Tribunal Constitucional”, advirtió.

Sobre la reincoporación de los de 50 000 mineros informales excluidos por llevar más de un año suspendidos al no haber cumplido los requisitos del proceso, Álvarez dijo que “sería perjudicial porque fueron retirados del Reinfo seguramente por algún motivo”.

Aunque el premier reconoció que en el Congreso existen los votos para ampliar el Reinfo, precisó que el gabinete tiene el encargo de preservar el interés nacional. “(…) tiene los votos de sobra para aprobar el Reinfo, pero estamos invocando que ellos abran la baraja para contemplar la realidad. (...) No es posible que los maliciosos, que se enriquecen destrozando la naturaleza, puedan seguir lucrando, estableciendo mafias criminales alrededor de la minería (…)”.

Dijo también que es necesario preservar los intereses de la pequeña minería y de la minería artesanal, pero sin permitir que las actividades ilícitas se amparen en el Reinfo.

La postura de Jerí Oré muestra un cambio. Como congresista apoyó en dos ocasiones la ampliación del Reinfo, en un debate que giraba en torno a la presión social y política de los mineros ilegales e informales, que tienen contactos en el Legislativo y pueden influir en determinados parlamentarios. Sin embargo, desde el Ejecutivo ya no mira el problema solo como una negociación con un grupo, sino como un problema nacional. Formalizar ya no se trata de dar un plazo más, sino de asumir que el fracaso del Reinfo ha permitido el desborde de la minería ilegal.

Parece que el entorno de Jerí también ha visto el deterioro de la imagen del Congreso, las encuestas que muestran el rechazo ciudadano al avance de la minería ilegal y la necesidad de que el Gobierno marque distancia de las economías ilegales. Por eso, aunque Jerí evitó cerrar completamente la puerta a un acuerdo, dijo que el Ejecutivo no está satisfecho con una ampliación hasta 2027. Entonces, si el Congreso aprueba la quinta ampliación tal como está planteada, el Gobierno de Jerí observará la ley.', resumen_corto = 'Para el Ejecutivo, la prórroga no debe ser por dos años, sino por uno; además, se debe diferenciar con claridad a los mineros artesanales e informales de los ilegales y no reincorporar a los 50 000 excluidos del registro. Si no hay acuerdo en estos puntos, el Gobierno observaría la ley y, en caso de que sea aprobada por insistencia, acudirá al Tribunal Constitucional.'
WHERE titulo = 'Gobierno observaría ampliación del REINFO si no cumple ciertas condiciones' AND fecha_publicacion = '2025-11-25';

UPDATE reportajes SET desarrollo = 'El Gobierno Regional de Apurímac cerró el año fiscal 2025 con una ejecución del canon minero y las regalías contractuales del 89,7 %, situándose en el puesto 12 de 25 pliegos presupuestales a nivel nacional y apenas un par de puntos por encima de la media nacional.

De los 125 millones 690 mil soles asignados el año pasado, la gestión del gobernador Percy Godoy utilizó 112 millones 830 mil soles (89,7 %) y dejó un saldo en caja, sin poder gastar, de 12 millones 860 mil soles.

¿EN QUÉ SE GASTÓ?
De acuerdo con el análisis realizado por el Instituto Videnza sobre la distribución del gasto según función, el grueso de estas transferencias estuvo dirigido al rubro de transporte (36,63 %), seguido de educación (21,49 %), agropecuaria (19,07 %), cultura y deportes (13,17 %) y otros (9,64 %).

Si se compara el gasto realizado en 2025 con el del período anterior, 2024, se observa una variación a la baja. En transporte se ejecutó el 38 %, en agropecuaria el 21,56 % y en educación el 17,72 %; aparece el rubro salud con el 14,69 %, además de otros con el 8,02 %.

Un detalle a tener en cuenta es que, en regalías contractuales, se devengaron 65 millones 971 mil 856 soles, mientras que por canon minero correspondieron 46 millones 015 mil 135 soles. Estos datos provienen del portal Consulta Amigable del Ministerio de Economía y Finanzas (MEF), sumando en conjunto una ejecución del gasto del 89,7 %.

Las transferencias, tanto por regalía contractual como por canon minero, están orientadas a la construcción y mejoramiento del servicio educativo, la adquisición de equipos de nuevas tecnologías, la construcción de trochas carrozables, el mejoramiento de sistemas de riego, el apoyo a cadenas productivas, la compra de equipos para centros de salud, la adquisición de vehículos y la construcción de losas deportivas, entre otros.

Sin embargo, se debe tener en cuenta que se trata de montos poco significativos, lo que evidencia una dispersión del recurso en numerosos proyectos de inversión, una situación que podría afectar su continuidad en el presente año fiscal.

Con relación a los gobiernos locales, estos recibieron en bloque, durante 2025 y por ambas fuentes, la suma de 697 millones 340 mil soles, de los cuales gastaron 577 millones 255 mil soles (82,78 %) y dejaron un saldo de 120 millones 080 mil soles. De esta manera, se ubicaron en el séptimo puesto entre las regiones con mayor capacidad de ejecución.', resumen_corto = 'De los 125 millones 690 mil soles entregados por esta fuente, la gestión de Percy Godoy gastó 112 millones 830 mil y dejó en caja 12 millones 860 mil. En cuanto a los 85 gobiernos locales, estos ejecutaron en bloque el 82,78 % de ambas fuentes'
WHERE titulo = 'Gobierno Regional de Apurímac invirtió el 89,7 % del canon minero y regalías transferidas en 2025' AND fecha_publicacion = '2026-02-11';

UPDATE reportajes SET desarrollo = 'La minería ilegal e informal generará pérdidas al Estado peruano por 5.200 millones de soles en la recaudación del Impuesto a la Renta (IR). El 50 % de ese impuesto se convierte en canon minero que se transfiere a los gobiernos regionales, provinciales y distritales: 2.600 millones de soles.

Quiere decir que los departamentos donde hay presencia de mineros informales e ilegales que extraen minerales y no pagan impuestos no recibirán canon.

La región Apurímac dejará de recibir 213 millones de soles; la región Puno, 460 millones; Arequipa, 450 millones; Madre de Dios, 240 millones; La Libertad, 215 millones; Ayacucho, 160 millones.

En estas regiones, la minería ilegal e informal se lleva el dinero que podría ser utilizado en obras para mejorar los servicios de salud, educación, carreteras, agua, desagüe, entre otros. Con el dinero que no recibirá cada región este año por la evasión tributaria, se podrían construir tres o cuatro colegios emblemáticos —que en promedio cuestan 60 millones de soles— o unos cuarenta colegios rurales, un hospital nivel II-2 —que suele costar 162 millones de soles— y aún quedaría presupuesto disponible para otras obras.

“Todas estas regiones se ven afectadas en su recaudación tributaria, lo que impide el desarrollo, destruye el medio ambiente y genera inseguridad ciudadana”, dijo el ministro de Energía y Minas, Jorge Luis Montero.

No es el único problema. En el gobierno han detectado que, en la mayoría de este tipo de actividades, se vulneran los derechos laborales de los trabajadores. Los dueños de las minas contratan personas para cavar socavones y extraer minerales; a estos trabajadores, aunque se les paga su sueldo, no se les otorgan vacaciones, ni seguro social, ni compensación por tiempo de servicios, ni se realizan aportes al sistema de pensiones. Tampoco cuentan con seguro de vida, por lo que, cuando ocurre un accidente y muere un minero, se realizan acuerdos extralegales para evitar sanciones penales.

Desde el gobierno dijeron que revisarán las normas sobre derechos laborales de los pequeños mineros para que puedan trabajar con salud y seguridad ocupacional. “Y no sean manipulados por personas que dicen que los defienden, pero que solamente los explotan y los exponen”, dijo el ministro.', resumen_corto = 'Esta actividad le costará al país más de 5.200 millones de soles en impuestos no recaudados en 2025. Regiones como Apurímac, Puno, Arequipa y Madre de Dios dejarán de recibir canon minero para obras básicas, mientras miles de trabajadores siguen expuestos a condiciones laborales precarias y sin derechos.'
WHERE titulo = 'Gobiernos regionales y locales perderán 2.600 millones a causa de mineros informales e ilegales' AND fecha_publicacion = '2025-08-04';

UPDATE reportajes SET desarrollo = 'La minería ilegal es vista por la mayoría de los peruanos como una actividad violenta, destructiva y vinculada a redes criminales. Así lo muestra un estudio del Centro Wiñaq basado en encuestas y grupos focales de Datum realizados en el norte, sur y Lima. Según el informe, además, la población percibe un fuerte impacto en el medio ambiente, en la seguridad y en la salud pública.

La posición mayoritaria de la población, con un 51%, respalda la decisión de poner un último plazo para el Registro Integral de Formalización Minera (Reinfo), mientras que un 34 % rechaza cualquier nuevo plazo y cree que esas operaciones deben ser clausuradas.

El estudio también encontró que el respaldo político a la minería informal tiene un costo electoral. En su mayoría, los votantes asocian ese apoyo con la corrupción y la influencia de intereses ilegales. Más del 70 % considera que la minería ilegal influye negativamente en el Parlamento y un porcentaje similar cree que el congreso recibe dinero de los mineros ilegales.

Aun así, se han presentado tres proyectos de ley en el Congreso que buscan ampliar nuevamente el Reinfo, incluso hasta el 2029. Ciertos legisladores promueven estas iniciativas pese a que la población percibe a la minería ilegal como un problema que genera graves daños al país. A los congresistas no parece importarles el daño que ocasiona esa actividad.

En el estudio se señala que los congresistas sobreestiman el apoyo ciudadano a la minería informal o ilegal y subestiman el desgaste político que genera defenderla. Para la mayoría, este tipo de minería sigue siendo una de las principales amenazas a la seguridad, la democracia y el medio ambiente.

Pocos congresistas se oponen a ampliar la vigencia del Reinfo, entre ellas la legisladora Diana Gonzales, quien cuestionó que representantes de los ministerios de Agricultura y Ambiente guarden silencio sobre este tema.

Observó también que la Comisión de Energía y Minas del Congreso pretenda priorizar la propuesta para prorrogar el Reinfo por un año más y reincorporar 50 mil mineros que no completaron su formalización hasta junio, en vez de debatir la nueva Ley MAPE.', resumen_corto = 'Un estudio del Centro Wiñaq revela que la mayoría de peruanos asocia la minería ilegal con el crimen, la corrupción y la destrucción ambiental. Pese a ello, en el Congreso se han presentado tres proyectos de ley para extender nuevamente el registro de formalización, señalado como el mecanismo para encubrir esa actividad ilícita.'
WHERE titulo = 'Investigación revela rechazo ciudadano a minería ilegal o informal' AND fecha_publicacion = '2025-11-05';

UPDATE reportajes SET desarrollo = 'Juliane Koepcke, recordada por ser la única sobreviviente del accidente aéreo del vuelo 508 de LANSA que se dirigía a Pucallpa en diciembre de 1971, vive hoy otra pesadilla en la selva peruana. La zoóloga y bióloga peruano-alemana está muy vinculada a la zona de Panguana, Huánuco, como investigadora y conservacionista.

Ella, junto al abogado especialista en temas ambientales, César Ipenza, denunciaron que cada día ingresan a Panguana, Huánuco, unas 35 maquinarias provenientes de Pucallpa y Oxapampa. Estas trabajan las 24 horas en busca de oro. A su paso arrasan bosques y el cauce del río; el daño que ocasionan al ecosistema es irreversible.

La operación cuenta con el respaldo de la comunidad Pampas Verdes, cuyos representantes cobran hasta 30 mil soles por cada máquina que ingresa y se movilizan para impedir que la autoridad intervenga.

Los mineros ilegales destruyen y contaminan la zona de amortiguamiento de la Reserva Comunal El Sira, a orillas del río Yuyapichis. “Panguana es la estación biológica más antigua de la Amazonía, donde se ha hecho investigación científica durante más de 60 años. Actualmente está siendo invadida y destruida todos los días”, advirtió Ipenza. Añadió que en la zona se utilizan retroexcavadoras y que “el río Yuyapichis prácticamente está muerto por la intervención de mineros ilegales que vienen de distintas zonas, pero principalmente de Madre de Dios”.

El especialista exhortó a las autoridades a asumir su responsabilidad. Reconoció que, aunque la Policía de Medio Ambiente y la Fiscalía realizan esfuerzos, estos son insuficientes por la falta de recursos y la ausencia de la Marina de Guerra, clave para proteger el ecosistema acuático. Además, alertó sobre la filtración de información desde autoridades locales. “Los mineros terminan enterándose de los operativos y mueven las máquinas al anexo de la comunidad asháninka Pampas Verdes, donde lamentablemente los líderes indígenas facilitan la actividad y defienden la maquinaria”, señaló.

Las denuncias indican que, cuando se anuncia la llegada de la policía o la fiscalía, la maquinaria es retirada estratégicamente y los operadores se refugian en la comunidad. Aunque la ley permite incautar los equipos y procesar a sus dueños, las intervenciones han sido débiles y sin resultados concretos. La semana pasada hubo dos intervenciones. Las autoridades llegaron, pero los mineros ya se habían retirado del lugar. Regresaron a las pocas horas a operar.

La experiencia de Koepcke como única sobreviviente del accidente aéreo de 1971 en la selva de Pucallpa, la llevó a comprometerse con la defensa de la naturaleza. Ella destacó la importancia ecológica de Panguana y recordó que alberga la estación biológica más antigua del Perú, pero, pese a su valor, sigue siendo explotada por los buscadores de oro. Según dijo, el alza del precio del metal agravó la situación en los últimos tres años.

La destrucción del río es ya evidente: el agua no es apta para el consumo, no hay peces ni fauna, el cauce presenta un tono turquesa producto del mercurio usado en la extracción. Hasta el momento se han presentado cinco denuncias penales con placas de vehículos y responsables identificados, mientras los directores de la Estación Biológica han recibido amenazas de muerte.', resumen_corto = 'La científica peruano-alemana explicó que la minería ilegal avanza en Panguana, Huánuco, donde, además, se encuentra la estación biológica más antigua de la Amazonía, donde se ha hecho investigación científica durante más de 60 años.'
WHERE titulo = 'Juliane Koepcke, única sobreviviente del accidente aéreo de 1971, denuncia que Minería Ilegal invade Reserva Comunal El Sira' AND fecha_publicacion = '2025-10-15';

UPDATE reportajes SET desarrollo = 'La Superintendencia de Banca, Seguros y AFP (SBS) advirtió que el lavado de activos vinculado a delitos ambientales, como la minería, la tala ilegal y el tráfico de fauna silvestre, está en aumento.

En concreto, según la Unidad de Inteligencia Financiera (UIF) de la SBS, en los últimos diez años ha recibido más de 5 700 reportes de operaciones sospechosas (ROS) vinculadas a la minería ilegal, lo que representa movimientos económicos por 22 800 millones de dólares.

Ese dinero se lava a través del uso excesivo de dinero en efectivo para, entre otras cosas, la adquisición de inmuebles y vehículos por medio de testaferros. En estos casos, es necesario que las entidades vinculadas intensifiquen la aplicación de sus controles y reporten inmediatamente a la UIF si detectan este tipo de transacciones.

De acuerdo con datos de la SBS, la minería ilegal es la tercera actividad que más alertas genera y presenta el segundo mayor monto reportado de operaciones sospechosas.

Además, entre enero de 2015 y setiembre de 2025, la UIF recibió 63 reportes sobre tala ilegal, por 136 millones de dólares, y 31 reportes por tráfico ilegal de flora y fauna silvestre, por casi 5 millones de dólares.

Según el analista principal de Inteligencia Operativa de la UIF, Diego Ulloa, si bien esta entidad no persigue los delitos directamente, sí desarrolla estrategias para detectarlos: comprueba el valor de las exportaciones con las transferencias del exterior, los consignatarios de las exportaciones con los ordenantes de transferencias y el perfil económico de las empresas involucradas, entre otros.

Sin embargo, la principal dificultad para identificar estos delitos es que los productos derivados de ellos son exportados de manera legal. “Si vamos a un puerto, a una frontera o a un aeropuerto, estos productos se van con papeles. Es difícil poder determinar el origen ilícito”, señaló Ulloa.', resumen_corto = 'Entre setiembre de 2015 y 2025, según la UIF, la SBS recibió más de 5700 reportes de operaciones sospechosas vinculadas a esta actividad ilícita. Por eso, advirtió tener cuidado con el uso excesivo de dinero en efectivo.'
WHERE titulo = 'La minería ilegal habría lavado unos 22 mil millones de dólares' AND fecha_publicacion = '2025-11-12';

UPDATE reportajes SET desarrollo = 'La violencia en el Perú ha dejado de ser patrimonio de las grandes ciudades. El norte, el centro y el sur del país acumulan hoy los principales focos de inseguridad del país, y detrás de esa expansión hay un patrón que se repite en cada región: economías ilegales que financian, ordenan y sostienen el delito. Así lo confirma el último reporte del Observatorio del Crimen y la Violencia —una iniciativa del BCP y Capital Humano y Social—, que da cuenta de 1,826 homicidios registrados en el 2025, la gran mayoría cometidos con armas de fuego en contextos de sicariato y extorsión organizada.

El informe revela además que el 59% de los homicidios se concentra en apenas 50 distritos a nivel nacional, varios de los cuales están directamente vinculados a economías ilegales, especialmente la minería informal y el narcotráfico. Y aunque Lima y el Callao siguen liderando en números absolutos, la tendencia más preocupante es la velocidad con que la violencia se está desplazando hacia el interior del país.

El norte y el centro: donde el crimen ya tiene nombre y territorio
La costa norte mantiene los mayores índices de homicidios del país. En Piura se registraron 44 homicidios, en Pataz 35 y en Tumbes 33, mientras que, en el eje central, Pisco acumuló 17 casos. No son cifras aisladas: son el reflejo de territorios capturados por economías ilegales que demandan protección armada.

En la provincia de Pataz, en La Libertad, la minería ilegal ha configurado un escenario donde el oro ilícito convive con el sicariato. Bandas armadas —como "Los Buitres de Pataz"— disputan socavones, rutas y zonas de extracción, convirtiendo la extorsión a mineros, transportistas y comerciantes en un mecanismo de control territorial. La masacre de 13 trabajadores mineros en mayo de 2025 expuso ante la opinión pública la magnitud de esa captura criminal. Desde 2020, las bandas criminales han realizado al menos 628 incursiones contra las instalaciones de la empresa Poderosa, con 18 empleados asesinados y más de 3.5 millones de dólares en oro robados.

En Cajamarca, particularmente en San Ignacio, la minería ilegal avanza sobre un territorio históricamente agrícola, donde el café convive cada vez más con redes de financiamiento criminal, cobro de cupos y amenazas. En Ica, la agroexportación comparte espacio con presencia minera informal incluso en zonas arqueológicas, generando nuevas condiciones para la extorsión.

El sur: la nueva frontera de la violencia organizada
El sur del país empieza a mostrar síntomas que antes eran propios de la costa norte. La incidencia de la extorsión en las regiones sureñas pasó del 12% en 2024 al 17% en 2025, un incremento de más del 40% en apenas un año. El informe sugiere que ese crecimiento está directamente vinculado a la expansión de la minería ilegal, que arrastra consigo redes de financiamiento informal, cobro de cupos y control territorial.

Puno registró 90 homicidios y Arequipa 67. A nivel distrital, Ananea lideró con 31 homicidios, seguida de Juliaca con 26 y Puerto Maldonado con 23. Varios de estos distritos son enclaves de disputa por el oro y otros minerales, donde el miedo se ha convertido en el mecanismo más eficaz de control social. Cerro Colorado, con 12 homicidios registrados, completa el cuadro de distritos sureños más afectados.

El "gota a gota": el brazo financiero del crimen
Uno de los fenómenos que más ha crecido en este periodo es el préstamo extorsivo conocido como "gota a gota". Según el Quinto Reporte del Observatorio del Crimen y la Violencia, el número de personas afectadas pasó de 3.7 millones en 2024 a 4.7 millones en 2025. Este sistema de préstamos con intereses usureros opera como mecanismo de control financiero de las redes criminales: quien no paga enfrenta amenazas, extorsión o, en los casos más extremos, la violencia del sicariato.

El "gota a gota", el cobro de cupos y la amenaza constante no son fenómenos aislados: forman parte de un mismo sistema delictivo que requiere economías ilegales para funcionar. Donde hay minería ilegal rentable —y hoy el oro supera los 3,500 dólares la onza— hay recursos para armar bandas, financiar sicarios y expandir el control territorial.

Impunidad: el combustible del sistema
El aumento de denuncias no ha sido acompañado por una respuesta eficaz del Estado. A nivel nacional, el 25% de la población mayor de 18 años afirma haber sido víctima de extorsión o conocer a alguien afectado en los últimos tres meses: más de 6 millones de personas. Pese a ese dato alarmante, el número de personas encarceladas por extorsión prácticamente no ha variado en los últimos años.

La Policía enfrenta limitaciones estructurales: falta de personal calificado, escasa tecnología y casos documentados de infiltración en sus propias filas. Como señala el analista Eduardo Pérez Rocha, "el delito de extorsión está en aumento y parece indetenible porque falta personal calificado y tecnología como instrumentos de geolocalización". Sin cortar el flujo de dinero que sostiene el sistema ilegal —y sin desmantelar las economías criminales que lo alimentan—, la violencia seguirá encontrando dónde anclarse.', resumen_corto = 'El último reporte del Observatorio del Crimen y la Violencia confirma que la inseguridad ya no es un fenómeno concentrado en Lima. El norte, el centro y el sur del país registran homicidios, extorsiones y presencia de redes criminales que orbitan alrededor de la minería ilegal, el "gota a gota" y el sicariato.'
WHERE titulo = 'La violencia ligada a economías ilegales se expande por todo el Perú' AND fecha_publicacion = '2026-04-30';

UPDATE reportajes SET desarrollo = 'Siete vías en La Libertad, Cusco, Ica y Arequipa han sido bloqueadas por los mineros informales, que están en huelga desde el 26 de junio y ya anunciaron una marcha de sacrificio a Lima, para sumarse a los que acampan cerca del Congreso, a la espera de la aprobación exprés y sin debate de la nueva Ley de Minería Artesanal y de Pequeña Escala (MAPE).

En el Congreso agendaron el debate de la nueva ley, mientras que el gobierno de Dina Boluarte dijo que “no cederá a chantajes de la minería ilegal”, pero, al mismo tiempo, amplió el Reinfo y no ha observado la Ley MAPE.

Al respecto, el Observatorio de Minería Ilegal (OMI) cuestionó la intención de aprobar la nueva Ley MAPE, una norma que, según expertos y organizaciones civiles, no soluciona el problema; por el contrario, agravaría la crisis ambiental y social. El observatorio señala que la ley, impulsada sin el debido debate técnico, busca perpetuar un modelo de minería sin fiscalización efectiva ni control estatal, y permitiría incluso el uso de ríos, lagos y quebradas para actividades mineras informales.

“Estas medidas fomentan la impunidad, la contaminación con metales tóxicos como el mercurio y el debilitamiento del Estado de derecho”, señaló en un pronunciamiento el observatorio, que está integrado por ocho organizaciones, entre ellas ECOAN, la Fundación para la Conservación y el Desarrollo Sostenible, la Sociedad Zoológica de Fráncfort, DAR, Conservación Amazónica, entre otras.

Para el observatorio, el papel de algunos congresistas y la presión de los mineros informales por una aprobación “exprés” en la Comisión de Energía y Minas (y su pase a la Comisión Permanente) buscan que este tema no sea debatido en el Pleno.

Como está redactada, la Ley MAPE ayudaría a ampliar las actividades ilegales y va en contra de la protección del ambiente y de la regulación del uso de los recursos naturales, que establece el artículo 68 de la Constitución.

El observatorio también pidió al Ministerio Público que investigue a los eventuales financistas de las protestas, bajo el discurso del derecho al trabajo. Los mineros pasaron de pedir solo la ampliación del Reinfo a exigir un proceso de formalización sin condiciones ni controles. Y eso flexibiliza normas.

Diez propuestas
El observatorio había planteado diez medidas a la Comisión de Energía y Minas del Congreso para frenar el avance de la minería informal e ilegal. Sin embargo, estas no han sido tomadas en cuenta.

El observatorio proponía, entre otras cosas, que se diferencie con claridad a un minero artesanal o informal de uno ilegal, reconociendo sus diferencias y necesidades para formalizarlos; que se mejore el control y la fiscalización de las plantas de procesamiento de minerales (que operan en la sombra y lavan mineral ilegal e informal). Solo así se podrá rastrear el origen del oro y frenar el uso de químicos peligrosos. “Las plantas de beneficio son un tema clave en este proceso. Se debe trabajar con la SUNAT y la Unidad de Inteligencia Financiera (UIF)”, dijo César Ipenza, abogado especialista en temas ambientales.

Asimismo, planteaba que ningún minero pueda cavar sin antes presentar un plan ambiental que garantice el cuidado del agua, el suelo y las comunidades; y que se delimiten las áreas protegidas donde no se puede hacer minería: áreas naturales protegidas, territorios indígenas, ríos, sitios arqueológicos, territorios forestales, etc. De acuerdo con Ipenza, la nueva ley debería declarar esas áreas y territorios como intocables.

Además, el uso del mercurio (que envenena ríos y personas) debe ser eliminado para el 2030. También se debe modificar el Código Penal para eliminar vacíos legales que favorecen la impunidad, tipificar la minería ilegal como crimen organizado y sancionar drásticamente la corrupción en las autoridades. Actualmente, el artículo 307-A del Código Penal exceptúa al minero en “proceso de formalización” de investigaciones fiscales y policiales por el delito de minería ilegal.', resumen_corto = 'Según el Observatorio de Minería Ilegal, la Ley MAPE, impulsada sin el debido debate técnico, busca perpetuar un modelo de minería sin fiscalización efectiva ni control estatal. La organización consideró que esta ley permitiría incluso el uso de ríos, lagos y quebradas para actividades mineras informales.'
WHERE titulo = 'Ley MAPE amaneza cuidado de ríos, lagos y quebradas' AND fecha_publicacion = '2025-07-08';

UPDATE reportajes SET desarrollo = 'Mario tiene 22 años. Trabaja en una mina de socavón en el límite entre Arequipa y Ayacucho. Lleva tres años allí. Sus padres, campesinos de Ayacucho, no pueden pagarle estudios en un instituto o una universidad.

Hace medio año, mientras sacaba mineral, una piedra grande le cayó cerca y casi le fractura el omóplato. Se salvó por reflejo. Si no, la roca le habría golpeado la cabeza. Habría muerto, como otro joven, casi de su edad, en un socavón de Choccoyo, en Cusco. El dueño de la mina solo le dijo que vaya a su pueblo y regrese cuando estuviera sano. No le dio dinero para su traslado, menos para su tratamiento médico.

Este tipo de accidentes ocurre con frecuencia en minas ilegales. El 15 de marzo pasado, dos mineros murieron aplastados por el derrumbe de una roca de seis metros dentro de un socavón ilegal en Huánuco. Roger Castro, director de Energía y Minas del gobierno regional, informó que la labor no contaba con permisos ni instrumentos ambientales.

A fines de abril último, en Cajamarca, tres personas resultaron gravemente heridas tras una explosión de gases ocurrida mientras trabajaban al interior de un socavón ilegal. Según información preliminar, la detonación se habría producido por la acumulación y manipulación inadecuada de gases inflamables en el interior de la mina.

Un socavón ilegal casi siempre carece de soporte para evitar accidentes. Allí se usan explosivos, la ventilación es deficiente y ninguna autoridad supervisa las condiciones laborales. Muchos trabajan en semioscuridad, entre 12 y 17 horas diarias, cinco o siete días a la semana, en ambientes húmedos y fríos o secos y calientes.

No solo la seguridad es precaria. El trabajador minero no tiene contrato laboral, ni seguro social, ni compensación por tiempo de servicios (CTS), ni vacaciones.

Este panorama se repite en gran parte del país. Según la Defensoría del Pueblo, en los últimos años se ha registrado actividad minera informal e ilegal en 21 de las 25 regiones. Opera en yacimientos aluviales, como en Madre de Dios, parte de Puno y Loreto, y también en vetas en zonas andinas y costeras.

El estudio “Caracterización de las condiciones de trabajo forzoso en la minería de oro en Madre de Dios”, de Teodoro Sanz para el Ministerio de Trabajo, describe la diversidad de labores en Madre de Dios: macheteros, carreteros, buzos, maraqueros, traqueros, carancheros, operadores de camiones y cocineros.

Allí las condiciones son duras. La jornada laboral promedia 67 horas semanales, es decir, unas 12,5 horas al día. El 31 % trabaja los siete días de la semana. El 12 % llega a laborar jornadas de 24 horas. Y el 8 % supera las 84 horas semanales.

El 83 % de los trabajadores afirma que está expuesto a riesgos: quemaduras por el sol, picaduras de animales, exposición al mercurio y otros químicos, cortes y, en menor medida, explosiones o derrumbes. El 62 % dice que no recibe equipos de protección personal, como botas, cascos, guantes o mascarillas. El 57 % asegura que enfermó o sufrió un accidente y no recibió atención médica.

Las condiciones básicas también son deficientes. Los servicios higiénicos suelen ser pozos ciegos, ríos, acequias o el monte. La electricidad funciona por horas con generadores. El agua que consumen proviene, en su mayoría, de ríos, acequias o manantiales sin tratamiento.

Distintos estudios coinciden en que la minería informal e ilegal opera con condiciones laborales precarias. No respeta derechos, impone jornadas excesivas y expone a los trabajadores a un alto riesgo de muerte y contaminación.', resumen_corto = 'La mayoría de los mineros, jóvenes o adultos, que trabajan en este tipo de minas no tienen contrato ni seguridad, cumplen jornadas de hasta 17 horas y están en alto riesgo de morir en accidentes.'
WHERE titulo = 'Los peligros de trabajar en un socavón ilegal' AND fecha_publicacion = '2026-05-14';

UPDATE reportajes SET desarrollo = 'En distintos territorios del país donde se alzaron voces en defensa del agua, por ser esencial para la vida y actividades económicas como la agricultura, hoy la minería ilegal avanza sin control amenazando ríos, lagos y ecosistemas enteros. 
 En localidades como Tambogrande, región Piura, o Cajamarca y Celendín, región Cajamarca, donde años atrás las poblaciones se levantaron a favor de las lagunas, los ríos y los manantiales, ahora empieza a imponerse la minería que, bajo la denominación de “en proceso de formalización”, opera al margen de las leyes.
 Esas operaciones mineras contaminan las fuentes de agua destinadas al consumo humano y la ganadería, y degradan los suelos agrícolas. “Hoy, las mismas fuentes de agua que se defendieron a capa y espada están contaminadas”, señala José de Romaña, director en IPCH.
 El avance de esta actividad no se explica únicamente por su carácter ilegal. También responde a la falta de liderazgo de las autoridades nacionales para enfrentar la ilegalidad, y a que las instituciones estatales han sido incapaces de implementar políticas que frenen la expansión de la minería ilegal y garanticen alternativas de desarrollo para las comunidades.
 El vacío de autoridad ha dejado el campo libre a las economías ilegales que, poco a poco, se están convirtiendo en grupos con poder económico e influencia política en varias regiones.
 No solo eso. La minería ilegal no prospera únicamente por la ausencia del Estado, sino también gracias a la complicidad de autoridades locales y actores políticos que facilitan su expansión, permitiendo sus operaciones. Basta ver al gobierno de Dina Boluarte y al Congreso, que legislan a favor de las organizaciones criminales y la ilegalidad. Según un reciente estudio del Centro Wiñaq, el 70,2 % de peruanos consideró que los congresistas respaldan a esta actividad ilícita porque reciben financiamiento o buscan capital electoral.
 Así, lo que debería combatirse desde la institucionalidad se termina legitimando desde el poder político. El resultado es la destrucción progresiva de la Amazonía, la contaminación de fuentes de agua, el despojo de terrenos comunales y la pérdida de oportunidades y recursos económicos que nunca llegan al Estado porque no pagan impuestos.', resumen_corto = 'Durante años, comunidades enteras salieron a las calles para proteger sus fuentes de agua, las mismas que hoy están bajo la amenaza de la minería ilegal, que avanza con la complicidad de autoridades y el silencio del Estado.'
WHERE titulo = 'Los ríos y lagos que antes se defendieron con marchas, hoy son contaminados por mineros ilegales' AND fecha_publicacion = '2025-09-10';

UPDATE reportajes SET desarrollo = 'Un total de 735 candidatos postulan a cargos de gobernador regional, consejero, alcalde y regidor en las elecciones de octubre de 2026 y están inscritos en el Registro Integral de Formalización Minera (Reinfo). Según la base de datos del medio digital Territorio Tomado, 43 postulan a gobiernos regionales en 15 departamentos, mientras que 692 buscan llegar a alcaldías y regidurías en 22 departamentos. Los partidos con más candidatos con Reinfo son Ahora Nación, Alianza para el Progreso (APP), Perú Primero, Podemos Perú, Progresemos, Somos Perú y Acción Popular.
 En tanto, la mayoría de los postulantes a gobernador con Reinfo se concentra en Arequipa, con nueve; Madre de Dios, con siete; y Apurímac, con seis, regiones con territorios dominados o con fuerte expansión de la minería ilegal. Son conocidos los centros mineros de Secocha, en la provincia de Camaná, Arequipa; La Pampa, en la provincia de Tambopata, Madre de Dios; y Tapayrihua, en la provincia de Aymaraes, Apurímac.
 En relación con las elecciones municipales, Apurímac concentra la mayor cantidad de candidatos con Reinfo, con 125 inscritos, seguido de Arequipa, con 98; Puno, con 96; Ayacucho, con 76; La Libertad, con 42; Huancavelica, con 41; Cusco, con 39; y Lima, con 30. En los otros 15 departamentos, la cantidad de aspirantes municipales que cuentan con ese registro oscila entre dos y 26.
 En Cusco, Juan de Dios Mayhua Hancco, de Ahora Nación, postula a la alcaldía de Camanti, Quispicanchi, y es representante legal del derecho minero Remy Sebas I con Reinfo suspendido. Yudith Eulalia Quispe Sánchez, de ese mismo partido, postula como alcaldesa para Colquemarca, Chumbivilcas, y es dueña del derecho minero Fuerza de la Esperanza SA 3002 con Reinfo vigente. En ambas provincias se desarrolla minería ilegal e informal cada vez con más intensidad.
 Para el analista político Iván Arenas Ramírez, el número de este tipo de candidaturas genera preocupación porque, aunque la formalización de la minería artesanal y de pequeña escala depende del Minem, la fiscalización de las plantas de procesamiento depende de los gobiernos regionales y muchas de ellas operan con Reinfo, lo que podría significar un conflicto de interés entre fiscalizador y fiscalizado.
 Según el analista, el principal problema con las plantas de procesamiento que procesan menos de 350 toneladas diarias es la casi inexistente fiscalización. “Todos sabemos que algunas de estas plantas reciben producción ilegal que se presenta como producción informal”.
 Consideró también que existe el riesgo de que, de ganar, estos políticos puedan usar su poder para favorecer la permanencia de actividades mineras no legales. “Ese poder político es amplio y, en algunas regiones, tiene nexos con poderes mediáticos que están al servicio de la minería ilegal o informal”, señaló.
 El Reinfo sigue siendo el problema
En ese contexto, ha vuelto a entrar a debate la posibilidad de una nueva ampliación del registro, que debería cerrarse definitivamente en diciembre de este año. La Confederación Nacional de Pequeña Minería y Minería Artesanal del Perú (Confemin) pidió, en su X Congreso Nacional, ampliar el registro por otros tres años, mientras que el ministro de Energía y Minas, Guillermo Shinno, no descartó extenderlo hasta que se apruebe la nueva Ley de la Pequeña Minería y de la Minería Artesanal (Ley MAPE).
 La eventual ampliación tendrá que ser analizada en el Congreso. La Comisión de Asuntos de Desarrollo Productivo, Energía y Minas, Infraestructura y Trabajo del Senado tiene como integrante al legislador del Partido del Buen Gobierno, Juver Flores Suárez, conocido en Arequipa por haber sido abogado de organizaciones mineras informales. Podría suceder lo que ocurrió en el Congreso anterior, cuando parlamentarios cercanos a los informales presionaron para lograr las sucesivas ampliaciones del Reinfo.', resumen_corto = '43 candidatos buscan llegar a gobiernos regionales y 692 postulan a alcaldías y regidurías. El analista Iván Arenas advierte los posibles conflictos de interés y el riesgo de que estas autoridades favorezcan las actividades mineras informales.'
WHERE titulo = 'Más de 730 mineros con Reinfo vigente o suspendido participan en las elecciones regionales y municipales' AND fecha_publicacion = '2026-08-28';

UPDATE reportajes SET desarrollo = 'La minería ilegal avanza sobre reservas naturales, áreas de conservación y cuencas hídricas. Se han identificado casos de ecosistemas bajo amenaza en Arequipa, Puno, Huánuco, Loreto, Junín y Ucayali. Varios informes, intervenciones fiscales y periodísticas, y monitoreos satelitales muestran que la presión de esta actividad ilegal golpea estas áreas frágiles.

Sucede en la Reserva Paisajística Subcuenca del Cotahuasi, en Arequipa. En los últimos años, la Fiscalía Especializada en Materia Ambiental (FEMA) realizó operativos contra campamentos y bocaminas dentro del área natural protegida. Según reportes oficiales, esa actividad obligó intervenciones a minería ilegal de socavón instalada en sectores de la reserva, que ponen en riesgo ecosistemas altoandinos y recursos hídricos.

• Documento sobre minería ilegal en áreas naturales protegidas

• Minería ilegal destruye áreas protegidas en Perú

En Puno, La Rinconada continúa operando uno de los más grandes enclaves de minería ilegal. Miles de mineros extraen oro en condiciones precarias, mientras las autoridades tienen dificultades para controlar una actividad que contamina, explota a obreros y se vincula con el crimen. Aunque la actividad se hace fuera de un área natural protegida específica, su impacto alcanza cabeceras de cuenca y ecosistemas de montaña.

La Reserva Comunal El Sira, ubicada entre Huánuco, Ucayali y Pasco, es una de las áreas protegidas con mucha presencia de mineros ilegales. Dentro de la reserva y su zona de amortiguamiento se desarrollan actividades aluviales y operaciones clandestinas. No solo hay minería ilegal de oro; también cultivos ilícitos, tala ilegal e invasión de bosques en territorios indígenas amazónicos.

• Informe sobre minería ilegal en áreas protegidas

• Operativos contra minería ilegal en El Sira

La Área de Conservación Privada Panguana, en Huánuco, también enfrenta actividades mineras ilegales. En la zona, reconocida por su biodiversidad amazónica, hubo intervenciones fiscales y alertas de organizaciones ambientales. Esa minería afecta el bosque y genera conflictos sociales y amenazas a quienes denuncian la destrucción ambiental.

• ACP Panguana está rodeada por minería ilegal en Perú

En Loreto, el Área de Conservación Regional Alto Nanay–Pintuyacu–Chambira se convirtió en uno de los principales focos de minería ilegal fluvial. Ahí detectaron infraestructuras mineras y dragas en la cuenca del Nanay, fuente de agua para la ciudad de Iquitos. Las autoridades realizaron operativos para destruir embarcaciones y maquinaria usada para extraer oro ilegal. A pesar de estos esfuerzos y los graves impactos evidentes, otras autoridades habrían admitido a trámite la solicitud de concesiones mineras sobre el río Nanay, una decisión incoherente con los esfuerzos por frenar la minería ilegal, que desconoce el daño ambiental ya existente en la zona y contraviene disposiciones normativas vigentes que prohíben el otorgamiento de concesiones en esta área.

• Monitoreo de minería ilegal en el Nanay

• Alerta satelital sobre dragas en Loreto

• MAAP: proliferación de minería ilegal en Loreto

Además de los casos críticos, existen territorios donde la presión minera aumenta y preocupa. El Parque Nacional Yaguas, en Loreto, es un área amazónica vulnerable a la minería aurífera aluvial. Informes oficiales incluyen a Yaguas como un territorio afectado por minería ilegal.

• Informe SERNANP sobre minería ilegal en áreas protegidas

En Junín, el Área de Conservación Regional Huaytapallana enfrenta la misma presión en zonas cercanas al ecosistema glaciar. El Gobierno Regional de Junín anunció que pedirá al Ministerio de Energía y Minas la exclusión de ocho registros mineros (Reinfo) sobre la microcuenca del río Yurayacu. Preocupación los posibles impactos a las fuentes de agua que abastecen al valle del Mantaro.

• Junín: pedirán sacar del Reinfo a mineras en Huaytapallana

Se sabe que la expansión de la minería ilegal ya alcanza a áreas naturales protegidas y zonas de amortiguamiento en distintas regiones, y que amenaza bosques y ríos, territorios indígenas y valiosos ecosistemas del Perú. Sin embargo, las autoridades hacen poco para enfrentarla.', resumen_corto = 'La expansión de esta actividad en Arequipa, Huánuco, Loreto, Junín y Ucayali amenaza fuentes de agua, bosques, territorios indígenas, etc. Desde Cotahuasi hasta el Nanay, la extracción ilegal de oro no se detiene.'
WHERE titulo = 'Más reservas, cuencas y zonas protegidas afectadas por la minería ilegal' AND fecha_publicacion = '2026-07-07';

UPDATE reportajes SET desarrollo = 'El próximo gobierno tendrá poco margen para postergar decisiones sobre la minería ilegal. Para el Observatorio de Minería Ilegal (OMI), los primeros cien días del nuevo gobierno, el de Keiko Fujimori, serán decisivos para detener una actividad que, según esa institución, es la principal economía ilícita, porque mueve alrededor de 11 500 millones de dólares al año.

El especialista del OMI, César Ipenza, dijo anteriormente que el nuevo gobierno deberá asumir que la minería ilegal ya no es solo un problema ambiental, sino que financia otras actividades criminales y genera violencia.

La principal recomendación es poner fin al Registro Integral de Formalización Minera (Reinfo). Según el OMI, este mecanismo, creado para facilitar la formalización de pequeños productores, se convirtió en instrumento de miles de mineros para continuar extrayendo oro sin cumplir exigencias ambientales ni legales. Por eso el nuevo gobierno debe establecer un régimen transitorio que conduzca al cierre definitivo del registro.

Otra prioridad consiste en eliminar el blindaje legal que hoy beneficia a quienes operan bajo el Reinfo. El año pasado, el Tribunal Constitucional recomendó retirar la exención de responsabilidad penal para los mineros inscritos en ese registro, pero esa recomendación no fue implementada. El Observatorio sostiene que el próximo gobierno debe establecer responsabilidades penales y civiles para quienes continúen explotando minerales en zonas prohibidas o incumplan las normas ambientales.

Las propuestas también apuntan a fortalecer las instituciones encargadas de combatir la minería ilegal. El OMI advierte que la Fiscalía carece de presupuesto para ejecutar operativos de interdicción en territorios dominados por organizaciones criminales. Sin recursos, sostiene, cualquier estrategia contra estas redes resulta insuficiente.

Asimismo, plantea reforzar los mecanismos anticorrupción dentro del Ministerio de Energía y Minas (Minem), especialmente en la Dirección General de Formalización Minera, que arrastra denuncias por presuntas irregularidades en la tramitación de expedientes. Hace poco el Minem aprobó su nueva Política Antisoborno mediante la Resolución Ministerial N. ° 232-2026, la que debería ser reforzada por el nuevo gobierno.

El OMI también propone aprobar una ley que elimine poco a poco el uso del mercurio hasta prohibirlo por completo en 2030. Y recomienda poner en funcionamiento el Sistema Interoperable de la Pequeña Minería y Minería Artesanal para mejorar la trazabilidad del oro y dificultar la comercialización de minerales de origen ilegal.

Otra medida plantea prohibir mediante decreto supremo la actividad minera en los ríos amazónicos, donde la extracción aurífera provocado una grave contaminación ambiental.

Sin duda, el gran reto del próximo gobierno será contener el avance de la minería ilegal antes de que siga consolidándose como una de las principales amenazas para la seguridad, la gobernabilidad y el ambiente en el país. Las medidas están identificadas y la urgencia es evidente.', resumen_corto = 'El Observatorio de Minería Ilegal señala que el desafío es contener esta economía ilícita. Plantea cerrar el Reinfo, fortalecer la persecución penal, eliminar el uso del mercurio, financiar una estrategia contra las mafias, etc.'
WHERE titulo = 'Medidas que el nuevo gobierno debe tomar para frenar la minería ilegal' AND fecha_publicacion = '2026-07-24';

UPDATE reportajes SET desarrollo = 'Para el director de la Dirección General de Políticas e Instrumentos de Gestión del Ministerio del Ambiente (Minam), Yury Pinto, la minería ilegal es una de las principales amenazas en el país, porque destruye bosques y ecosistemas, y arriesga el acceso de agua de millones de familias.

De esa minería ilícita que contamina los ríos con mercurio se habló en el Foro del Agua, realizado como parte de PERUMIN 37. Pinto señaló que solo en las últimas dos décadas se vertieron más de 3 000 toneladas de este metal pesado en cuerpos de agua.

“El daño es tal que no se puede hablar de formalización cuando se trata de operaciones en cabeceras de cuenca o fuentes hídricas, donde la minería está prohibida por ley. La minería ilegal disfrazada de informalidad es una amenaza directa para la sostenibilidad del país”, expuso Pinto.

Eso coincide con lo señalado por la lideresa indígena Teresita Irene Antazú López, del pueblo Yanesha, quien advirtió que los habitantes de las comunidades de Madre de Dios tienen que caminar una hora para encontrar agua limpia, porque los ríos están contaminados con mercurio. “Los mineros ilegales envenenan el agua y los peces. La gente ya no puede bañarse, porque la piel se les llena de ronchas”, contó Teresita en un seminario de hace tres semanas. En ese evento también se señaló que alrededor de cuatro millones de personas podrían ver comprometido su acceso al agua.

Y si de bosques destruidos hablamos, Pinto recordó que hasta 2014 se habían perdido alrededor de 100 mil hectáreas a causa de las actividades de minería ilegal. Sus efectos —dijo— son irreversibles cuando se contamina el agua y se destruye la Amazonía, pero además afectan directamente a la agricultura, la pesca y la biodiversidad.

La postura del funcionario se contrapone, por lo menos en el discurso, a las propuestas del predictamen de la nueva Ley de Pequeña Minería y Minería Artesanal (MAPE) del Congreso. Algunos artículos de esta norma facilitarían la minería en cuerpos de agua. Para ser más precisos, si la ley se aprueba como está planteada permitirá, por ejemplo, la formalización de operaciones en yacimientos ubicados en cauces, terrazas o abanicos aluviales; operaciones de minería aluvial o extracción de materiales acumulados en álveos o cauces de ríos; además de la posibilidad de formalizar actividades en zonas de amortiguamiento de Áreas Naturales Protegidas.

Pinto también señaló que el Gobierno aprobó una estrategia nacional contra la minería ilegal, con seis objetivos prioritarios: fortalecer la fiscalización, reducir la comercialización de minerales de origen ilícito, mejorar la coordinación institucional y sancionar al crimen organizado que se beneficia de esta actividad.

La minería ilegal, además de ser una amenaza ambiental, también atenta contra la salud pública porque compromete el acceso al agua de miles de peruanos. Mientras se discuten normas que podrían abrirle más espacio a esta actividad ilícita, expertos y líderes indígenas coinciden en que no se puede hablar de formalización donde hay destrucción.', resumen_corto = 'Esta actividad envenena afluentes con mercurio, destruye bosques y pone en riesgo el acceso al agua de millones de personas, mientras el Congreso trabaja en una ley que podría facilitar estas actividades.'
WHERE titulo = 'Minería ilegal contamina ríos y deja sin agua a millones de familias' AND fecha_publicacion = '2025-10-09';

UPDATE reportajes SET desarrollo = 'Ha pasado una semana desde que Keiko Fujimori asumió la presidencia del Perú, el 28 de julio de 2026, y ninguna de las siete medidas urgentes que el Observatorio de Minería Ilegal (OMI) planteó para los primeros 100 días de gobierno ha sido anunciada todavía. Para el OMI, la minería ilegal es hoy la principal economía ilícita del país: mueve alrededor de 11,500 millones de dólares al año, una cifra que supera al narcotráfico.

La ausencia más notoria es la del Registro Integral de Formalización Minera (Reinfo), la principal recomendación del Observatorio. El registro estará vigente hasta el 31 de diciembre de este año, según la Ley N.° 32537, aprobada meses antes del cambio de gobierno, y el mensaje presidencial del 28 de julio no hizo ninguna mención al proceso de formalización minera. El economista Luis Miguel Castilla, exministro de Economía y Finanzas y actual director ejecutivo de Videnza Instituto, señaló esta omisión en una entrevista reciente: «No hubo ninguna mención a la minería formal del país […] tampoco hubo ninguna mención a un problema que es serísimo: los esfuerzos por formalizar a la pequeña minería […] es un tema que fue obviado completamente».

En su primer mensaje a la Nación, la presidenta mencionó la minería ilegal en tres ocasiones, junto al crimen organizado y el narcotráfico, y con un enfoque centrado en el uso de la fuerza: durante los estados de emergencia, anunció, las Fuerzas Armadas asumirán temporalmente el liderazgo de las operaciones de seguridad hasta «restablecer plenamente la autoridad del Estado y devolver esos territorios a los ciudadanos». El discurso no incluyó anuncios sobre las reformas institucionales específicas que plantea el OMI. A continuación, el balance medida por medida:

Esto se relaciona con el aumento de oro exportado sin que se precise su origen. Según el Instituto Peruano de Economía (IPE), más del 40 % del oro vendido por canales formales al extranjero no tiene un origen conocido. Se trata de más de 100 toneladas vendidas, gracias a las plantas de procesamiento y a los mineros con Reinfo.

Fuente: Observatorio de Minería Ilegal (OMI). Elaboración: Diálogo y Desarrollo Perú.

Uno de los puntos que merece seguimiento es la Dirección General de Formalización Minera del Ministerio de Energía y Minas (Minem), que el OMI identifica como un foco de denuncias por irregularidades. El nuevo titular del sector, Guillermo Shinno, declaró en su hoja de vida veinte investigaciones fiscales y procesos judiciales, entre ellos un caso archivado por presunto delito de minería ilegal y una investigación en trámite por presunta contaminación ambiental. El Minem aprobó meses atrás una Política Antisoborno (Resolución Ministerial N.° 232-2026) que, según el Observatorio, la nueva gestión debería reforzar.

En el frente ambiental, la recomendación del Observatorio se centra en eliminar el uso del mercurio hasta 2030, el insumo más asociado a la amalgama artesanal de oro. Pero la minería ilegal también recurre al cianuro en procesos de lixiviación, y especialistas y el propio Ministerio del Ambiente han advertido que su uso es igual o más extendido que el del mercurio —una brecha que la medida del Observatorio, centrada solo en el mercurio, no contempla. De hecho, la Sunat ya aprobó, antes de la transición de gobierno, un nuevo régimen de control de insumos químicos que trata ambos por igual: incluye mercurio y cianuro, con entrada en vigencia prevista para el 1 de setiembre. El mismo criterio de protección que el Observatorio plantea para los ríos amazónicos —una de las zonas más afectadas por la contaminación minera— es extensible a otras cuencas y áreas naturales protegidas del país donde la minería ilegal también avanza.

El propio Observatorio ha insistido en que los primeros 100 días de gestión serán determinantes para frenar el avance de la minería ilegal. De esos 100 días han transcurrido siete. El reto no es solo nombrar el problema, sino traducirlo en medidas concretas: un régimen de cierre para el Reinfo, presupuesto para la interdicción y un marco de trazabilidad que permita distinguir, a lo largo de toda la cadena, el oro formal del ilegal.', resumen_corto = 'El Observatorio de Minería Ilegal planteó siete medidas urgentes para los primeros 100 días de gestión. A una semana de la investidura, ninguna ha sido anunciada por el Ejecutivo.'
WHERE titulo = 'Minería ilegal: la brecha sigue abierta a una semana del nuevo gobierno' AND fecha_publicacion = '2026-08-05';

UPDATE reportajes SET desarrollo = 'El presidente del Consejo de Ministros, Ernesto Álvarez, advirtió que grupos de mineros ilegales invadieron concesiones mineras en regiones como Cajamarca y Apurímac, donde empezaron a extraer minerales sin autorización ni mucho menos medidas preventivas ante el impacto de esta actividad.
 En esa situación se encuentran el proyecto minero Minas Conga, de Newmont Corporation, paralizado en Cajamarca desde hace diez años; el proyecto Haquira, de First Quantum Minerals, en la región Apurímac; y la mina Las Bambas, operada por MMG, también en Apurímac.
 Según el jefe del Gabinete, esta situación ocurre por la paralización de proyectos de minería formal que si cumplen con los estándares ambientales. “Cuando no se desarrolla la minería legal que cumple con altos estándares, se cede el espacio a la minería ilegal, que contamina y utiliza la violencia”, afirmó Álvarez.
 Conga es un proyecto de oro valorizado en alrededor de 4 800 millones de dólares, cuenta con los permisos ambientales desde 2010 y está paralizado desde ese mismo año.
 Según la agencia Bloomberg, Conga quedó vulnerable a la ocupación y extracción ilegal de material aurífero. Esta invasión implica consecuencias muy graves: la actividad no se puede controlar ni fiscalizar, no se pueden cobrar impuestos y no existe control ambiental. De acuerdo con Álvarez, los ríos que nacen en el área de este proyecto minero en Cajamarca están siendo contaminados con mercurio por las labores de la minería ilegal.
 Mientras tanto, el Ejecutivo cuenta con 60 días de facultades legislativas para reforzar el marco penal y procesal orientado a combatir la minería ilegal. Con estas facultades, podría actualizar sanciones e incorporar nuevas figuras delictivas vinculadas a la minería ilegal. Es preciso que Gobierno busque fortalecer la capacidad del Estado para enfrentar economías ilícitas asociadas a la extracción ilegal de minerales, debido a su vínculo con redes de crimen organizado y otras actividades delictivas.', resumen_corto = 'La paralización de proyectos mineros formales habría abierto el camino a la ocupación ilegal de concesiones en Cajamarca y Apurímac, con graves impactos ambientales y la expansión de la extracción clandestina de oro.'
WHERE titulo = 'Mineros ilegales invaden concesiones mineras formales en regiones' AND fecha_publicacion = '2025-12-17';

UPDATE reportajes SET desarrollo = 'En cinco distritos con presencia de minería ilegal e informal ocurren las mayores tasas de homicidios en el país. De estos, tres distritos, donde ocurrieron masacres de mineros o asesinatos de líderes indígenas, ocupan los primeros lugares, según un análisis del Instituto Peruano de Economía (IPE).

En 2025, la provincia de Pataz, en La Libertad, registró la tasa más alta de crímenes, muy por encima del promedio nacional, con 294 asesinatos por cada 100 000 habitantes; el distrito de Ananea, en Puno, donde se encuentra La Rinconada, se contabilizaron 159 por cada 100 000; y en Inambari, en Madre de Dios, donde se ubica La Pampa, infierno de la minería ilegal, se registró 129 por cada 100 000.

En los puestos cuarto y quinto aparecen Bellavista, en Lima, y San Antonio, en Lima Provincias, con 93 y 53 homicidios por esa proporción de población. Estos distritos no son zonas mineras.

Luego, en el sexto lugar, se ubica el distrito minero de Puerto Inca, en Huánuco, con 54 homicidios. Un puesto más abajo, en el séptimo, está Zarumilla, en Tumbes, con 29 asesinatos. Esta no es zona minera. El que sigue es la ciudad de Madre de Dios, con una tasa de 49 homicidios por esa proporción poblacional.

Eso ocurre en un momento de expansión de estas actividades. Según el análisis econométrico de Videnza Instituto, en el país existen 221 distritos donde la población convive con minería informal. En estos territorios, esta coexistencia se asocia con una alta presencia de mineros inscritos en el Reinfo, prácticas extractivas que incumplen normas ambientales, laborales y tributarias, y frecuentes conflictos por la superposición de derechos mineros.

La Rinconada y Pataz
A estos problemas se suma la violencia extrema, como en La Rinconada (Puno) y en Pataz (La Libertad). En el primer caso, en los últimos años ocurren disputas por oro y crímenes; y muertes en túneles. Se sabe que, entre 2009 y 2024, la Fiscalía de Puno recibió más de 1 000 denuncias por homicidio en todas sus formas en San Antonio de Putina, donde se encuentra La Rinconada. Se trata de homicidios a sangre fría o con ferocidad, cometidos con armas y explosivos. La víctimas suelen ser mineros, ciudadanos de a pie y policías.

Hubo tres años en que se registraron más homicidios: en 2012 fueron 92; en 2014, 107; y en 2018, 80. Pero cada año, la cifra no baja de 30 asesinatos en esta localidad del Altiplano. Además, en ese mismo periodo, las denuncias por lesiones graves, leves, culposas, peligro inminente y daño físico o psicológico, suman 892.

Desde 2011 hasta 2024, la Fiscalía de Puno también abrió 706 expedientes relacionados con minería ilegal. Denuncias por extracción de oro, contaminación de ríos, tráfico de maquinaria, obstrucción a la fiscalización y peligros para la vida. Sin embargo, de esos casos, solo 16 terminaron en sentencia hasta finales del año pasado.

En Pataz, la sangre y la muerte son pan de cada día. El 26 de abril de 2025, 13 trabajadores de la compañía minera Poderosa fueron secuestrados y ejecutados en un socavón. Una banda criminal que peleaba por el control del oro cometió esa masacre que conmocionó al país. Un video de setenta y tres segundos grabó cómo cada minero era ultimado.

Y la mañana del 1 de enero pasado, se conoció que tres personas fueron asesinadas en un enfrentamiento en una bocamina. Sus cuerpos tenían impactos de bala y fueron encontrados en la mina Papagayo, en el sector conocido como Morena. Todo ocurrió en pleno estado de emergencia declarado por el Estado para enfrentar a las bandas ligadas a la minería ilegal de oro.

Siete años bastaron para que estos lugares invadidos por mineros ilegales e informales se conviertan en centros de la muerte. En Pataz, de acuerdo con cifras del IPE, la tasa de homicidios se ha multiplicado por 32 desde 2021; en Ananea e Inambari aumentó en nueve y tres veces, respectivamente, respecto a los registros de 2019.

Uso de explosivos
No solo eso. Las bandas criminales obtienen explosivos de la minería ilegal e informal de Pataz y las usan para atentados en contra de pequeños y medianos empresarios en Trujillo, capital de La Libertad. Varios empresarios han decidido dejar esa ciudad por temor a las organizaciones criminales. Aunque es difícil cuantificar cuántos negocios han cerrado o trasladado sus operaciones, el temor ha crecido tanto como el retiro del mercado local.

En La Libertad, de acuerdo con el Observatorio Regional de Seguridad Ciudadana, se produjeron 7 253 denuncias en los últimos dos años. Según esas cifras, en el 2024 se reportaron 3 997 denuncias por extorsión y, en 2025, 3 256.

La violencia iniciada en Pataz, según Ángel Santoyo Iñoñán, exintegrante de la Unidad de Desactivación de Explosivos (UDEX), se expandió a ciudades como Trujillo, donde usan explosivos mineros para atentados extorsivos.

Homicidios y Reinfo
También es posible, como señala el IPE, relacionar el aumento del crimen con la concentración del número de mineros con Registro Integral de Formalización Minera (Reinfo) en esos territorios. La excepción por ahora es Arequipa que cuenta con 2 986 Reinfo. En Ananea se contabilizaron 2 653 registros otorgados; en Inambari, 2 318; y en Madre de Dios, con 2 186. “La evidencia muestra”, según el IPE, “que extender el Reinfo sin acciones efectivas no reduce el problema”. Agrega que “la ampliación de la vigencia del Reinfo solo prolonga el problema”.', resumen_corto = 'El avance de la minería ilegal e informal se refleja en inseguridad ciudadana. Un estudio del IPE confirma que el índice de asesinatos aumentó hasta 32 veces en zonas como Pataz, Ananea o Madre de Dios, donde se abren socavones o se controlan ríos para extraer oro de manera ilícita.'
WHERE titulo = 'Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal' AND fecha_publicacion = '2026-01-30';

UPDATE reportajes SET desarrollo = 'Especialistas, autoridades y líderes indígenas coincidieron en un punto: la nueva Ley de Minería Artesanal y de Pequeña Minería (Ley MAPE) no puede seguir siendo un salvavidas para la ilegalidad. La norma debe ser una herramienta para ordenar la actividad y cerrar definitivamente el paso a quienes contaminan ríos y operan al margen de la ley.

Ese fue el consenso en el seminario “Hacia una ley de la minería pequeña y artesanal que contribuya al desarrollo sostenible del país”, organizado por el Colegio de Abogados de Lima.

Lo artesanal y lo ilegal
César Ipenza Peralta y Karina Cecilia Garay Tapia, del Observatorio de Minería Ilegal (OMI), presentaron diez propuestas entregadas a la Comisión de Energía y Minas del Congreso. La primera: diferenciar con claridad al minero artesanal del informal y del ilegal.

Garay Tapia explicó que esta actividad tiene dos caras: por un lado, es sustento y dinamiza economías locales; por el otro, deja impactos sociales, ambientales y legales. “Cada semana, en las zonas donde se practica, aumentan los índices de criminalidad y de deforestación”, advirtió.

También cuestionó lo fácil que resulta operar sin cumplir requisitos. “Un minero que quiere formalizarse solo necesita inscribirse en el Reinfo y ya puede empezar a trabajar. En cambio, si uno quiere abrir una simple tienda, la municipalidad exige permisos y no deja abrir hasta que se cumplan. Con la minería no pasa lo mismo. Necesitamos orden y reglas claras”, dijo.

Las plantas procesadoras
Para Ipenza, el control debe concentrarse en las plantas de beneficio, donde se procesa el mineral. Si no se fiscalizan, es imposible rastrear el origen del oro o frenar el uso de químicos peligrosos. Se debe involucrar a la SUNAT y a la Unidad de Inteligencia Financiera (UIF) en ese trabajo.

El viceministro de Energía y Minas, Henry Luna, también puso la lupa sobre estas empresas. Varias figuran entre los principales productores nacionales sin tener minas propias, como Beta Dorada (octavo productor nacional), Paltarumi (décimo lugar en solo un año de operaciones), Laitaruma, Caravelí o Paraíso. “¿De dónde sacan el mineral? ¿Lo compran de manera lícita?”, preguntó, pese a que el Estado debería tener las respuestas.

Angela Grossheim, de la Sociedad Nacional de Minería, Petróleo y Energía, insistió en que se debe garantizar la trazabilidad no solo del mineral, sino también de la maquinaria, los combustibles, los insumos químicos y los explosivos que alimentan la minería ilegal. Criticó, además, que se haya reducido el presupuesto para enfrentar esta actividad ilícita. “La nueva ley debe estar pensada para la pequeña minería, no para encubrir a la ilegalidad”, dijo.

Territorios intocables
El OMI también propuso que la Ley MAPE declare zonas intangibles: áreas naturales protegidas, ríos, territorios indígenas y sitios arqueológicos. Esos lugares deben ser intocables. El oro no puede valer más que el agua o la vida, señaló Ipenza.

La lideresa indígena Teresita Irene Antazú López, del pueblo Yanesha, dio testimonio de lo que ocurre en Madre de Dios. Contó que las comunidades deben caminar una hora para encontrar agua limpia, mientras los ríos están contaminados con mercurio. “Los mineros ilegales envenenan el agua y los peces. La gente ya no puede bañarse porque la piel se les llena de ronchas”, denunció.

Juvenal Silva, de la Sociedad Zoológica de Frankfurt, añadió este dato: la minería ilegal ya afecta a 48 comunidades indígenas en la Amazonía, una quinta parte del territorio nacional. “Lo que ayer era verde hoy es gris plomo”, dijo. Se deforestan miles de hectáreas y se contamina el agua de cuatro millones de personas.

El problema del Reinfo
Diana Carolina Gonzales Delgado, congresista de Avanza País, señaló que el Reinfo terminó siendo un refugio para la informalidad. Como resultado, se extraen minerales sin pagar impuestos, no se responde por los daños ambientales, se contrata mano de obra en condiciones precarias y se cometen delitos.

Recordó que, en octubre pasado, representantes de los mineros intentaron ampliar el Reinfo por cinco años más. Aunque su pedido no prosperó como querían, sí se amplió por seis meses más una prórroga de medio año que vence el 31 de diciembre de este año.', resumen_corto = 'La norma no puede ser un refugio para la informalidad ni un salvavidas para la ilegalidad. Expertos, autoridades y líderes indígenas plantean que la nueva ley asegure trazabilidad, fiscalización y zonas intocables para proteger la vida y el ambiente'
WHERE titulo = 'Nueva Ley MAPE debe frenar a la minería ilegal' AND fecha_publicacion = '2025-09-03';

UPDATE reportajes SET desarrollo = 'Episodios recientes ponen en evidencia un nuevo fenómeno ligado a la minería informal e ilegal. Integrantes de algunas comunidades salieron a impedir las acciones de interdicción que realizaban las autoridades contra estas actividades.

En la ribera del río Marañón, en el centro poblado Nueva Esperanza, distrito de Puños, provincia de Huamalíes (Huánuco), unas 50 personas trataron de frustrar un operativo policial. Atacaron a los agentes que participaban en el operativo "Impacto–2026", destinado a destruir un campamento clandestino y decomisar maquinaria y equipos. No muy lejos, en Hualgayoc (Cajamarca), otro operativo terminó con la liberación de siete detenidos que acababan de ser sentenciados a siete meses de prisión preventiva, luego de que unas 80 personas ingresaran a la comisaría para agredir a los efectivos y lograr su escape.

Mucho antes, la zoóloga y bióloga Juliane Koepcke denunció que mineros ilegales que operaban en la zona de amortiguamiento de la Reserva Comunal El Sira, a orillas del río Yuyapichis, en Huánuco, contaban con el respaldo de la comunidad Pampas Verdes. Según esa denuncia, los dirigentes cobraban hasta 30 mil soles para proteger estas actividades y filtraban información para evitar las interdicciones.

Dante Vera, especialista de V&C Analistas, y Edwin Guzmán, especialista de Labor para el Desarrollo, explican que este fenómeno responde a una combinación de factores económicos, sociales y legales.

Según Vera, el primer factor es el incremento del precio del cobre y del oro, que convirtió a la minería en una alternativa mucho más rentable que la agricultura. A ello se suma la crisis de la pequeña producción campesina, que, según afirma, ha sido abandonada por el Estado y ya no garantiza ingresos suficientes para las familias rurales.

Guzmán, por su parte, señala que el avance de la minería informal e ilegal está estrechamente ligado a la ausencia del Estado. Sostiene que la falta de servicios básicos de calidad y la falta de oportunidades económicas, sumado al alza del precio del oro y el cobre, esta actividad se convierte en una alternativa para las comunidades. Como el Estado no garantiza servicios ni genera condiciones de desarrollo donde existen recursos minerales, se facilita la expansión de esta actividad ilícita.

Por otro lado, las comunidades tienen necesidades que el Estado aún no atiende, y estas se convierten en expectativas depositadas sobre las empresas formales. Vera señala que se espera empleo permanente, la compra de productos locales y la ejecución de obras de desarrollo; demandas que difícilmente cualquier empresa privada, por su propia naturaleza, podría satisfacer por completo. Además, la realización de obras depende, en gran medida, de la gestión pública local, muchas veces marcada por la corrupción. "Muchas comunidades concluyeron que, si la agricultura ya no alcanza, debían explotar ellas mismas los recursos que existen bajo su territorio", explica.

A ello, Guzmán agrega que la falta de empleo y las persistentes brechas sociales llevan a parte de la población a incorporarse no solo a la extracción de minerales, sino también a las actividades económicas que se desarrollan a su alrededor. "Las comunidades ven en estas actividades una oportunidad para obtener ingresos y enfrentar necesidades que el Estado no ha resuelto", señala.

Para Vera, el problema se agravó con el uso del Registro Integral de Formalización Minera (Reinfo). Aunque explotar una concesión ajena es ilegal, quienes cuentan con un Reinfo gozan de una protección temporal que limita la persecución penal. "El Reinfo terminó siendo un escudo para muchos mineros que operan en concesiones de terceros. Por eso existe tanta presión para mantenerlo vigente".

Guzmán añade que este entorno también favorece otras actividades ilícitas, como el tráfico de explosivos, la trata de personas y diversas formas de violencia, que son toleradas porque generan ingresos inmediatos para estas poblaciones.

Falta presencia del Estado
Frente a este escenario, Vera plantea cerrar definitivamente el Reinfo, al que considera un mecanismo fracasado; elaborar un censo nacional de pequeños mineros y buscar nuevas fórmulas para hacer viable la formalización.

Pero también precisa que la lucha contra esta minería no puede concentrarse únicamente en quienes extraen el mineral. "El verdadero negocio está en los acopiadores, plantas procesadoras y empresas exportadoras. Si el Estado no interviene esa cadena, seguirá atacando solo al eslabón más débil del problema".

Por su parte, Guzmán plantea que el próximo gobierno impulse una estrategia integral de desarrollo para las zonas mineras y fortalezca la presencia del Estado con servicios de calidad y entidades de fiscalización que cumplan sus funciones.

Sostiene también que las comunidades deben asumir un papel activo y marcar distancia de las actividades ilícitas. A su juicio, la minería ilegal genera ingresos temporales, pero no construye desarrollo sostenible. "Son economías de enclave que extraen riqueza, dejan algunos beneficios momentáneos y, cuando el recurso se agota, abandonan territorios con graves pasivos ambientales y sociales".

Si el Estado mantiene su débil presencia, precisa Guzmán, el país enfrentará una pérdida creciente de gobernabilidad y podrían consolidarse "territorios liberados", donde predominen las economías ilegales y disminuya la capacidad estatal para ejercer autoridad.', resumen_corto = 'Casos recientes muestran cómo comuneros defienden actividades ilícitas. Especialistas señalan que este fenómeno combina crisis económica, expectativas incumplidas y vacíos en el proceso de formalización minera.'
WHERE titulo = 'Por qué algunas comunidades respaldan actividades de minería ilegal' AND fecha_publicacion = '2026-07-16';

UPDATE reportajes SET desarrollo = 'La Comisión de Energía y Minas del Congreso debatirá, el 17 de noviembre, la ampliación del Registro Integral de Formalización Minera (Reinfo), que, en el papel, vence el 31 de diciembre próximo. Se trata del dictamen que priorizó la iniciativa del legislador Roberto Sánchez para prolongar su vigencia hasta diciembre de 2027 e incluir, además, a 50 000 titulares que habían sido excluidos del proceso por no cumplir con los requisitos legales ni formales por más de un año.

Hay varias bancadas, afines a estos mineros, que esperan aprobar el dictamen. Con esta sería la quinta vez que el registro no se cierra, pese a su evidente fracaso. Cualquiera podría preguntar: ¿por qué oponerse a ampliar nuevamente el registro si es la única manera de impulsar la formalización minera?

La respuesta en sencilla: el Reinfo no funciona. En casi diez años apenas logró formalizar a 2 181 mineros (2,6 %) de 87 111 inscritos. En cambio, 65 101 (78 %) fueron suspendidos, según datos del Ministerio de Energía y Minas (Minem).

Hay otra razón. En la práctica, el Reinfo se ha convertido en un escudo para la minería ilegal. Obtener un registro es bastante fácil, incluso se puede comprar en redes sociales. Con ese papel en la mano, los mineros pasan por informales, aunque extraigan oro y otros minerales en ríos, bosques amazónicos, áreas naturales protegidas o sitios arqueológicos.

La Fiscalía Especializada en Materia Ambiental (Fema) y el Servicio Nacional de Áreas Naturales Protegidas (Sernanp) han detectado que estos mineros, amparados en el Reinfo, usan maquinaria e insumos químicos en zonas prohibidas. Lo hacen, por ejemplo, en la zona de amortiguamiento de las Líneas de Nasca; dentro de la Reserva Nacional Pampa Galeras Bárbara D’Achille, refugio de vicuñas; en la Reserva Natural de El Sira; o cerca de la Reserva Nacional del Manú, Tambopata y Amarakaeri y Huascarán.

Una tercera razón es que la minería ilegal, amparada en el REINFO, alimenta las extorsiones. En regiones donde predomina, los índices de criminalidad han crecido. Y una cuarta razón es que es la principal fuente lavado de activos. Según la Unidad de Inteligencia Financiera (UIF), entre 2015 y 2024, se reportaron más de 5 700 reportes de operaciones sospechosas (ROS) vinculadas a esta actividad, por un valor de 22 800 millones de dólares.

Por eso, para Karina Garay, vocera del Observatorio de Minería Ilegal (OMI), el Reinfo debería cerrarse. Darle más tiempo de vigencia solo fortalecerá a las organizaciones criminales y consolidará el fracaso. “Lo único que ha generado el Reinfo en más de dos décadas, además del desorden, es que la mayoría de los mineros incumplan los requisitos ambientales, sociales y laborales. Ha aumentado la criminalidad y ha favorecido a gremios que no quieren una minería adecuada ni un proceso real de formalización”, dijo.

Mantenerlo abierto, explicó Garay, significaría darles luz verde a operaciones sin control en los ríos, los bosques y las comunidades indígenas. “Y no vaya a ser que estén financiando a futuros candidatos a senadores y diputados… justamente para que los favorezcan con esta ley”, advirtió.', resumen_corto = 'Varias son las razones por las que el Congreso no tendría que prorrogar, por quinta vez, el registro: porque fracasó al formalizar a solo 2032 personas en casi diez años; porque blinda a quienes operan en ríos, áreas naturales protegidas y sitios arqueológicos, porque facilita el tráfico de explosivos usados en extorsiones, entre otros motivos.'
WHERE titulo = '¿Congresistas volverán a apostar por la minería ilegal?' AND fecha_publicacion = '2025-11-19';

UPDATE reportajes SET desarrollo = 'En Santiago de Chuco, los versos de Masa, el célebre poema de César Vallejo, parecen estar escritos para otra tragedia. Una donde la muerte ya no termina cuando se cierra un ataúd. Los muertos ocupan el centro de esta historia, pero aquí no hay una multitud intentando devolverles la vida. En Quiruvilca, un histórico distrito minero de Santiago de Chuco, ocurre exactamente lo contrario: quienes deberían descansar en paz ven cómo la tierra que los cobija vuelve a abrirse por la minería ilegal. A más de cuatro mil metros sobre el nivel del mar, los muertos volvieron a ser perturbados, pero esta vez por la codicia que desde hace décadas perfora las entrañas de los cerros y su suelo.

Entre lápidas agrietadas y coronas marchitas comenzaron a aparecer montículos de tierra removida. Eran mineros ilegales convencidos de que la riqueza escondida bajo la montaña también atravesaba el lugar donde descansaban los difuntos: el cementerio municipal. Hasta allí llegaron a buscar las vetas que alguna vez hicieron de este distrito uno de los centros mineros más importantes de La Libertad. Las imágenes registradas en 2018 mostraron un escenario impensable: un cementerio convertido en frente de explotación minera.

Paradójicamente, todo ocurre a pocos kilómetros de Santiago de Chuco, la provincia donde nació César Vallejo, el poeta que convirtió el dolor humano en una de las obras más universales de la literatura.

Tras el abandono de la mina, miles ocuparon los socavones.
Las excavaciones llegaron hasta el cementerio.

Suelo frágil
Mientras los socavones avanzan bajo la superficie, los pobladores sienten que Quiruvilca se desmorona lentamente. Las excavaciones en el cementerio fue la señal de que el pueblo había perdido uno de los últimos límites que todavía respetaba. El propio Gobierno Regional de La Libertad estimó en 2020 que más de tres mil personas realizaban actividades de minería ilegal en la zona.

Desde entonces, Quiruvilca parece vivir sobre una montaña perforada. Enormes excavaciones aparecen donde antes había chacras, laderas e incluso espacios públicos. Aunque no hay evidencia oficial que permita afirmar que todo el distrito se está hundiendo, sí existe preocupación por la proliferación de socavones y el deterioro progresivo del subsuelo asociado a décadas de actividad minera y al ingreso indiscriminado de operadores ilegales.

Las labores sin control remueven el suelo y agravan el drenaje ácido de relaveras sin remediar.

Derrame mortal al río Moche
Lo que sucede en Quiruvilca no termina en Quiruvilca. Desde las alturas continúa descendiendo otro enemigo invisible: los metales pesados que discurren hacia el río Shorey que, a su vez, alimenta al río Moche. El Moche atraviesa Otuzco, Santiago de Chuco y luego desciende hasta la provincia de Trujillo. Miles de agricultores dependen de esa cuenca. Por ello, la contaminación de la minería ilegal dejó de ser únicamente un problema local para convertirse en un asunto regional.

En 2018 la Autoridad Nacional del Agua declaró en emergencia un tramo de la cuenca. Diversos informes del Organismo de Evaluación y Fiscalización Ambiental (OEFA) y del Ministerio de Energía y Minas han documentado la presencia de sustancias tóxicas y la necesidad de ejecutar obras de remediación que aún no logran resolver definitivamente el problema. Las actividades locales más afectadas son la agricultura y el consumo humano.

El peligro se acrecienta aún más si se tiene en cuenta que actualmente se ha reportado la existencia de más de 400 labores mineras ilegales, estimándose que entre 3,000 y 5,000 personas se dedican a esta actividad que opera bajo una estructura que mezcla la precariedad técnica con la sofisticación delictiva. También se han reportado intentos de apoderarse de terrenos destinados a proyectos públicos, como un complejo deportivo en el barrio Bellavista. Además, la actividad financia a bandas criminales que brindan protección o "chalequeo" a los mineros, lo que ha derivado en una ola de asesinatos y asaltos.

Muchos operadores utilizan el Reinfo (Registro Integral de Formalización Minera) como una herramienta legal para evitar la fiscalización, operando bajo el rótulo de "minería artesanal" o “minería en proceso de formalización”, mientras utilizan maquinaria pesada e insumos industriales. La presión de operativos policiales en zonas como el cerro El Toro (Huamachuco) y Pataz ha provocado el traslado de mineros ilegales hacia Quiruvilca, exacerbando el conflicto por el control territorial. “Actualmente, hay una reacción de un grupo de ronderos que ha desalojado a algunos ilegales, pero este tipo de enfrentamientos va a traer muertos y heridos”, avizoró Montes.

Las aguas con metales pesados bajan por el río Shorey hasta la cuenca del río Moche.

Infierno bajo el suelo
Al operar sin medidas de seguridad ni equipos de protección, los mineros ilegales enfrentan accidentes constantes por derrumbes o inhalación de gases tóxicos. Se han reportado casos de muertes de menores de edad en estos socavones y se estima que la exposición constante a metales pesados reduce drásticamente la esperanza de vida de los trabajadores.

La disputa por el control de las tierras ricas en mineral ha generado un clima de terror. Solo en el último año se registraron más de 40 crímenes vinculados a estas rencillas. La presencia de bandas criminales, incluso extranjeras, ha superado en ocasiones la capacidad de respuesta de las autoridades locales.

La ambición por el mineral ha llevado incluso a la destrucción de vestigios históricos, como el Qhapaq Ñan (Camino Inca), que ha sido depredado en zonas aledañas por la minería ilegal.

Frente a este escenario, las autoridades han iniciado acciones de fuerza. En operativos recientes, la Fiscalía Especializada en Materia Ambiental (FEMA) y la Policía Nacional han logrado incautar maquinaria pesada, campamentos y mineral valorizado en más de 2 millones de soles. Asimismo, se han realizado diligencias de destrucción de campamentos ilegales en sectores como Shorey Bajo y la desarticulación de bandas como "Los Mineros Ilegales de Quiruvilca", a quienes se les halló abundante dinamita y material explosivo.

Quiruvilca ya combina minería ilegal, explosivos y redes criminales.
Control, formalización y remediación no pueden seguir esperando.

“Es zona liberada”
En opinión del expresidente de la Comisión de Energía y Minas del Gobierno Regional de La Libertad, Greco Quiroz Díaz, Quiruvilca es “el nuevo Pataz” y, a estas alturas, ya es una “zona liberada”. “En el 2020, advertimos que todas las organizaciones criminales que vienen operando en Pataz, debido al aumento de restricciones, iban a expandir su capital en nuevas inversiones delictivas, y así ocurrió. Su nuevo territorio ahora es Quiruvilca”, recordó.

El especialista lamentó que aquella vez no lo escucharan. “A las autoridades les presenté hasta un video, pero hay una evidente inacción, no le dieron la debida importancia y esto ya es inmanejable, más aún si tenemos en cuenta que los ilegales tienen grandes negocios en Trujillo, que es un lavadero de dinero, como locales nocturnos, restaurantes lujosos”, puntualizó.

Desde el 2020 a la fecha, la respuesta sigue siendo insuficiente para frenar una actividad que ya se ha enraizado en la economía y la geografía de la sierra liberteña. Hoy, al recorrer Quiruvilca se ve cómo los campamentos improvisados reemplazan a las operaciones formales. Y el cementerio, que alguna vez simbolizó el descanso definitivo de quienes dedicaron su vida a la mina, terminó convirtiéndose en una metáfora brutal de la crisis. Si en Masa la fuerza de todos logra vencer a la muerte, en Quiruvilca la sensación es la opuesta: la ausencia prolongada de una respuesta integral permitió que la degradación avanzara hasta alcanzar incluso el lugar reservado para quienes ya habían partido.

EL DATO
La Asociación de Mineros Formales de Quiruvilca solicitó la intervención urgente de la Superintendencia Nacional de Fiscalización Laboral (SUNAFIL) para garantizar la seguridad de los trabajadores mineros. El pronunciamiento se conoce luego de que ronderos de la comunidad de Barro Negro realizaran una protesta en el sector El Papelillo. De acuerdo con los dirigentes comunales, la medida responde a una larga preocupación por la presunta contaminación de los ríos que abastecen de agua a las actividades agrícolas y ganaderas de la zona, la cual atribuyen a operaciones mineras que consideran informales o ilegales. Según los propios manifestantes, durante la protesta fueron destruidos campamentos, maquinaria y accesos a labores mineras.

Contaminación, criminalidad y trabajo precario son las tres caras de una misma tragedia que hoy define a Quiruvilca. Los operativos policiales y las incautaciones, aunque necesarios, no bastan frente a una estructura que combina precariedad técnica con sofisticación criminal, y que ha encontrado en el Reinfo una fachada legal para operar impunemente. Sin una estrategia integral que articule a todos los actores responsables, la degradación seguirá avanzando hasta alcanzar cada rincón de Quiruvilca, incluido, como ya ocurrió, el descanso de sus muertos.', resumen_corto = 'Santiago de Chuco, la provincia liberteña que inspiró el universo andino de César Vallejo, enfrenta hoy otra tragedia: minería ilegal, aguas contaminadas, bandas criminales y un cementerio convertido en frente de explotación.', autor_id = (SELECT id FROM autores WHERE nombre = 'Yuri Castro')
WHERE titulo = 'Quiruvilca: el pueblo perforado por la minería ilegal' AND fecha_publicacion = '2026-08-18';

UPDATE reportajes SET desarrollo = 'En lo que va del 2025, los gobiernos regionales y municipales recibieron en sus cuentas 8 340 millones de soles por canon y regalías mineras, según el Ministerio de Energía y Minas (MEF). Áncash, Arequipa, Tacna, Moquegua, Ica y Apurímac fueron las más beneficiadas. En teoría, ese dinero debería traducirse en obras de agua, salud y educación. En la práctica, se evapora.

Un análisis del Instituto Peruano de Economía (IPE) muestra que, mientras más recursos reciben los gobiernos subnacionales, menos gastan. Una de las razones es que 65 % de municipalidades no tiene capacidad para formular proyectos. Otra es la alta rotación de funcionarios: los gerentes regionales duran, en promedio, apenas diez meses en sus cargos. Eso explica que, hasta agosto, solo cuatro de cada diez soles de canon y regalías se hayan invertido en obras. Solo cinco regiones gastaron más de la mitad de ese dinero, mientras que Áncash y Junín apena usaron un tercio de sus presupuestos, según cifras oficiales.

Y cuando se gasta, se gasta mal. En Yarabamba, un distrito de Arequipa, con apenas dos mil habitantes, se levantó un estadio con capacidad para el doble de su población, mientras los vecinos siguen abasteciéndose de agua en cisternas. No es un caso aislado: entre 2015 y 2024, se dejaron sin ejecutar 43 500 millones de soles de canon y regalías. Con ese dinero se habrían podido construir 553 Escuelas Bicentenario, 8 700 centros de salud de primer nivel o financiar programas sociales como Pensión 65 y Juntos.

Pero a la incapacidad de gasto y la corrupción se suma un problema mayor: la evasión tributaria de la minería ilegal. Según el Ministerio de Energía y Minas, solo en 2025 los gobiernos subnacionales dejarán de percibir 2 600 millones de soles por canon minero debido a que los operadores ilegales no pagan impuestos. Apurímac perderá 213 millones, Puno 460 millones, Arequipa 450 millones, Madre de Dios 240 millones, La Libertad 215 millones y Ayacucho 160 millones.

Eso quiere decir que las regiones están perdiendo recursos por partida doble. Primero, porque no logran gastar con eficiencia lo que reciben de la minería formal y lo desperdician en actos de corrupción. Segundo, porque dejan de percibir lo que debería ingresar si la actividad ilegal pagara impuestos. Son miles de millones que se pierden, mientras los ciudadanos esperan hospitales equipados, colegios seguros y carreteras transitables.', resumen_corto = 'Millones de soles llegan cada año a las regiones gracias a la minería formal, pero gran parte se desperdicia entre burocracia, corrupción y proyectos mal diseñados. Y, como si eso no bastara, otros miles de millones nunca llegan porque los mineros ilegales no pagan impuestos. Resultado: colegios inconclusos, hospitales vacíos y carreteras sin asfaltar.'
WHERE titulo = 'Regiones pierden canon y regalías por evasión tributaria de mineros ilegales y por la ineficiencia de las autoridades' AND fecha_publicacion = '2025-09-17';

UPDATE reportajes SET desarrollo = 'Los gobiernos regionales y locales recibieron un adelanto del canon minero de más de 1.900 millones de soles: 1.507 millones 345 mil 989 para las regiones y 403 millones 311 mil 420 para las municipalidades. Esta fuente de ingresos se origina del 50 % del Impuesto a la Renta pagado por las empresas mineras al Estado peruano. Este fondo debería servir para el desarrollo local, pero su distribución y uso no siempre son transparentes.

Martín Valencia, especialista del Instituto Peruano de Economía (IPE), explicó que el canon se calcula basado en las utilidades netas de las empresas mineras, un cálculo complejo que considera variables como el precio de los metales, la producción y los costos operativos. Esta fluctuación significa que estos ingresos pueden variar de un año a otro.

Según el especialista, la distribución del canon asigna el 10 % a los municipios distritales donde se extraen los recursos, el 25 % a las comunas provinciales donde están las operaciones, el 40 % a los demás municipios del departamento y el 25 % al gobierno regional.

No obstante, algunos gobiernos regionales, como el de Apurímac, no han recibido el adelanto de enero. La razón radica en saldos pendientes por deducir de años anteriores. En este punto, es necesario precisar que la entrega completa del canon depende de la regularización de impuestos que las grandes mineras realizan hasta abril. No se puede, entonces según el especialista, estimar en forma precisa y transparente los montos a transferir a las regiones y municipios beneficiarios, como se ha hecho en algunas regiones.

En Apurímac, por ejemplo, se ha generado expectativa sobre un posible ingreso récord de más de 1.000 millones de soles en canon para 2024. Sin embargo, según Martín Valencia, estas proyecciones deben tratarse con cautela, dado que esa cifra equivale al triple de lo que se recibió en 2022, año en que los precios de los minerales llegaron a niveles récord.

Destino del canon
La eficiencia en el uso de estos recursos ha sido cuestionada debido a la falta de capacidades administrativas locales y a la posible corrupción. Para Martín Valencia, el canon minero debe invertirse en proyectos que mejoren la calidad de vida de la población. Sin embargo, advierte que el esquema actual de distribución merece una revisión, ya que ha generado inconvenientes al no responder a las necesidades locales.

Valencia subraya la necesidad de una planificación del gasto público, porque muchos municipios carecen de capacidades técnicas para formular y ejecutar proyectos. Plantea que el gobierno nacional fortalezca esas capacidades, a través de un proceso de capacitación a los funcionarios que asegure el uso eficiente y transparente del dinero.', resumen_corto = 'Los gobiernos regionales percibieron, por adelanto de canon minero, la suma de 1.507 millones 345 mil 989 soles, y las municipalidades provinciales y distritales, 403 millones 311 mil 420 soles. Ese dinero, sin embargo, no suele ser usado para mejorar la calidad de vida de las poblaciones: no hay planificación, capacidades técnicas ni transparencia.'
WHERE titulo = 'Regiones y municipios recibieron casi 7,000 millones de soles de canon minero' AND fecha_publicacion = '2025-06-10';

UPDATE reportajes SET desarrollo = 'Ya han trasladado los seis buses solicitados por la empresa Sumac Ayllu San Antonio de Torontoy S.A.C., desde la zona de Hidroeléctrica hacia Puente Ruinas cumpliendo con el itinerario acordado

Asimismo, la empresa Consettur Machupicchu S.A.C. habría gestionado ya el traslado de siete buses desde Machupicchu hacia Pachar, proceso que se inició el domingo 26 de octubre, tras cumplir con los requisitos exigidos por el Servicio Nacional de Áreas Naturales Protegidas (SERNANP) y el Ministerio de Transportes y Comunicaciones (MTC).

Se espera que este proceso pueda continuar de manera fluida para beneficio de las familias que viven del turismo en la ciudadela Inca.', resumen_corto = 'La empresa PeruRail informó que ha cumplido con el traslado de los vehículos destinados a operar en la ruta Hiram Bingham, en el transporte en el entorno del Santuario Histórico de Machupicchu.'
WHERE titulo = 'Se suman más buses San Antonio de Torontoy en la ruta Hiram Bingham' AND fecha_publicacion = '2025-10-31';

UPDATE reportajes SET desarrollo = 'El Ministerio de Energía y Minas (Minem) dio de baja el registro de 50.565 mineros informales inscritos en el Registro Integral de Formalización Minera (Reinfo) porque llevaban más de un año suspendido sin avanzar en el proceso de formalización. Solo 31.560 pequeños mineros y mineros artesanales mantienen el registro vigente, dijo el ministro Jorge Montero Cornejo.

La Confederación Nacional de Pequeña Minería y Minería Artesanal del Perú (Confemin) cuestionó la medida. Aseguró el problema de la formalización no está en ellos, sino en las dificultades para cumplir con los requisitos legales, como la autorización de los propietarios de terrenos y concesiones.

Según sus voceros, esos terrenos, que califican como concesiones ociosas, pertenecen a las grandes empresas mineras. Sin embargo, las cifras oficiales del Minem contradicen esa versión. A enero de 2025, el 93,6 % de mineros del Reinfo, que se encuentran en concesiones vigentes, opera sobre derechos de terceros, pero el 72 % de estos lo hacen en concesiones otorgadas a pequeños mineros y mineros artesanales. Es decir, no es la gran minería la que impide la formalización, como sostiene la Confemin. Solo dos de cada diez mineros con Reinfo (27.5 %) están en concesiones de la gran y mediana minería.

Además, Máximo Gallo Quintana, director de la Dirección General de Formalización Minera, dijo que depuraron a aquellos mineros que no hicieron ningún esfuerzo para formalizarse. “Si una persona no trabaja hace cuatro años (con el Reinfo), quiere decir que está haciendo otra cosa… Se quedan solamente los mineros que están trabajando y quieren formalizarse”, dijo.

Actualmente, el 58 % del territorio peruano es concesionable y, de ese porcentaje, un 14,9 % está otorgado a la gran, mediana y pequeña minería, el 44% permanece libre y el 41 % restantes corresponde a zonas donde no se puede desarrollar minería. De otro lado, de todos los inscritos en el Reinfo, 33% se encuentran en territorio que no es una concesión vigente, y podrían solicitar su concesión minera sin problemas.', resumen_corto = 'El Minem canceló los registros de más de 50.000 mineros informales. La mayoría de los Reinfo, el 72%, explotan territorios concesionados a la pequeña minería y minería artesanal. Sin embargo, la Confemin culpa a la gran minería por trabar la formalización.'
WHERE titulo = 'Siete de cada diez mineros del Reinfo operan en concesiones de otros pequeños mineros' AND fecha_publicacion = '2025-07-10';

UPDATE reportajes SET desarrollo = 'El oro sale del país todos los días. Parte de ese flujo tiene documentos, permisos y trazabilidad. Otra parte sale con papeles inconsistentes, con origen dudoso o simplemente se “legaliza” en algún punto del camino.

Entre 2021 y agosto de 2025, la Superintendencia Nacional de Administración Tributaria (Sunat) incautó 797 kilos de oro de origen ilegal. En el mismo periodo, el volumen estimado que se exporta en un solo año supera las 100 toneladas.

Los 797 kilos representan apenas el 0,69 % del volumen que, según estimaciones del Instituto Peruano de Economía (IPE), se exporta ilegalmente en un año. Solo en 2025, los despachos por fuera de la ley alcanzarían entre 104.3 toneladas, valorizadas en alrededor de 11.500 millones de dólares.

Ese monto igualaría o incluso superaría a las exportaciones formales si no se aplican medidas de control más estrictas.

En el primer semestre de 2015, la Sunat intervino 68,6 kilos de oro valorizados en 53,5 millones de soles, que pretendían salir del país bajo el régimen de exportación definitiva.

La entidad informó que esa cifra representa un incremento de 20% respecto al mismo periodo del año anterior. La incautación se sustentó en la inexistencia o incongruencia de información que acreditara el origen legal del mineral.

Desde 2021, la fiscalía logró la incautación, mediante procesos de extinción de dominio, de los 797 kilos mencionados, valorizados en más de 202 millones de soles. Las autoridades sostienen que estas acciones reflejan un mayor combate contra la minería ilegal.

Sin embargo, el volumen interceptado contrasta con la magnitud de este negocio ilegal.

El IPE calcula que el 44 % del oro ilícito exportado desde Sudamérica proviene del Perú. En 2023, la minería ilegal concentró el 41 % de todas las economías ilegales del país.

Para 2025, este sector casi duplicó el tamaño del resto de actividades ilícitas combinadas, como el tráfico de personas, el tráfico ilícito de drogas, la tala ilegal o las extorsiones.

La minería de oro ilegal no opera como una actividad aislada. Existe una cadena logística, financiera y comercial que la facilita. Parte del mineral se “legaliza” en plantas de procesamiento o empresas dentro del país antes de cruzar fronteras. Ese proceso dificulta los controles posteriores en los países de destino y diluye responsabilidades.

Etapas del negocio
 Primero, la extracción en zonas donde muchas veces no existe autorización ambiental ni supervisión laboral. Luego, la compra por intermediarios que consolidan volúmenes y gestionan documentos. Después, el tránsito hacia plantas de procesamiento o exportadoras. En cada eslabón, el mineral puede mezclarse con producción formal.

La Sunat aplica controles bajo la Ley General de Aduanas y la Ley de Delitos Aduaneros. También trabaja con la Unidad de Inteligencia Financiera y utiliza estándares de la Organización Mundial de Aduanas para gestionar riesgos. Aun así, el volumen que logra detener representa una fracción mínima del total estimado.

El Registro Integral de Formalización Minera (Reinfo) aparece como uno de los puntos críticos en este problema. Según el IPE, al menos 13 mil registros se ubican en áreas naturales protegidas, zonas arqueológicas u otros espacios restringidos. Ese uso del registro permite que operaciones por fuera de la ley encuentren una cobertura administrativa temporal.

Mientras el negocio crece, el presupuesto destinado a la formalización minera se redujo en 60 % el este año. Las acciones de interdicción continúan concentrándose en operativos puntuales.

Expertos del IPE plantean reforzar la inteligencia criminal y financiera para identificar beneficiarios finales y cortar los flujos económicos.

El impacto fiscal
 Si el país exporta más de 100 toneladas de oro ilegal en un año y solo incauta menos de una tonelada en cuatro años y medio, el margen de acción resulta limitado frente a la dimensión del comercio.

La minería ilegal afecta la recaudación tributaria, distorsiona la competencia con la minería formal y genera presión sobre ecosistemas y comunidades. También alimenta redes que operan con violencia y financian otras actividades ilícitas.

Las autoridades sostienen que intensificarán el control sobre las exportaciones de minerales. La Sunat trabaja con el Ministerio Público y la Policía para proteger la economía formal. El desafío radica en cerrar la brecha entre el tamaño del negocio y la capacidad de fiscalización.

Hoy, la estadística central resume la realidad; menos del 1% del oro ilegal estimado logra ser incautado. El resto circula, se procesa y se exporta como parte de un flujo que mueve miles de millones de dólares cada año.', resumen_corto = 'Entre 2021 y agosto de 2025 se incautaron 797 kilos de oro ilegal. Solo en 2025 se habrían exportado entre 105 y 115 toneladas por fuera de la ley. La brecha expone la magnitud del negocio y las limitaciones del control estatal.'
WHERE titulo = 'Sunat incauta menos del 1% del oro ilegal que el Perú exporta en un año' AND fecha_publicacion = '2026-03-10';

UPDATE reportajes SET desarrollo = 'Las más de sesenta universidades públicas del país administran este año, en conjunto, casi S/900 millones provenientes del canon y sobrecanon, regalías, renta de aduanas y participaciones. No todo lo registrado bajo esas categorías es estrictamente “canon”, porque además incluye tanto las transferencias recibidas durante este año como los saldos de balance de años anteriores. Las universidades públicas reciben recursos provenientes de los impuestos y rentas generados por las actividades extractivas después del Gobierno nacional y los gobiernos regionales. Muchas veces, incluso, reciben más transferencias que las municipalidades.

De acuerdo con las cifras del Ministerio de Economía y Finanzas (MEF), la universidad que más recursos administra este año por canon y sobrecanon, regalías, renta de aduanas y participaciones es la Universidad Nacional de San Antonio Abad del Cusco (Unsaac), con más de S/119 millones. Le siguen la Universidad Nacional Jorge Basadre Grohmann de Tacna, con S/111 millones; la Universidad Nacional de San Agustín de Arequipa, con S/65 millones; la Universidad Nacional del Santa, con S/63 millones; la Universidad Nacional de Arte Diego Quispe Tito, con S/54 millones; y la Universidad Nacional Intercultural de Quillabamba, con S/49 millones. Estas dos últimas también tienen su sede en Cusco.

La Ley del Canon establece que ese dinero debe utilizarse en proyectos de investigación y producción de conocimiento; construcción y mejora de laboratorios, aulas y otros espacios de estudio; compra de herramientas modernas, tecnología y materiales de enseñanza y práctica.

A menos de cuatro meses del cierre del año fiscal, han invertido, en promedio, la mitad. Pero, más que cuánto gastan, resulta relevante revisar en qué invierten. Erick Chuquitapa Rojas, economista de la Red de Estudios para el Desarrollo (REDES) y especialista en análisis de políticas públicas, señaló que “una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si el laboratorio funciona, si los equipos realmente se utilizan, si existen investigadores y personal especializado y si esas inversiones terminan produciendo mejores condiciones para la formación, la investigación y la innovación”.

El destino del presupuesto varía entre una institución y otra. En la Unsaac, los recursos se destinan principalmente a mejorar infraestructura, equipar laboratorios y mejorar servicios en escuelas profesionales. Solo S/4 millones están destinados a investigaciones científicas. En la San Agustín de Arequipa, el gasto se concentra en mejorar la formación de pregrado y los servicios profesionales. En cambio, más de S/32 millones están destinados a investigaciones científicas. La Universidad del Santa sigue ese patrón, porque usa ese presupuesto en mejorar servicios e infraestructura, mientras que la investigación científica concentra más de S/31 millones.

Pero ¿por qué, pese a manejar recursos importantes, persisten las carencias de infraestructura, laboratorios y equipamiento? Porque, según Erick Chuquitapa, tener presupuesto no equivale a contar con infraestructura terminada, laboratorios en funcionamiento o equipos en uso. Entre tener recursos y el resultado final hay una cadena de procesos: desde formular inversiones y elaborar estudios y expedientes técnicos hasta hacer la obra, comprar equipos y ponerlos en funcionamiento.

Un estudio del Instituto de Estudios Peruanos (IPE) sobre universidades regionales —recordó el especialista— había advertido que el aumento de canon no estuvo acompañado de mejoras en las capacidades para investigar y gestionar recursos. “Que una universidad tenga recursos disponibles y mantenga, al mismo tiempo, brechas de infraestructura o equipamiento no constituye una contradicción. El dinero es indispensable, pero por sí solo no cierra una brecha; también se requiere capacidad de planificación, gestión, ejecución y operación posterior”, explicó Chuquitapa Rojas.

El especialista dijo que el principal cuello de botella parece estar en las inversiones y adquisición de activos, que exigen más preparación, contratación, ejecución y gestión técnica. Remarcó que “tampoco conviene caer en el extremo contrario. Alcanzar una ejecución de 90 % o 100 % no significa necesariamente que el gasto haya sido bueno”.

Más allá del monto transferido, el debate se centra en la capacidad de las universidades para gestionar estratégicamente los recursos que reciben. La actividad minera ya representa una fuente relevante de financiamiento para la educación superior pública, y todo indica que esos ingresos podrían seguir aumentando en los próximos años. En ese contexto, cerrar las brechas en infraestructura, investigación e innovación dependerá no solo de la disponibilidad de dinero, sino también de la capacidad institucional para ejecutarlo de manera eficiente y generar resultados concretos para estudiantes, docentes y regiones', resumen_corto = 'Las universidades estatales concentran recursos provenientes de actividades extractivas. Pero han invertido la mitad. Especialistas dicen que una evaluación completa debería ir más allá del porcentaje ejecutado y preguntarse si esas inversiones producen mejores condiciones en formación e investigación.'
WHERE titulo = 'Universidades públicas administran casi S/900 millones de canon, regalías y otros recursos determinados' AND fecha_publicacion = '2026-09-08';

UPDATE reportajes SET desarrollo = 'La región Áncash se consolidó en 2025 como la principal receptora de canon minero en el país, con más de S/ 3,100 millones transferidos a gobiernos regionales y municipales, según cifras oficiales del Ministerio de Economía y Finanzas (MEF). Sin embargo, pese a una ejecución superior al 90 %, la falta de detalle en los proyectos financiados mantiene abiertas las críticas sobre la transparencia y el impacto real de estas inversiones.

El Gobierno Regional de Áncash y las 166 municipalidades provinciales y distritales ejecutaron, en promedio, el 91 % de los recursos, dejando un saldo de más de S/ 270 millones sin utilizar. La mayor parte del gasto se concentró en infraestructura y construcción, con más de S/ 2,600 millones destinados a carreteras, sistemas de agua y saneamiento, electrificación rural, obras agrícolas y edificaciones educativas y médicas. Otros rubros incluyeron bienes y servicios (S/ 400 millones) y deuda pública (S/ 200 millones).

Sectores priorizados
Según el análisis de Videnza Instituto, los sectores más beneficiados fueron planeamiento y gestión (30 %), transporte (24 %), salud (12 %) y educación (9 %). En el ámbito municipal, el gasto se orientó principalmente al sector agropecuario (20 %), transporte (16 %), cultura y deporte (11 %) y planeamiento y gestión (17 %).

Aunque el MEF registra los montos ejecutados, no especifica las obras financiadas. Esta ausencia de información impide conocer con precisión qué proyectos se concretaron y cuál fue su impacto en la población. Esta situación generó cuestionamientos sobre la eficiencia del gasto y la capacidad de los gobiernos locales para transformar los recursos en mejoras en salud, educación y servicios básicos.

Desigual distribución
Más allá de la ejecución, el canon minero en Áncash enfrenta el problema de la inequidad en la asignación de recursos entre municipalidades. Distritos como San Marcos, en la provincia de Huari, recibieron en 2025 más de S/ 300 millones, convirtiéndose en uno de los municipios con mayores transferencias del país, gracias a su cercanía a los yacimientos de Antamina.

En contraste, distritos rurales como Huallanca (Bolognesi) y La Merced (Aija) apenas superaron el millón de soles y figuran entre los más pobres de la región, con servicios básicos precarios y limitada capacidad de inversión. Este contraste ha reavivado el debate sobre la necesidad de reformular el esquema de distribución del canon minero, de modo que los fondos no solo beneficien a las jurisdicciones productoras, sino que también se orienten a cerrar brechas sociales y territoriales en toda la región.

Balance crítico
Así, el 2025 registró una alta ejecución, pero baja especificidad. Áncash logró movilizar la mayor parte de los fondos, pero la concentración en infraestructura y compras, junto con la falta de transparencia, limita la evaluación de los beneficios sociales. Además, el saldo no ejecutado de más de S/ 270 millones refleja problemas de gestión y planificación que aún deben resolverse.

En esta región, persiste el reto de convertir los recursos del canon y las regalías mineras en bienestar tangible para la población, con mayor transparencia en la información y una inversión más consistente en sectores sensibles como salud y educación.', resumen_corto = 'En 2025, la región recibió más de S/ 3,100 millones y ejecutó más del 90 % de los recursos. Sin embargo, la falta de información sobre los proyectos financiados y la desigual distribución entre distritos reabren el debate sobre transparencia y cierre de brechas'
WHERE titulo = 'Uso de más de S/3,000 millones de canon minero no muestran impacto real en Áncash' AND fecha_publicacion = '2026-02-09';

-- En el sitio real dos entradas del listado apuntan al mismo articulo
-- (Nov 12 y Nov 19), asi que comparten texto.
UPDATE reportajes SET desarrollo = 'La Comisión de Energía y Minas del Congreso debatirá, el 17 de noviembre, la ampliación del Registro Integral de Formalización Minera (Reinfo), que, en el papel, vence el 31 de diciembre próximo. Se trata del dictamen que priorizó la iniciativa del legislador Roberto Sánchez para prolongar su vigencia hasta diciembre de 2027 e incluir, además, a 50 000 titulares que habían sido excluidos del proceso por no cumplir con los requisitos legales ni formales por más de un año.

Hay varias bancadas, afines a estos mineros, que esperan aprobar el dictamen. Con esta sería la quinta vez que el registro no se cierra, pese a su evidente fracaso. Cualquiera podría preguntar: ¿por qué oponerse a ampliar nuevamente el registro si es la única manera de impulsar la formalización minera?

La respuesta en sencilla: el Reinfo no funciona. En casi diez años apenas logró formalizar a 2 181 mineros (2,6 %) de 87 111 inscritos. En cambio, 65 101 (78 %) fueron suspendidos, según datos del Ministerio de Energía y Minas (Minem).

Hay otra razón. En la práctica, el Reinfo se ha convertido en un escudo para la minería ilegal. Obtener un registro es bastante fácil, incluso se puede comprar en redes sociales. Con ese papel en la mano, los mineros pasan por informales, aunque extraigan oro y otros minerales en ríos, bosques amazónicos, áreas naturales protegidas o sitios arqueológicos.

La Fiscalía Especializada en Materia Ambiental (Fema) y el Servicio Nacional de Áreas Naturales Protegidas (Sernanp) han detectado que estos mineros, amparados en el Reinfo, usan maquinaria e insumos químicos en zonas prohibidas. Lo hacen, por ejemplo, en la zona de amortiguamiento de las Líneas de Nasca; dentro de la Reserva Nacional Pampa Galeras Bárbara D’Achille, refugio de vicuñas; en la Reserva Natural de El Sira; o cerca de la Reserva Nacional del Manú, Tambopata y Amarakaeri y Huascarán.

Una tercera razón es que la minería ilegal, amparada en el REINFO, alimenta las extorsiones. En regiones donde predomina, los índices de criminalidad han crecido. Y una cuarta razón es que es la principal fuente lavado de activos. Según la Unidad de Inteligencia Financiera (UIF), entre 2015 y 2024, se reportaron más de 5 700 reportes de operaciones sospechosas (ROS) vinculadas a esta actividad, por un valor de 22 800 millones de dólares.

Por eso, para Karina Garay, vocera del Observatorio de Minería Ilegal (OMI), el Reinfo debería cerrarse. Darle más tiempo de vigencia solo fortalecerá a las organizaciones criminales y consolidará el fracaso. “Lo único que ha generado el Reinfo en más de dos décadas, además del desorden, es que la mayoría de los mineros incumplan los requisitos ambientales, sociales y laborales. Ha aumentado la criminalidad y ha favorecido a gremios que no quieren una minería adecuada ni un proceso real de formalización”, dijo.

Mantenerlo abierto, explicó Garay, significaría darles luz verde a operaciones sin control en los ríos, los bosques y las comunidades indígenas. “Y no vaya a ser que estén financiando a futuros candidatos a senadores y diputados… justamente para que los favorezcan con esta ley”, advirtió.', resumen_corto = 'Varias son las razones por las que el Congreso no tendría que prorrogar, por quinta vez, el registro: porque fracasó al formalizar a solo 2032 personas en casi diez años; porque blinda a quienes operan en ríos, áreas naturales protegidas y sitios arqueológicos, porque facilita el tráfico de explosivos usados en extorsiones, entre otros motivos.'
WHERE titulo = 'Por qué ampliar el Reinfo sería un error' AND fecha_publicacion = '2025-11-12';
