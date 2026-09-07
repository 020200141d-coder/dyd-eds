# Panel de Administración - Revista Digital NTEP

Panel de administración basado en la plantilla **Admin One Tailwind CSS**
(la que enviaste en el zip), conectado a una base de datos MySQL real con
PHP y PDO. Permite gestionar todo el contenido de la revista digital.

## Módulos incluidos

- **Reportajes** (con foto principal, PDF adjunto y galería de fotos
  adicionales por reportaje)
- **Noticias** (con foto y link externo)
- **Boletines NTEP** (con portada y PDF)
- **Podcasts** y **Videos** (con URL embebida y **invitados/expositores
  etiquetados** en cada uno)
- **Invitados** (expositores que se pueden etiquetar en podcasts y videos)
- **Autores** (colaboradores externos)
- **Usuarios** (administradores del panel, solo visible para el rol `admin`)
- **Login** real contra la base de datos (contraseñas con `password_hash`)

## Requisitos

- XAMPP (Apache + MySQL + PHP 8+) — https://www.apachefriends.org/

## Instalación (paso a paso)

1. Copia toda esta carpeta (`dydesarrollo-eds`) dentro de
   `C:\xampp\htdocs\`. Por ejemplo:
   `C:\xampp\htdocs\dyd-eds\`

2. Abre el **Panel de Control de XAMPP** y enciende **Apache** y **MySQL**.

3. Abre **phpMyAdmin** (http://localhost/phpmyadmin), ve a la pestaña
   **Importar**, selecciona el archivo `sql/schema.sql` de este proyecto y
   dale a **Continuar**. Esto crea la base de datos `dyd` con
   todas las tablas y un usuario administrador de prueba.

   (Alternativa por consola: `mysql -u root -p < sql/schema.sql`)

4. Revisa `config/db.php`. Por defecto usa:
   ```
   DB_HOST = localhost
   DB_NAME = dyd
   DB_USER = root
   DB_PASS = ''  (vacío, como en XAMPP por defecto)
   ```
   Si tu MySQL tiene otra clave, cámbiala ahí.

5. Abre en el navegador: `http://localhost/dyd-eds/login.php`

6. Inicia sesión con el usuario de prueba:
   - **Email:** admin@dyd.com
   - **Contraseña:** admin123

   ⚠️ Cambia esta contraseña desde "Mi perfil" apenas ingreses.

## Estructura del proyecto

```
config/db.php          Conexión PDO a MySQL
includes/               header/footer/sidebar reutilizables + auth + helpers
sql/schema.sql          Script completo de la base de datos + usuario admin
assets/                 CSS/JS de la plantilla Admin One Tailwind
uploads/                Fotos y PDFs subidos desde el panel
reportajes/  noticias/  boletines/  podcasts/  videos/
autores/     invitados/ usuarios/
                        Un módulo CRUD (index/form/delete) por carpeta
login.php  logout.php  index.php (dashboard)
```

## Notas técnicas

- Las contraseñas se guardan con `password_hash()` (bcrypt) y se validan
  con `password_verify()`.
- Las consultas usan sentencias preparadas (PDO) para evitar inyección SQL.
- Los archivos subidos se guardan con un nombre aleatorio dentro de
  `uploads/<módulo>/` y la carpeta original nunca se expone en la URL.
- Solo el rol `admin` puede gestionar la sección de **Usuarios**.
- Un reportaje puede tener muchas fotos adicionales (`reportajes_fotos`),
  gestionables desde el botón de imagen en el listado de reportajes.
- Podcasts y videos tienen una relación N:M con `invitados` a través de
  las tablas `podcast_invitados` y `video_invitados`, para saber qué
  expositores participaron en cada emisión.
