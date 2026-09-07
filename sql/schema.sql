-- ============================================================
-- Base de datos: Revista Digital NTEP - Panel de administración
-- Motor: MySQL 8.0+ / MariaDB (XAMPP)
-- ============================================================

CREATE DATABASE IF NOT EXISTS revista_digital
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE revista_digital;

SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------
-- Tabla: usuarios (administradores del panel)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres         VARCHAR(100) NOT NULL,
    ap_paterno      VARCHAR(100) NOT NULL,
    ap_materno      VARCHAR(100) NULL,
    email           VARCHAR(150) NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    rol             ENUM('admin', 'editor', 'redactor') NOT NULL DEFAULT 'redactor',
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_usuarios_email UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: autores (colaboradores externos, opcional)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS autores (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres         VARCHAR(100) NOT NULL,
    ap_paterno      VARCHAR(100) NULL,
    ap_materno      VARCHAR(100) NULL,
    nickname        VARCHAR(100) NULL,
    es_nickname     TINYINT(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: reportajes
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reportajes (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    resumen_corto       VARCHAR(500) NULL,
    desarrollo          LONGTEXT NOT NULL,
    foto_principal      VARCHAR(255) NULL,
    pdf_adjunto         VARCHAR(255) NULL,
    fecha_publicacion   DATE NOT NULL,
    es_destacado        TINYINT(1) NOT NULL DEFAULT 0,
    autor_id            INT UNSIGNED NULL,
    usuario_id          INT UNSIGNED NOT NULL,
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_reportajes_autor
        FOREIGN KEY (autor_id) REFERENCES autores(id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_reportajes_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_reportajes_fecha (fecha_publicacion),
    INDEX idx_reportajes_destacado (es_destacado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: reportajes_fotos (fotos adicionales de un reportaje)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reportajes_fotos (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    reportaje_id    INT UNSIGNED NOT NULL,
    url_foto        VARCHAR(255) NOT NULL,
    orden           SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    descripcion     VARCHAR(255) NULL,
    CONSTRAINT fk_reportajes_fotos_reportaje
        FOREIGN KEY (reportaje_id) REFERENCES reportajes(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_reportajes_fotos_reportaje (reportaje_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: noticias
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS noticias (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    foto                VARCHAR(255) NULL,
    link_externo        VARCHAR(500) NULL,
    fecha_publicacion   DATE NOT NULL,
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_noticias_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_noticias_fecha (fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: boletines
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS boletines (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero_boletin      VARCHAR(50) NOT NULL,
    resumen             VARCHAR(500) NULL,
    foto_portada        VARCHAR(255) NULL,
    archivo_pdf         VARCHAR(255) NOT NULL,
    fecha_publicacion   DATE NOT NULL,
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT uq_boletines_numero UNIQUE (numero_boletin),
    CONSTRAINT fk_boletines_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_boletines_fecha (fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: podcasts
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS podcasts (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    url_embed           VARCHAR(500) NOT NULL,
    fecha_publicacion   DATE NOT NULL,
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_podcasts_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_podcasts_fecha (fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: videos
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS videos (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    url_embed           VARCHAR(500) NOT NULL,
    fecha_publicacion   DATE NOT NULL,
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_videos_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_videos_fecha (fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: invitados (expositores/panelistas etiquetables
-- en podcasts y videos)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS invitados (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres         VARCHAR(100) NOT NULL,
    ap_paterno      VARCHAR(100) NULL,
    ap_materno      VARCHAR(100) NULL,
    cargo           VARCHAR(150) NULL,
    foto            VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: podcast_invitados (relación N:M podcast - invitado)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS podcast_invitados (
    podcast_id      INT UNSIGNED NOT NULL,
    invitado_id     INT UNSIGNED NOT NULL,
    PRIMARY KEY (podcast_id, invitado_id),
    CONSTRAINT fk_podcast_invitados_podcast
        FOREIGN KEY (podcast_id) REFERENCES podcasts(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_podcast_invitados_invitado
        FOREIGN KEY (invitado_id) REFERENCES invitados(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ------------------------------------------------------------
-- Tabla: video_invitados (relación N:M video - invitado)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS video_invitados (
    video_id        INT UNSIGNED NOT NULL,
    invitado_id     INT UNSIGNED NOT NULL,
    PRIMARY KEY (video_id, invitado_id),
    CONSTRAINT fk_video_invitados_video
        FOREIGN KEY (video_id) REFERENCES videos(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_video_invitados_invitado
        FOREIGN KEY (invitado_id) REFERENCES invitados(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ------------------------------------------------------------
-- Usuario administrador por defecto
-- Email:    admin@dyd.com
-- Password: admin123   (cámbialo apenas ingreses)
-- ------------------------------------------------------------
INSERT INTO usuarios (nombres, ap_paterno, ap_materno, email, password_hash, rol)
SELECT 'Administrador', 'General', NULL, 'admin@dyd.com',
       '$2y$12$6yUzdOEgUe8Hj/HoRSOqWONg0/yY65QMpb6D0uME9itPy4dMP/T2m', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE email = 'admin@dyd.com');
