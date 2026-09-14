# Diálogo y Desarrollo Perú - Sitio + Panel de Administración

Dos partes: el **sitio público** (lo que ve cualquier visitante, replicando
el diseño real de dialogoydesarrollo.com.pe) y el **panel de administración**
(donde se publica el contenido), ambos conectados a la misma base de datos
MySQL. Todo en PHP puro, sin frameworks, siguiendo el patrón de capas
pedido en el curso.

## Arquitectura del panel (admin/)

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

## Arquitectura del sitio público (raíz del proyecto)

```
pagina.php  →  clases/Clase.php (solo lectura)  →  MySQL
```

Las páginas (`index.php`, `reportajes.php`, `reportaje.php`, `noticias.php`,
`boletines.php`, `podcast.php`, `videos.php`) solo llaman a métodos de
`clases/` (`mostrar_todos()`, `mostrar_uno($id)`, `mostrar_destacado()`,
`mostrar_fotos($id)`, …) y pintan el HTML real de la plantilla del sitio.
Estas clases son de **solo lectura** — nunca insertan ni actualizan nada,
por diseño; publicar contenido es trabajo exclusivo del panel.

## Módulos incluidos (panel)

- **Reportajes** (foto principal usada en la grilla, PDF adjunto opcional,
  y galería de fotos adicionales sin número fijo)
- **Noticias** (foto y link externo al medio de origen)
- **Boletines NTEP** (portada + PDF)
- **Podcasts** y **Videos** (URL embebida, se reproducen en la plataforma
  de origen)
- **Autores**
- **Usuarios** del panel (solo el rol `admin` los gestiona)
- **Login** con sesión PHP, contraseña guardada con **SHA-256**
- **Recuperación de contraseña** por enlace con token (`admin/recuperar.php`)
- **Editor de texto con formato** para el cuerpo del reportaje (negritas,
  subtítulos, listas, citas y enlaces), sin librerías externas
- **Estados de publicación**: cada contenido se guarda como borrador o
  publicado, y el sitio público solo muestra lo publicado

## Requisitos

- XAMPP (Apache + MySQL + PHP 8+)

No hace falta conexión a internet: los iconos van incluidos en el propio
proyecto (`assets/css/iconos.css`, en SVG). Lo único que se carga de fuera
es la tipografía Cabin de Google Fonts, y si no hay red el navegador usa
una tipografía del sistema sin que nada se rompa.

## Instalación

1. Copia esta carpeta dentro de `C:\xampp\htdocs\`, de forma que
   `C:\xampp\htdocs\<carpeta>\admin\index.php` exista. El nombre de la
   carpeta da igual: la direccion del sitio se calcula sola (`base.php`).

2. Enciende **Apache** y **MySQL** en el Panel de Control de XAMPP.

3. Abre **phpMyAdmin** (`http://localhost/phpmyadmin`) → pestaña
   **Importar** → selecciona `sql/schema.sql` → **Continuar**. Crea la base
   `dyd` con todas las tablas y el usuario admin.

4. En la misma pestaña **Importar**, carga ahora `sql/datos.sql`, que llena
   la base con el contenido del sitio: 64 reportajes con su texto y su
   foto, 6 boletines con portada y PDF, 3 noticias y el video.

   **Esos dos archivos son todo**, en ese orden: no hay scripts de
   actualizacion ni pasos extra. `schema.sql` vuelve a crear la base desde
   cero (borra `dyd` si ya existia), asi que la estructura queda igual en
   cualquier computadora, venga de la version que venga. Por lo mismo se
   corre una sola vez, al instalar: si despues cargas contenido desde el
   panel, no lo vuelvas a importar.

5. Revisa `admin/config/Conexion.php` y `clases/Conexion.php` si tu MySQL
   usa otro usuario o clave (por defecto `root` sin clave, como en XAMPP).

6. Abre el **sitio público** en:
   ```
   http://localhost/<carpeta>/index.php
   ```

7. Abre el **panel de administración** en:
   ```
   http://localhost/<carpeta>/admin/login.php
   ```
   Ingresa con:
   - **Correo:** admin@dyd.com
   - **Contraseña:** admin123

   Cámbiala desde "Mi perfil" apenas ingreses.

## Estructura del proyecto

```
index.php  reportajes.php  reportaje.php  noticias.php
boletines.php  podcast.php  videos.php        Páginas del sitio público

clases/            Reportaje.php Noticia.php Boletin.php Podcast.php Video.php
                   Conexion.php — todas de solo lectura, sin escritura a la BD

partials/          cabecera.php  pie.php  tarjeta.php
                   Piezas de HTML reutilizadas por las páginas públicas

assets/            CSS/JS/imágenes reales del sitio (style-starter.css, etc.)

sql/               schema.sql   Estructura: tablas + usuario admin (se importa 1ro)
                   datos.sql    Contenido del sitio: reportajes, boletines... (2do)

admin/
  assets/          CSS/JS de la plantilla Admin One Tailwind (solo del panel)
  config/
    Conexion.php   Conexión PDO del panel (separada de clases/Conexion.php)
    global.php     Sesión, guardas de acceso, helpers comunes
    imagen.php     Subir/borrar archivos en disco
  modelos/         Una clase por entidad (sin echo, solo SQL) — el panel SÍ escribe
  ajax/            Un endpoint por entidad (JSON), llama a los modelos
  vistas/
    parciales/     cabecera.php y pie.php compartidos del panel
    scripts/       Un .js por vista (fetch + FormData)
    *.php          Una vista por módulo
  files/           Fotos y PDFs subidos (reportajes, boletines, etc.)
  login.php  logout.php  index.php (dashboard)
```

## Notas técnicas

- Las contraseñas se guardan como SHA-256 (`hash('sha256', $clave)`), según
  lo pedido para este proyecto.
- Todas las consultas usan sentencias preparadas (PDO) para evitar
  inyección SQL.
- Los archivos subidos se guardan con un nombre aleatorio dentro de
  `admin/files/<módulo>/`, y el sitio público los lee desde ahí mismo.
- Solo el rol `admin` puede gestionar la sección de **Usuarios** del panel.
- Un reportaje puede tener muchas fotos adicionales (`reportajes_fotos`),
  gestionables desde `admin/vistas/reportajes_fotos.php`; la foto principal
  es la que se usa en la grilla de reportajes y en el destacado del inicio.
- El reportaje destacado del inicio es el marcado `es_destacado`, o si
  ninguno está marcado, el último publicado.
- `clases/Conexion.php` (sitio público) y `admin/config/Conexion.php`
  (panel) son conexiones **separadas a propósito** — el sitio público nunca
  debería poder escribir en la base de datos.
- El SEO se arma en `partials/cabecera.php`: cada pagina define
  `$metaDescripcion`, `$metaImagen` y `$metaTipo` antes de incluirla, y de
  ahi salen la descripcion, la direccion canonica y las etiquetas Open Graph
  y Twitter Card. La nota agrega ademas datos estructurados NewsArticle.
  `sitemap.php` se genera solo desde la base y deja fuera los borradores.
- El HTML que entrega el editor pasa por `limpiarHtml()`
  (`admin/config/html.php`) antes de guardarse: solo sobreviven las
  etiquetas de la lista blanca, y los enlaces peligrosos se descartan.
- `base.php` calcula la constante `BASE`, que es la direccion desde la que
  se ve el proyecto (`/dyd-eds`, o vacia si esta en la raiz del servidor).
  Todas las rutas del sitio y del panel la usan, asi que la carpeta puede
  llamarse como sea y todo sigue funcionando. En el JavaScript del panel la
  misma direccion esta disponible como `BASE`.
