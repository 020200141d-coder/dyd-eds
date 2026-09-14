-- Agrega el estado de publicacion a las tablas de contenido.
--
-- Solo hace falta si la base ya estaba creada con una version anterior del
-- proyecto. En una instalacion nueva no se corre: schema.sql ya trae la
-- columna.
--
-- Todo lo que ya estaba cargado queda como publicado, que es como se venia
-- viendo hasta ahora.

USE dyd;

ALTER TABLE reportajes
    ADD COLUMN estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER pdf_adjunto;

ALTER TABLE noticias
    ADD COLUMN estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER link_externo;

ALTER TABLE boletines
    ADD COLUMN estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER archivo_pdf;

ALTER TABLE podcasts
    ADD COLUMN estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER url_embed;

ALTER TABLE videos
    ADD COLUMN estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER url_embed;
