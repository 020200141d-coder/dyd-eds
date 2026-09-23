-- Base de datos del panel administrativo de la revista digital
-- Motor: MySQL 8.0+ / MariaDB (XAMPP)
--
-- Este es el primero de los dos unicos scripts del proyecto:
--   1) sql/schema.sql  -> la estructura (este archivo)
--   2) sql/datos.sql   -> el contenido del sitio
-- Se importan en ese orden desde phpMyAdmin y no hay nada mas que correr.
--
-- OJO: empieza borrando la base `dyd` si ya existia, para que la estructura
-- quede siempre igual sin importar de que version venga la computadora donde
-- se instale. Si ya habias cargado contenido propio desde el panel, se
-- pierde: este archivo se corre una sola vez, al instalar.

-- Los textos llevan tildes y enies: se avisa el juego de caracteres
-- para que no dependa de como este configurado el cliente que importa.
SET NAMES utf8mb4;

-- ---------------------------------------------------------------------
-- EN UN HOSTING: borra estas tres sentencias (hasta la linea de guiones)
-- antes de importar. Alla la base ya viene creada desde el panel del
-- servicio, con un nombre propio (algo como usuario_dyd), y la cuenta no
-- tiene permiso para crear ni borrar bases: se elige la base en
-- phpMyAdmin y se importa el resto tal cual.
-- En XAMPP se dejan como estan.
DROP DATABASE IF EXISTS dyd;

CREATE DATABASE dyd
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE dyd;
-- ---------------------------------------------------------------------

-- usuarios: administradores del panel
CREATE TABLE usuarios (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    email           VARCHAR(150) NOT NULL,
    password_hash   VARCHAR(255) NOT NULL,
    rol             ENUM('admin', 'editor', 'redactor') NOT NULL DEFAULT 'redactor',
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_usuarios_email UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- recuperaciones: pedidos para restablecer la contrasena
-- El token no se guarda tal cual sino su hash: si alguien llegara a leer la
-- tabla, igual no podria armar el enlace de recuperacion.
CREATE TABLE recuperaciones (
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

-- autores: colaboradores externos, no siempre tienen usuario en el panel
CREATE TABLE autores (
    id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- reportajes: contenido principal de la revista
CREATE TABLE reportajes (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    resumen_corto       VARCHAR(500) NULL,
    desarrollo          LONGTEXT NOT NULL,
    foto_principal      VARCHAR(255) NULL,
    pdf_adjunto         VARCHAR(255) NULL,
    estado              ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado',
                        -- borrador: solo se ve en el panel; publicado: sale al sitio
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

-- reportajes_fotos: fotos extra de un reportaje (aparte de la foto principal)
CREATE TABLE reportajes_fotos (
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

-- noticias: notas cortas que enlazan a otro medio
CREATE TABLE noticias (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    foto                VARCHAR(255) NULL,
    link_externo        VARCHAR(500) NULL,
    estado              ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado',
                        -- borrador: solo se ve en el panel; publicado: sale al sitio
    fecha_publicacion   DATE NOT NULL,
    es_destacado        TINYINT(1) NOT NULL DEFAULT 0,
                        -- el que abre su seccion en la portada; solo uno a la vez
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_noticias_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_noticias_fecha (fecha_publicacion),
    INDEX idx_noticias_destacado (es_destacado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- boletines: boletines NTEP con su PDF
CREATE TABLE boletines (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero_boletin      VARCHAR(50) NOT NULL,
    resumen             VARCHAR(500) NULL,
    foto_portada        VARCHAR(255) NULL,
    archivo_pdf         VARCHAR(255) NOT NULL,
    estado              ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado',
                        -- borrador: solo se ve en el panel; publicado: sale al sitio
    fecha_publicacion   DATE NOT NULL,
    es_destacado        TINYINT(1) NOT NULL DEFAULT 0,
                        -- el que abre su seccion en la portada; solo uno a la vez
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT uq_boletines_numero UNIQUE (numero_boletin),
    CONSTRAINT fk_boletines_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_boletines_fecha (fecha_publicacion),
    INDEX idx_boletines_destacado (es_destacado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- podcasts
CREATE TABLE podcasts (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    url_embed           VARCHAR(500) NOT NULL,
    estado              ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado',
                        -- borrador: solo se ve en el panel; publicado: sale al sitio
    fecha_publicacion   DATE NOT NULL,
    es_destacado        TINYINT(1) NOT NULL DEFAULT 0,
                        -- el que abre su seccion en la portada; solo uno a la vez
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_podcasts_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_podcasts_fecha (fecha_publicacion),
    INDEX idx_podcasts_destacado (es_destacado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- videos
CREATE TABLE videos (
    id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo              VARCHAR(255) NOT NULL,
    url_embed           VARCHAR(500) NOT NULL,
    estado              ENUM('borrador', 'publicado') NOT NULL DEFAULT 'publicado',
                        -- borrador: solo se ve en el panel; publicado: sale al sitio
    fecha_publicacion   DATE NOT NULL,
    es_destacado        TINYINT(1) NOT NULL DEFAULT 0,
                        -- el que abre su seccion en la portada; solo uno a la vez
    usuario_id          INT UNSIGNED NOT NULL,
    CONSTRAINT fk_videos_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_videos_fecha (fecha_publicacion),
    INDEX idx_videos_destacado (es_destacado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- usuario administrador de prueba, cambiar la clave apenas se ingrese
-- correo: admin@dyd.com / clave: admin123 (guardada como SHA-256)
INSERT INTO usuarios (nombre_completo, email, password_hash, rol)
VALUES ('Administrador General', 'admin@dyd.com',
        '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'admin');
