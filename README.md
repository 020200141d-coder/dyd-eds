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
`boletines.php`, `podcast.php`, `videos.php`, y las fijas `alianzas.php`,
`sobre.php` y `contacto.php`) solo llaman a métodos de
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
- **Recuperación de contraseña** por dos caminos (`admin/recuperar.php`):
  enlace con token enviado por correo, y **código de recuperación** que se
  genera desde "Mi perfil" y se guarda aparte. El código existe porque casi
  ningún alojamiento gratuito puede enviar correo: sin él, olvidar la
  contraseña dejaría el panel cerrado. De los dos se guarda solo el hash y
  cada uno sirve una sola vez
- **Editor de texto con formato** para el cuerpo del reportaje (negritas,
  subtítulos, listas, citas y enlaces), sin librerías externas
- **Estados de publicación**: cada contenido se guarda como borrador o
  publicado, y el sitio público solo muestra lo publicado
- **Destacado de portada**: un botón por fila en reportajes, noticias,
  boletines, podcasts y videos decide cuál de todos abre su sección en el
  inicio. Al marcar uno se desmarca el anterior, y si no hay ninguno
  marcado la portada muestra el más reciente

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

## Publicar el proyecto en internet (despliegue)

El proyecto es PHP + MySQL, así que necesita un servidor que ejecute PHP y
tenga MySQL. **GitHub Pages no sirve**: solo entrega archivos estáticos, no
ejecuta PHP ni tiene base de datos, así que el panel no podría guardar nada.
GitHub guarda el código; publicar el sitio es trabajo de un hosting con
cPanel (o equivalente) que traiga PHP 8, MySQL y phpMyAdmin.

Desplegar es mover **tres cosas**, no solo archivos: el código, la base de
datos y la configuración. Si falta una, la aplicación no levanta.

### Método 1 — subir los archivos (primer despliegue)

1. **Descarga el código** desde GitHub (*Code → Download ZIP*) o clónalo.

2. **Súbelo a `public_html`** con el Gestor de Archivos de cPanel y
   extráelo. `index.php` tiene que quedar directamente en `public_html`
   (si queda dentro de otra carpeta, el sitio se vería en
   `tusitio.com/dyd-eds/`, lo cual también funciona: `base.php` calcula la
   ruta sola).

3. **Crea la base de datos**: cPanel → *MySQL® Databases* → crea la base,
   crea el usuario con una clave fuerte y **asígnale todos los privilegios**
   sobre esa base. Anota los cuatro datos; ojo que cPanel le pone adelante
   tu usuario de cuenta (`mivuser_dyd`, no `dyd`).

4. **Importa los dos SQL** en cPanel → *phpMyAdmin* → selecciona tu base →
   pestaña *Importar*: primero `sql/schema.sql`, después `sql/datos.sql`.

   Antes de importar, **borra de `schema.sql` las tres sentencias marcadas**
   (`DROP DATABASE`, `CREATE DATABASE` y `USE dyd`) y la línea `USE dyd;` de
   `datos.sql`: en un hosting compartido la base ya está creada y tu cuenta
   no tiene permiso para crear ni borrar bases. Los dos archivos llevan el
   aviso escrito en el lugar exacto.

5. **Configura la conexión**: copia `bd-hosting.ejemplo.php` como
   `bd-hosting.php` y escribe ahí los cuatro datos del paso 3. Ese archivo
   está en el `.gitignore`, así que **la clave nunca llega a GitHub** y un
   `git pull` posterior no la pisa. Si no existe, el proyecto usa los valores
   de XAMPP, que es lo que hace falta en una instalación local.

6. **Entra al panel** (`/admin/login.php`) con admin@dyd.com / admin123 y
   **cambia la clave de inmediato** desde "Mi perfil". En una computadora
   local da igual; publicado en internet, cualquiera que vea el proyecto
   puede entrar con la clave de ejemplo y borrar todo.

   Hazlo antes que nada: la pantalla de "olvidé mi contraseña" solo muestra
   el enlace de restablecimiento cuando el sitio corre en localhost. Ya
   publicado lo manda por correo y no lo enseña, porque si no, cualquiera
   escribiría el correo del administrador y entraría. Si el hosting no envía
   correo (los gratuitos casi nunca lo permiten), esa vía queda sin salida:
   la clave se cambia desde "Mi perfil" estando dentro, o desde phpMyAdmin.

7. **Borra la carpeta `sql/` del servidor** una vez importada la base. Lleva
   un `.htaccess` que bloquea la descarga del volcado, pero hay hostings que
   ignoran el `.htaccess`; borrarla es la única garantía. En GitHub se queda,
   que es donde tiene que estar.

### Método 2 — actualizar con Git (los cambios siguientes)

Si el hosting trae el módulo **Git™ Version Control** en cPanel:

1. cPanel → *Git™ Version Control* → *Create* → *Clone a Repository*.
2. URL del repositorio y ruta de despliegue `/home/tuusuario/public_html`.
   Para un repositorio privado, usa un *Personal Access Token* de GitHub
   como contraseña.
3. Desde ahí, cada vez que hagas `git push`: cPanel → *Pull or Deploy* →
   *Update from Remote*.

Git sincroniza **solo el código**. La base de datos va aparte: la primera vez
se importa como en el Método 1, y si más adelante cambia la estructura, se
aplica el mismo cambio en producción desde phpMyAdmin. Los reportajes que
cargues desde el panel viven solo en el servidor — respáldalos con
phpMyAdmin → *Exportar*.

`bd-hosting.php` y las fotos subidas desde el panel no están en Git, así que
sobreviven a cada actualización.

### Método 3 — despliegue automático con GitHub Actions

InfinityFree no trae el módulo *Git Version Control* de cPanel, así que el
servidor no puede ir a buscar los cambios solo. Se hace al revés: **GitHub se
conecta por FTP y sube lo que cambió**, en cuanto se hace `push`.

```
cambio en el código  →  git push  →  GitHub sube por FTP  →  sitio actualizado
```

Queda más automático que el Método 2 de la guía: allá hay que entrar al panel
y darle *Pull*; aquí no se entra a ningún lado.

**Configuración (una sola vez).** En GitHub, *Settings → Secrets and variables
→ Actions → New repository secret*, se cargan tres secretos con los datos que
da el panel del hosting en *Detalles de FTP*:

| Secreto | Valor |
|---|---|
| `FTP_SERVER` | `ftpupload.net` |
| `FTP_USERNAME` | el usuario FTP (empieza con `if0_`) |
| `FTP_PASSWORD` | la contraseña FTP |

GitHub los guarda cifrados: no aparecen en el código, ni en el historial, ni
en los registros de ejecución.

El resto está en `.github/workflows/desplegar.yml`. También se puede lanzar a
mano desde la pestaña *Actions* → *Desplegar en el hosting* → *Run workflow*.

**Lo que el despliegue NO toca**, y es lo más importante de la configuración:

| Excluido | Por qué |
|---|---|
| `bd-hosting.php` | Solo existe en el servidor y lleva la clave de la base. Si se borrara, el sitio dejaría de conectar |
| `admin/files/` | Las fotos que se suben desde el panel viven solo en el servidor. Se cargaron una vez a mano; el despliegue no las toca para no borrar las nuevas |
| `sql/`, `docs/` | No tienen por qué estar en el servidor |

Sin esas exclusiones, cada despliegue borraría la configuración y las fotos,
porque la herramienta sincroniza: elimina del servidor lo que no está en el
repositorio.

### Si cambia la estructura de la base (migraciones)

Git sincroniza el código, no la base de datos. Cuando una actualización
agrega o cambia una columna, en el servidor hay que aplicarla a mano una vez:
phpMyAdmin → tu base → pestaña **SQL** → pegar la sentencia → **Continuar**.

Una instalación nueva no necesita nada: los `.sql` ya vienen actualizados.

Cambios aplicados hasta ahora:

```sql
-- Código de recuperación (distingue el enlace del código guardado)
ALTER TABLE recuperaciones
    ADD COLUMN tipo ENUM('enlace','codigo') NOT NULL DEFAULT 'enlace' AFTER token_hash;
```

### Si algo falla

| Síntoma | Qué revisar |
|---|---|
| "No se pudo conectar a la base de datos" | Los cuatro datos de `bd-hosting.php`. El mensaje de MySQL aparece en la misma pantalla y dice si el problema es la clave (*Access denied*) o el nombre (*Unknown database*) |
| Error 500 en todo el sitio | Suele ser un `.htaccess` que el hosting no acepta, o la versión de PHP: ponla en 8.x desde cPanel |
| Error 500 solo en `/sql/` | Es lo esperado en algunos hostings: significa que el volcado quedó inaccesible |
| Página en blanco | Un error de PHP oculto. Actívalos un momento con `ini_set('display_errors', 1);` al inicio de `index.php` y quítalo después |
| Acentos rotos (�) | La base tiene que ser `utf8mb4`. Los dos SQL ya empiezan con `SET NAMES utf8mb4` |
| Faltan imágenes o CSS (404) | Linux distingue mayúsculas de minúsculas y Windows no: `Logo.PNG` y `logo.png` son archivos distintos allá |

## Estructura del proyecto

```
index.php  reportajes.php  reportaje.php  noticias.php
boletines.php  podcast.php  videos.php        Páginas del sitio público
alianzas.php  sobre.php  contacto.php         Páginas fijas del menú (sin BD)

clases/            Reportaje.php Noticia.php Boletin.php Podcast.php Video.php
                   Conexion.php — todas de solo lectura, sin escritura a la BD

partials/          cabecera.php  pie.php  tarjeta.php
                   Piezas de HTML reutilizadas por las páginas públicas

assets/            CSS/JS/imágenes reales del sitio (style-starter.css, etc.)

bd.php             De dónde salen los datos de MySQL. Trae los de XAMPP y,
                   si existe bd-hosting.php, usa los de ahí
bd-hosting.ejemplo.php   Plantilla para crear bd-hosting.php en el servidor
                   (bd-hosting.php lleva la clave real y NO va a GitHub)

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
- El menú lleva a páginas reales: en el sitio original **Alianzas**, **Sobre
  D&D** y **Contacto** apuntaban a archivos que no existen (`about.html`,
  `contact.html`) o a un ancla vacía (`#btn`), y devolvían 404. Aquí son
  `alianzas.php`, `sobre.php` y `contacto.php`, con su texto y enlazadas
  también desde el pie y el sitemap.
- El CSS y el JS se piden con la fecha del archivo al final
  (`sitio.css?v=...`, ver `version()` en `partials/funciones.php`). Sin eso,
  una computadora que ya visitó el sitio podía seguir viendo el diseño viejo
  guardado en el caché del navegador después de actualizar el proyecto.
- `base.php` calcula la constante `BASE`, que es la direccion desde la que
  se ve el proyecto (`/dyd-eds`, o vacia si esta en la raiz del servidor).
  Todas las rutas del sitio y del panel la usan, asi que la carpeta puede
  llamarse como sea y todo sigue funcionando. En el JavaScript del panel la
  misma direccion esta disponible como `BASE`.
