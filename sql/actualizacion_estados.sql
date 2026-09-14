-- Agrega el estado de publicacion a las tablas de contenido.
--
-- Solo hace falta si la base ya estaba creada con una version anterior del
-- proyecto. En una instalacion nueva no se corre: schema.sql ya trae la
-- columna.
--
-- Todo lo que ya estaba cargado queda como publicado, que es como se venia
-- viendo hasta ahora.
--
-- Se puede correr mas de una vez sin romper nada: cada paso comprueba antes
-- si la columna o la tabla ya existen.

USE dyd;

ALTER TABLE reportajes
    ADD COLUMN IF NOT EXISTS estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER pdf_adjunto;

ALTER TABLE noticias
    ADD COLUMN IF NOT EXISTS estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER link_externo;

ALTER TABLE boletines
    ADD COLUMN IF NOT EXISTS estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER archivo_pdf;

ALTER TABLE podcasts
    ADD COLUMN IF NOT EXISTS estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER url_embed;

ALTER TABLE videos
    ADD COLUMN IF NOT EXISTS estado ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado'
    AFTER url_embed;

-- Tabla para el restablecimiento de contrasena (pantalla "olvide mi clave").
CREATE TABLE IF NOT EXISTS recuperaciones (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id      INT UNSIGNED NOT NULL,
    token_hash      CHAR(64) NOT NULL,
    expira          DATETIME NOT NULL,
    usado           TINYINT(1) NOT NULL DEFAULT 0,
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_recuperaciones_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_recuperaciones_token (token_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
