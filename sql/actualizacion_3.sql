-- Tercera tanda de datos reales: reportajes de las paginas 2 a 6 del
-- listado de Reportajes del sitio real (reportajes-2.html a
-- reportajes-6.html, enviados por el usuario).
--
-- Este contenido YA esta incluido en sql/datos_reales.sql, asi que si vas
-- a instalar la base de datos desde cero no necesitas correr este archivo,
-- solo schema.sql + datos_reales.sql.
--
-- Usa este archivo UNICAMENTE si ya tenias la base de datos cargada antes
-- de esta tanda (es decir, ya corriste datos_reales.sql o
-- actualizacion_2.sql en algun momento anterior) y quieres agregar estos
-- 55 reportajes sin reimportar todo de nuevo.

-- OJO: estas paginas solo traen el titulo, la fecha y el NOMBRE del
-- archivo de foto (ej. reportaje-02-07-26.jpg), pero no la foto en si
-- (eso no viaja en el codigo fuente de la pagina, es un archivo aparte
-- que el navegador pide por separado). Por eso foto_principal queda
-- NULL por ahora y se ve con la imagen de relleno. El nombre real que
-- deberia tener cada foto queda anotado al lado de cada INSERT: si
-- consigues la foto, solo hace falta subirla desde el panel
-- (Reportajes > editar), no hay que tocar la base de datos.

-- Dos titulos aparecen repetidos con distinta fecha/foto (08-04-26 y
-- 26-03-26 comparten titulo, igual que 30-01-26 y 26-01-26): asi esta
-- en el sitio real, no es un error de esta carga.

USE dyd;

-- foto real: reportaje-02-07-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Aportes mineros para las regiones y el gobierno central crecieron 62% en 2026', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-07-02', 0, NULL, 1);

-- foto real: reportaje-12-06-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon y regalías mineras sostienen el 70% del presupuesto de la región Moquegua y hasta el 90% en obras y proyectos', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-06-12', 0, NULL, 1);

-- foto real: reportaje-04-06-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('742 escolares de Taca y Raccaya reciben kits educativos', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-06-04', 0, NULL, 1);

-- foto real: reportaje-21-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Áreas naturales desprotegidas: al menos ocho son impactadas por la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-05-21', 0, NULL, 1);

-- foto real: reportaje-14-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Los peligros de trabajar en un socavón ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-05-14', 0, NULL, 1);

-- foto real: reportaje-08-05-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon y regalías mineras y gasíferas sostienen más del 70 % del presupuesto en Cusco', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-05-08', 0, NULL, 1);

-- foto real: reportaje-30-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('La violencia ligada a economías ilegales se expande por todo el Perú', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-04-30', 0, NULL, 1);

-- foto real: reportaje-24-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Bancada Reinfo: los nuevos aliados de la informalidad en el Congreso', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-04-24', 0, NULL, 1);

-- foto real: reportaje-21-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Alianza entre UGEL Melgar, Minsur y Enseña Perú impulsará aprendizajes en estudiantes de Nuñoa', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-04-21', 0, NULL, 1);

-- foto real: reportaje-20-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('19 jóvenes cajamarquinos se gradúan como técnicos gracias al programa INSPIRA de Minera La Granja y Cetemin', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-04-20', 0, NULL, 1);

-- foto real: reportaje-08-04-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-04-08', 0, NULL, 1);

-- foto real: reportaje-26-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-03-26', 0, NULL, 1);

-- foto real: reportaje-24-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Congreso acelera paquetazo a favor de mineros informales en plena campaña', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-03-24', 0, NULL, 1);

-- foto real: reportaje-18-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Empresas y regiones que concentran la producción minera en Perú', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-03-18', 0, NULL, 1);

-- foto real: reportaje-11-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Crisis del gas: vuelve el debate sobre la seguridad energética del país', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-03-11', 0, NULL, 1);

-- foto real: reportaje-10-03-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Sunat incauta menos del 1% del oro ilegal que el Perú exporta en un año', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-03-10', 0, NULL, 1);

-- foto real: reportaje-27-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Canon minero en La Libertad: mucho dinero ejecutado, pocas brechas cerradas', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-27', 0, NULL, 1);

-- foto real: reportaje-19-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El canon que Ica no logra convertir en obras', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-19', 0, NULL, 1);

-- foto real: reportaje-18-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('¿A qué se destinó el canon minero y gasífero en Cusco?', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-18', 0, NULL, 1);

-- foto real: reportaje-16-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El canon minero como motor de desarrollo social en 2025', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-16', 0, NULL, 1);

-- foto real: reportaje-13-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Arequipa destina 7 de cada 10 soles del canon minero a obras viales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-13', 0, NULL, 1);

-- foto real: reportaje-11-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno Regional de Apurímac invirtió el 89,7 % del canon minero y regalías transferidas en 2025', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-11', 0, NULL, 1);

-- foto real: reportaje-09-02-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Uso de más de S/3,000 millones de canon minero no muestran impacto real en Áncash', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-02-09', 0, NULL, 1);

-- foto real: reportaje-30-01-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-01-30', 0, NULL, 1);

-- foto real: reportaje-26-01-26.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2026-01-26', 0, NULL, 1);

-- foto real: reportaje-17-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Mineros ilegales invaden concesiones mineras formales en regiones', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-12-17', 0, NULL, 1);

-- foto real: reportaje-10-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Cómo se posicionan los partidos frente a los mineros informales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-12-10', 0, NULL, 1);

-- foto real: reportaje-03-12-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Candidatos serían financiados por mineros inscritos en el REINFO como en 2021', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-12-03', 0, NULL, 1);

-- foto real: reportaje-25-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno observaría ampliación del REINFO si no cumple ciertas condiciones', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-11-25', 0, NULL, 1);

-- foto real: reportaje-19-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('¿Congresistas volverán a apostar por la minería ilegal?', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-11-19', 0, NULL, 1);

-- foto real: reportaje-12ii-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Por qué ampliar el Reinfo sería un error', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-11-12', 0, NULL, 1);

-- foto real: reportaje-12-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('La minería ilegal habría lavado unos 22 mil millones de dólares', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-11-12', 0, NULL, 1);

-- foto real: reportaje-05-11-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Investigación revela rechazo ciudadano a minería ilegal o informal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-11-05', 0, NULL, 1);

-- foto real: reportaje-31-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Se suman más buses San Antonio de Torontoy en la ruta Hiram Bingham', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-10-31', 0, NULL, 1);

-- foto real: reportaje-29-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('CRESPO Cumple compromisos con comunidades de Arcata y Chucñihuaqui en el distrito de Cayarani', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-10-29', 0, NULL, 1);

-- foto real: reportaje-15-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Juliane Koepcke, única sobreviviente del accidente aéreo de 1971, denuncia que Minería Ilegal invade Reserva Comunal El Sira', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-10-15', 0, NULL, 1);

-- foto real: reportaje-09-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Minería ilegal contamina ríos y deja sin agua a millones de familias', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-10-09', 0, NULL, 1);

-- foto real: reportaje-01-10-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('SUNAT pone en la mira a las plantas de procesamiento de minerales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-10-01', 0, NULL, 1);

-- foto real: reportaje-24-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El oro ilegal iguala a la minería formal en exportaciones', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-09-24', 0, NULL, 1);

-- foto real: reportaje-17-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Regiones pierden canon y regalías por evasión tributaria de mineros ilegales y por la ineficiencia de las autoridades', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-09-17', 0, NULL, 1);

-- foto real: reportaje-10-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Los ríos y lagos que antes se defendieron con marchas, hoy son contaminados por mineros ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-09-10', 0, NULL, 1);

-- foto real: reportaje-03-09-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Nueva Ley MAPE debe frenar a la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-09-03', 0, NULL, 1);

-- foto real: reportaje-29-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Cinco de cada diez peruanos no votarían por un candidato defensor de la minería informal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-08-29', 0, NULL, 1);

-- foto real: reportaje-21-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Carga explosiva que destruyó viviendas en Trujillo es la misma que usa la minería ilegal en Pataz', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-08-21', 0, NULL, 1);

-- foto real: reportaje-11-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('El mercurio envenena bosques, ríos y personas', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-08-11', 0, NULL, 1);

-- foto real: reportaje-04-08-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobiernos regionales y locales perderán 2.600 millones a causa de mineros informales e ilegales', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-08-04', 0, NULL, 1);

-- foto real: reportaje-29-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Dina Boluarte calló sobre la minería informal e ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-07-29', 0, NULL, 1);

-- foto real: reportaje-10-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Siete de cada diez mineros del Reinfo operan en concesiones de otros pequeños mineros', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-07-10', 0, NULL, 1);

-- foto real: reportaje-08-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Ley MAPE amaneza cuidado de ríos, lagos y quebradas', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-07-08', 0, NULL, 1);

-- foto real: reportaje-07-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Colectivo PAS invoca a no ceder a las presiones para frenar combate a la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-07-07', 0, NULL, 1);

-- foto real: reportaje-04-07-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Crece riesgo de que mineros ilegales financien campañas en 2026', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-07-04', 0, NULL, 1);

-- foto real: reportaje-19-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Fiscalía advierte que mineros ilegales posiblemente financien a candidatos', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-19', 0, NULL, 1);

-- foto real: reportaje-18-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Colectivo PAS alerta sobre el avance de la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-18', 0, NULL, 1);

-- foto real: reportaje-10-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Regiones y municipios recibieron casi 7,000 millones de soles de canon minero', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-10', 0, NULL, 1);

-- foto real: reportaje-09-06-25.jpg
INSERT INTO reportajes (titulo, resumen_corto, desarrollo, foto_principal, fecha_publicacion, es_destacado, autor_id, usuario_id)
VALUES ('Gobierno no sabe cómo enfrentar la minería ilegal', NULL, '(Completar con el texto real del artículo desde el panel.)', NULL, '2025-06-09', 0, NULL, 1);
