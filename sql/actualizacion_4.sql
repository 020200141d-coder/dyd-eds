-- Enlaza las fotos reales de los reportajes, tomadas de las paginas
-- guardadas del sitio (reportajes-1.html a reportajes-6.html).
-- Los archivos van en admin/files/reportajes/.
--
-- Faltan 3 fotos que venian dañadas en el comprimido
-- (reportaje-05-08-26.jpg, reportaje-18-06-25.jpg, reportaje-19-06-25.jpg)
-- y las 5 portadas de boletines: esos reportajes se siguen viendo con
-- la imagen de relleno hasta que se suban desde el panel.

USE dyd;

UPDATE reportajes SET foto_principal = 'reportaje-30-07-26.jpg'
WHERE titulo = 'Así lavan el oro ilegal plantas procesadoras y mineros con Reinfo' AND fecha_publicacion = '2026-07-30';

UPDATE reportajes SET foto_principal = 'reportaje-24-07-26.jpg'
WHERE titulo = 'Medidas que el nuevo gobierno debe tomar para frenar la minería ilegal' AND fecha_publicacion = '2026-07-24';

UPDATE reportajes SET foto_principal = 'reportaje-16-07-26.jpg'
WHERE titulo = 'Por qué algunas comunidades respaldan actividades de minería ilegal' AND fecha_publicacion = '2026-07-16';

UPDATE reportajes SET foto_principal = 'reportaje-07-07-26.jpg'
WHERE titulo = 'Más reservas, cuencas y zonas protegidas afectadas por la minería ilegal' AND fecha_publicacion = '2026-07-07';

UPDATE reportajes SET foto_principal = 'reportaje-02-07-26.jpg'
WHERE titulo = 'Aportes mineros para las regiones y el gobierno central crecieron 62% en 2026' AND fecha_publicacion = '2026-07-02';

UPDATE reportajes SET foto_principal = 'reportaje-12-06-26.jpg'
WHERE titulo = 'Canon y regalías mineras sostienen el 70% del presupuesto de la región Moquegua y hasta el 90% en obras y proyectos' AND fecha_publicacion = '2026-06-12';

UPDATE reportajes SET foto_principal = 'reportaje-04-06-26.jpg'
WHERE titulo = '742 escolares de Taca y Raccaya reciben kits educativos' AND fecha_publicacion = '2026-06-04';

UPDATE reportajes SET foto_principal = 'reportaje-21-05-26.jpg'
WHERE titulo = 'Áreas naturales desprotegidas: al menos ocho son impactadas por la minería ilegal' AND fecha_publicacion = '2026-05-21';

UPDATE reportajes SET foto_principal = 'reportaje-14-05-26.jpg'
WHERE titulo = 'Los peligros de trabajar en un socavón ilegal' AND fecha_publicacion = '2026-05-14';

UPDATE reportajes SET foto_principal = 'reportaje-08-05-26.jpg'
WHERE titulo = 'Canon y regalías mineras y gasíferas sostienen más del 70 % del presupuesto en Cusco' AND fecha_publicacion = '2026-05-08';

UPDATE reportajes SET foto_principal = 'reportaje-30-04-26.jpg'
WHERE titulo = 'La violencia ligada a economías ilegales se expande por todo el Perú' AND fecha_publicacion = '2026-04-30';

UPDATE reportajes SET foto_principal = 'reportaje-24-04-26.jpg'
WHERE titulo = 'Bancada Reinfo: los nuevos aliados de la informalidad en el Congreso' AND fecha_publicacion = '2026-04-24';

UPDATE reportajes SET foto_principal = 'reportaje-21-04-26.jpg'
WHERE titulo = 'Alianza entre UGEL Melgar, Minsur y Enseña Perú impulsará aprendizajes en estudiantes de Nuñoa' AND fecha_publicacion = '2026-04-21';

UPDATE reportajes SET foto_principal = 'reportaje-20-04-26.jpg'
WHERE titulo = '19 jóvenes cajamarquinos se gradúan como técnicos gracias al programa INSPIRA de Minera La Granja y Cetemin' AND fecha_publicacion = '2026-04-20';

UPDATE reportajes SET foto_principal = 'reportaje-08-04-26.jpg'
WHERE titulo = 'Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales' AND fecha_publicacion = '2026-04-08';

UPDATE reportajes SET foto_principal = 'reportaje-26-03-26.jpg'
WHERE titulo = 'Elecciones 2026: solo 3 de cada 10 partidos se enfrentarían a mineros ilegales' AND fecha_publicacion = '2026-03-26';

UPDATE reportajes SET foto_principal = 'reportaje-24-03-26.jpg'
WHERE titulo = 'Congreso acelera paquetazo a favor de mineros informales en plena campaña' AND fecha_publicacion = '2026-03-24';

UPDATE reportajes SET foto_principal = 'reportaje-18-03-26.jpg'
WHERE titulo = 'Empresas y regiones que concentran la producción minera en Perú' AND fecha_publicacion = '2026-03-18';

UPDATE reportajes SET foto_principal = 'reportaje-11-03-26.jpg'
WHERE titulo = 'Crisis del gas: vuelve el debate sobre la seguridad energética del país' AND fecha_publicacion = '2026-03-11';

UPDATE reportajes SET foto_principal = 'reportaje-10-03-26.jpg'
WHERE titulo = 'Sunat incauta menos del 1% del oro ilegal que el Perú exporta en un año' AND fecha_publicacion = '2026-03-10';

UPDATE reportajes SET foto_principal = 'reportaje-27-02-26.jpg'
WHERE titulo = 'Canon minero en La Libertad: mucho dinero ejecutado, pocas brechas cerradas' AND fecha_publicacion = '2026-02-27';

UPDATE reportajes SET foto_principal = 'reportaje-19-02-26.jpg'
WHERE titulo = 'El canon que Ica no logra convertir en obras' AND fecha_publicacion = '2026-02-19';

UPDATE reportajes SET foto_principal = 'reportaje-18-02-26.jpg'
WHERE titulo = '¿A qué se destinó el canon minero y gasífero en Cusco?' AND fecha_publicacion = '2026-02-18';

UPDATE reportajes SET foto_principal = 'reportaje-16-02-26.jpg'
WHERE titulo = 'El canon minero como motor de desarrollo social en 2025' AND fecha_publicacion = '2026-02-16';

UPDATE reportajes SET foto_principal = 'reportaje-13-02-26.jpg'
WHERE titulo = 'Arequipa destina 7 de cada 10 soles del canon minero a obras viales' AND fecha_publicacion = '2026-02-13';

UPDATE reportajes SET foto_principal = 'reportaje-11-02-26.jpg'
WHERE titulo = 'Gobierno Regional de Apurímac invirtió el 89,7 % del canon minero y regalías transferidas en 2025' AND fecha_publicacion = '2026-02-11';

UPDATE reportajes SET foto_principal = 'reportaje-09-02-26.jpg'
WHERE titulo = 'Uso de más de S/3,000 millones de canon minero no muestran impacto real en Áncash' AND fecha_publicacion = '2026-02-09';

UPDATE reportajes SET foto_principal = 'reportaje-30-01-26.jpg'
WHERE titulo = 'Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal' AND fecha_publicacion = '2026-01-30';

UPDATE reportajes SET foto_principal = 'reportaje-26-01-26.jpg'
WHERE titulo = 'Esto proponen los candidatos a la presidencia para enfrentar la minería ilegal e informal' AND fecha_publicacion = '2026-01-26';

UPDATE reportajes SET foto_principal = 'reportaje-17-12-25.jpg'
WHERE titulo = 'Mineros ilegales invaden concesiones mineras formales en regiones' AND fecha_publicacion = '2025-12-17';

UPDATE reportajes SET foto_principal = 'reportaje-10-12-25.jpg'
WHERE titulo = 'Cómo se posicionan los partidos frente a los mineros informales' AND fecha_publicacion = '2025-12-10';

UPDATE reportajes SET foto_principal = 'reportaje-03-12-25.jpg'
WHERE titulo = 'Candidatos serían financiados por mineros inscritos en el REINFO como en 2021' AND fecha_publicacion = '2025-12-03';

UPDATE reportajes SET foto_principal = 'reportaje-25-11-25.jpg'
WHERE titulo = 'Gobierno observaría ampliación del REINFO si no cumple ciertas condiciones' AND fecha_publicacion = '2025-11-25';

UPDATE reportajes SET foto_principal = 'reportaje-19-11-25.jpg'
WHERE titulo = '¿Congresistas volverán a apostar por la minería ilegal?' AND fecha_publicacion = '2025-11-19';

UPDATE reportajes SET foto_principal = 'reportaje-12ii-11-25.jpg'
WHERE titulo = 'Por qué ampliar el Reinfo sería un error' AND fecha_publicacion = '2025-11-12';

UPDATE reportajes SET foto_principal = 'reportaje-12-11-25.jpg'
WHERE titulo = 'La minería ilegal habría lavado unos 22 mil millones de dólares' AND fecha_publicacion = '2025-11-12';

UPDATE reportajes SET foto_principal = 'reportaje-05-11-25.jpg'
WHERE titulo = 'Investigación revela rechazo ciudadano a minería ilegal o informal' AND fecha_publicacion = '2025-11-05';

UPDATE reportajes SET foto_principal = 'reportaje-31-10-25.jpg'
WHERE titulo = 'Se suman más buses San Antonio de Torontoy en la ruta Hiram Bingham' AND fecha_publicacion = '2025-10-31';

UPDATE reportajes SET foto_principal = 'reportaje-29-10-25.jpg'
WHERE titulo = 'CRESPO Cumple compromisos con comunidades de Arcata y Chucñihuaqui en el distrito de Cayarani' AND fecha_publicacion = '2025-10-29';

UPDATE reportajes SET foto_principal = 'reportaje-15-10-25.jpg'
WHERE titulo = 'Juliane Koepcke, única sobreviviente del accidente aéreo de 1971, denuncia que Minería Ilegal invade Reserva Comunal El Sira' AND fecha_publicacion = '2025-10-15';

UPDATE reportajes SET foto_principal = 'reportaje-09-10-25.jpg'
WHERE titulo = 'Minería ilegal contamina ríos y deja sin agua a millones de familias' AND fecha_publicacion = '2025-10-09';

UPDATE reportajes SET foto_principal = 'reportaje-01-10-25.jpg'
WHERE titulo = 'SUNAT pone en la mira a las plantas de procesamiento de minerales' AND fecha_publicacion = '2025-10-01';

UPDATE reportajes SET foto_principal = 'reportaje-24-09-25.jpg'
WHERE titulo = 'El oro ilegal iguala a la minería formal en exportaciones' AND fecha_publicacion = '2025-09-24';

UPDATE reportajes SET foto_principal = 'reportaje-17-09-25.jpg'
WHERE titulo = 'Regiones pierden canon y regalías por evasión tributaria de mineros ilegales y por la ineficiencia de las autoridades' AND fecha_publicacion = '2025-09-17';

UPDATE reportajes SET foto_principal = 'reportaje-10-09-25.jpg'
WHERE titulo = 'Los ríos y lagos que antes se defendieron con marchas, hoy son contaminados por mineros ilegales' AND fecha_publicacion = '2025-09-10';

UPDATE reportajes SET foto_principal = 'reportaje-03-09-25.jpg'
WHERE titulo = 'Nueva Ley MAPE debe frenar a la minería ilegal' AND fecha_publicacion = '2025-09-03';

UPDATE reportajes SET foto_principal = 'reportaje-29-08-25.jpg'
WHERE titulo = 'Cinco de cada diez peruanos no votarían por un candidato defensor de la minería informal' AND fecha_publicacion = '2025-08-29';

UPDATE reportajes SET foto_principal = 'reportaje-21-08-25.jpg'
WHERE titulo = 'Carga explosiva que destruyó viviendas en Trujillo es la misma que usa la minería ilegal en Pataz' AND fecha_publicacion = '2025-08-21';

UPDATE reportajes SET foto_principal = 'reportaje-11-08-25.jpg'
WHERE titulo = 'El mercurio envenena bosques, ríos y personas' AND fecha_publicacion = '2025-08-11';

UPDATE reportajes SET foto_principal = 'reportaje-04-08-25.jpg'
WHERE titulo = 'Gobiernos regionales y locales perderán 2.600 millones a causa de mineros informales e ilegales' AND fecha_publicacion = '2025-08-04';

UPDATE reportajes SET foto_principal = 'reportaje-29-07-25.jpg'
WHERE titulo = 'Dina Boluarte calló sobre la minería informal e ilegal' AND fecha_publicacion = '2025-07-29';

UPDATE reportajes SET foto_principal = 'reportaje-10-07-25.jpg'
WHERE titulo = 'Siete de cada diez mineros del Reinfo operan en concesiones de otros pequeños mineros' AND fecha_publicacion = '2025-07-10';

UPDATE reportajes SET foto_principal = 'reportaje-08-07-25.jpg'
WHERE titulo = 'Ley MAPE amaneza cuidado de ríos, lagos y quebradas' AND fecha_publicacion = '2025-07-08';

UPDATE reportajes SET foto_principal = 'reportaje-07-07-25.jpg'
WHERE titulo = 'Colectivo PAS invoca a no ceder a las presiones para frenar combate a la minería ilegal' AND fecha_publicacion = '2025-07-07';

UPDATE reportajes SET foto_principal = 'reportaje-04-07-25.jpg'
WHERE titulo = 'Crece riesgo de que mineros ilegales financien campañas en 2026' AND fecha_publicacion = '2025-07-04';

UPDATE reportajes SET foto_principal = 'reportaje-10-06-25.jpg'
WHERE titulo = 'Regiones y municipios recibieron casi 7,000 millones de soles de canon minero' AND fecha_publicacion = '2025-06-10';

UPDATE reportajes SET foto_principal = 'reportaje-09-06-25.jpg'
WHERE titulo = 'Gobierno no sabe cómo enfrentar la minería ilegal' AND fecha_publicacion = '2025-06-09';
