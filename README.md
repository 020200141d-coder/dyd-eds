# Panel de Administración - Revista Digital NTEP

Panel de administración basado en la plantilla **Admin One Tailwind CSS**,
conectado a una base de datos MySQL real. Sigue el patrón de capas pedido
en el curso (vista → script.js → ajax → modelo → MySQL), usando PHP puro,
sin frameworks.

## Arquitectura

```
vista.php  →  script.js (FormData)  →  ajax/x.php  →  modelos/Clase.php  →  MySQL
  (pinta)        (arma la petición)      (limpia y      (arma el SQL)
                                          decide)
```

- La **vista** (`admin/vistas/*.php`) solo pinta HTML y carga su script; no
  consulta la base de datos.
- El **script** (`admin/vistas/scripts/*.js`) usa `fetch` + `FormData` para
  hablar con el ajax correspondiente y pintar la respuesta en el DOM.
- El **ajax** (`admin/ajax/*.php`) valida la sesión, limpia los datos del
  request y llama al modelo; nunca escribe SQL directamente. Responde JSON.
- El **modelo** (`admin/modelos/*.php`) es una clase con métodos estáticos
  (`listar`, `obtener`, `crear`, `actualizar`, `eliminar`, …) que arma y
  ejecuta las consultas. Nunca hace `echo`.

## Módulos incluidos

- **Reportajes** (foto principal usada en la grilla, PDF adjunto opcional,
  y galería de fotos adicionales sin número fijo)
- **Noticias** (foto y link externo al medio de origen)
- **Boletines NTEP** (portada + PDF)
- **Podcasts** y **Videos** (URL embebida + invitados/expositores
  etiquetados)
- **Invitados** (expositores etiquetables en podcasts y videos)
- **Autores**
- **Usuarios** del panel (solo el rol `admin` los gestiona)
- **Login** con sesión PHP, contraseña guardada con **SHA-256**

## Requisitos

- XAMPP (Apache + MySQL + PHP 8+)

## Instalación

1. Copia esta carpeta dentro de `C:\xampp\htdocs\dyd-eds\`, de forma que
   `C:\xampp\htdocs\dyd-eds\admin\index.php` exista.

2. Enciende **Apache** y **MySQL** en el Panel de Control de XAMPP.

3. Abre **phpMyAdmin** (`http://localhost/phpmyadmin`) → pestaña
   **Importar** → selecciona `sql/schema.sql` → **Continuar**. Esto crea la
   base `dyd` con todas las tablas y un usuario de prueba.

4. Revisa `admin/config/Conexion.php` si tu MySQL usa otro usuario o clave
   (por defecto `root` sin clave, como en XAMPP).

5. Abre en el navegador:
   ```
   http://localhost/dyd-eds/admin/login.php
   ```

6. Ingresa con:
   - **Correo:** admin@dyd.com
   - **Contraseña:** admin123

   Cámbiala desde "Mi perfil" apenas ingreses.

## Estructura del proyecto

```
assets/                  CSS/JS de la plantilla Admin One Tailwind
sql/schema.sql           Script completo de la base de datos + usuario admin
admin/
  config/
    Conexion.php         Conexión PDO (única fuente de la conexión)
    global.php            Sesión, guardas de acceso, helpers comunes
    imagen.php            Subir/borrar archivos en disco
  modelos/                Una clase por entidad (sin echo, solo SQL)
  ajax/                   Un endpoint por entidad (JSON), llama a los modelos
  vistas/
    parciales/            cabecera.php y pie.php compartidos
    scripts/              Un .js por vista (fetch + FormData)
    *.php                 Una vista por módulo
  files/                  Fotos y PDFs subidos (reportajes, boletines, etc.)
  login.php  logout.php  index.php (dashboard)
```

## Notas técnicas

- Las contraseñas se guardan como SHA-256 (`hash('sha256', $clave)`), según
  lo pedido para este proyecto.
- Todas las consultas usan sentencias preparadas (PDO) para evitar
  inyección SQL.
- Los archivos subidos se guardan con un nombre aleatorio dentro de
  `admin/files/<módulo>/`.
- Solo el rol `admin` puede gestionar la sección de **Usuarios**.
- Un reportaje puede tener muchas fotos adicionales (`reportajes_fotos`),
  gestionables desde `admin/vistas/reportajes_fotos.php`; la foto principal
  es la que se usa en la grilla de reportajes.
- Podcasts y videos tienen una relación N:M con `invitados` a través de
  `podcast_invitados` y `video_invitados`.
- Las rutas absolutas (`/dyd-eds/admin/...`) asumen que el proyecto vive en
  `htdocs/dyd-eds`. Si cambias el nombre de la carpeta, actualiza ese
  prefijo en `admin/vistas/parciales/cabecera.php`, `pie.php`,
  `admin/login.php` y `admin/config/global.php`.
