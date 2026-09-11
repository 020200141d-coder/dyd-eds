# Descarga el texto completo de los 63 reportajes del sitio real.
#
# COMO USARLO:
#   1. Abre PowerShell dentro de C:\xampp\htdocs\dyd-eds
#   2. Ejecuta:
#      powershell -ExecutionPolicy Bypass -File descargar_articulos.ps1
#   3. Se crea la carpeta "articulos" con los 63 archivos .html
#   4. Comprime esa carpeta en un .rar o .zip y mandala por el chat
#
# Solo baja texto (HTML), no imagenes: pesa poco y demora ~1 minuto.

New-Item -ItemType Directory -Force -Path "articulos" | Out-Null
$ok = 0
$fail = @()
$total = 63
$i = 0

$lista = @(
  "https://www.dialogoydesarrollo.com.pe/19-jovenes-cajamarquinos-se-graduan-comotecnicos-gracias-al-programa-inspira-de-minera-la-granja-y-cetemin.html"
  "https://www.dialogoydesarrollo.com.pe/742-escolares-de-taca-y-raccaya-reciben-kits-educativos.html"
  "https://www.dialogoydesarrollo.com.pe/CRESPO-cumple-compromisos-con-comunidades-de-arcata-y-chucnihuaqui-en-el-distrito-de-cayarani.html"
  "https://www.dialogoydesarrollo.com.pe/SUNAT-pone-en-la-mira-a-las-plantas-de-procesamiento-de-minerales.html"
  "https://www.dialogoydesarrollo.com.pe/a-que-se-destino-el-canon-minero-y-gasifero-en-cusco.html"
  "https://www.dialogoydesarrollo.com.pe/alianza-entre-ugel-melgar-minsur-y-ensena-peru-impulsara-aprendizajes-en-estudiantes-de-nunoa.html"
  "https://www.dialogoydesarrollo.com.pe/aportes-mineros-para-las-regiones-y-el-gobierno-central-crecieron-62-porciento-en-2026.html"
  "https://www.dialogoydesarrollo.com.pe/areas-naturales-desprotegidas-al-menos-ocho-son-impactadas-por-la-mineraa-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/arequipa-destina-7-de-cada-10-soles-del-canon-minero-a-obras-viales.html"
  "https://www.dialogoydesarrollo.com.pe/asi-lavan-el-oro-ilegal-plantas-procesadoras-y-mineros-con-reinfo.html"
  "https://www.dialogoydesarrollo.com.pe/bancada-reinfo-los-nuevos-aliados-de-la-informalidad-en-el-congreso.html"
  "https://www.dialogoydesarrollo.com.pe/candidatos-serian-financiados-por-mineros-inscritos-en-el-reinfo-como-en-2021.html"
  "https://www.dialogoydesarrollo.com.pe/canon-minero-en-la-libertad-mucho-dinero-ejecutado-pocas-brechas-cerradas.html"
  "https://www.dialogoydesarrollo.com.pe/canon-y-regalias-mineras-sostienen-el-70-porciento-del-presupuesto-de-la-region-moquegua.html"
  "https://www.dialogoydesarrollo.com.pe/canon-y-regalias-mineras-y-gasiferas-sostienen-mas-del-70-por-ciento-del-presupuesto-en-cusco.html"
  "https://www.dialogoydesarrollo.com.pe/carga-explosiva-que-destruyo-viviendas-en-trujillo-es-la-misma-que-usa-la-miner%C3%ADa-ilegal-en-pataz.html"
  "https://www.dialogoydesarrollo.com.pe/cinco-de-cada-diez-peruanos-no-votarian-por-un-candidato-defensor-de-la-mineria-informal.html"
  "https://www.dialogoydesarrollo.com.pe/colectivo-pas-alerta-sobre-el-avance-de-la-miner%C3%ADa-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/colectivo-pas-invoca-a-no-ceder-a-las-presiones-para-frenar-combate-a-la-miner%C3%ADa-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/como-evitar-que-el-canon-del-boom-minero-termine-en-obras-de-poco-impacto.html"
  "https://www.dialogoydesarrollo.com.pe/como-se-posicionan-los-partidos-frente-a-los-mineros-informales.html"
  "https://www.dialogoydesarrollo.com.pe/congreso-acelera-paquetazo-a-favor-de-mineros-informales-en-plena-campania.html"
  "https://www.dialogoydesarrollo.com.pe/congreso-pone-en-jaque-canon-minero-y-financiamiento-de-obras-en-regiones.html"
  "https://www.dialogoydesarrollo.com.pe/crece-riesgo-de-que-mineros-ilegales-financien-campa%C3%B1as-en-2026.html"
  "https://www.dialogoydesarrollo.com.pe/crisis-del-gas-vuelve-el-debate-sobre-la-seguridad-energetica-del-pais.html"
  "https://www.dialogoydesarrollo.com.pe/dina-boluarte-callo-sobre-la-miner%C3%ADa-informal-e-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/el-canon-minero-como-motor-de-desarrollo-social-en-2025.html"
  "https://www.dialogoydesarrollo.com.pe/el-canon-que-ica-no-logra-convertir-en-obras.html"
  "https://www.dialogoydesarrollo.com.pe/el-mercurio-envenena-bosques-rios-y-personas.html"
  "https://www.dialogoydesarrollo.com.pe/el-oro-ilegal-iguala-a-la-mineria-formal-en-exportaciones.html"
  "https://www.dialogoydesarrollo.com.pe/elecciones-2026-solo-3-de-cada-10-partidos-se-enfrentarian-a-mineros-ilegales.html"
  "https://www.dialogoydesarrollo.com.pe/empresas-y-regiones-que-concentran-la-produccion-minera-en-peru.html"
  "https://www.dialogoydesarrollo.com.pe/esto-proponen-los-candidatos-a-la-presidencia-para-enfrentar-la-mineria-ilegal-e-informal.html"
  "https://www.dialogoydesarrollo.com.pe/fiscal%C3%ADa-advierte-que-mineros-ilegales-posiblemente-financien-a-candidatos.html"
  "https://www.dialogoydesarrollo.com.pe/gobierno-no-sabe-como-enfrentar-la-mineri%CC%81a-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/gobierno-observaria-ampliacion-del-reinfo-si-no-cumple-ciertas-condiciones.html"
  "https://www.dialogoydesarrollo.com.pe/gobierno-regional-de-apurimac-invirtio-el-89-del-canon-minero-y-regalias-transferidas-en-2025.html"
  "https://www.dialogoydesarrollo.com.pe/gobiernos-regionales-y-locales-perderan-2600-millones-a-causa-de-mineros-informales-e-ilegales.html"
  "https://www.dialogoydesarrollo.com.pe/investigacion-revela-rechazo-ciudadano-a-mineria-ilegal-o-informal.html"
  "https://www.dialogoydesarrollo.com.pe/juliane-koepcke-denuncia-que-mineria-ilegal-invade-reserva-comunal-el-sira.html"
  "https://www.dialogoydesarrollo.com.pe/la-mineria-ilegal-habria-lavado-unos-22-mil-millones-de-dolares.html"
  "https://www.dialogoydesarrollo.com.pe/la-violencia-ligada-a-economias-ilegales-se-expande-por-todo-el-peru.html"
  "https://www.dialogoydesarrollo.com.pe/ley-mape-amaneza-cuidado-de-r%C3%ADos-lagos-y-quebradas.html"
  "https://www.dialogoydesarrollo.com.pe/los-peligros-de-trabajar-en-un-socavon-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/los-rios-y-lagos-que-fueron-bandera-en-protestas-hoy-son-contaminados-por-mineros-ilegales.html"
  "https://www.dialogoydesarrollo.com.pe/mas-de-730-mineros-con-reinfo-vigente-o-suspendido-participan-en-las-elecciones-regionales-y-municipales.html"
  "https://www.dialogoydesarrollo.com.pe/mas-reservas-cuencas-y-zonas-protegidas-afectadas-por-la-mineria-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/medidas-que-el-nuevo-gobierno-debe-tomar-para-frenar-la-mineria-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/mineria-ilegal-contamina-rios-y-deja-sin-agua-a-millones-de-familias.html"
  "https://www.dialogoydesarrollo.com.pe/mineria-ilegal-la-brecha-sigue-abierta-a-una-semana-del-nuevo-gobierno.html"
  "https://www.dialogoydesarrollo.com.pe/mineros-ilegales-invaden-concesiones-mineras-formales-en-regiones.html"
  "https://www.dialogoydesarrollo.com.pe/muerte-acecha-centros-mineros-ilegales-en-pataz-ananea-y-madre-de-dios.html"
  "https://www.dialogoydesarrollo.com.pe/nueva-ley-mape-debe-frenar-a-la-mineria-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/por-que-algunas-comunidades-respaldan-actividades-de-mineria-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/por-que-ampliar-el-reinfo-seria-un-error.html"
  "https://www.dialogoydesarrollo.com.pe/quiruvilca-el-pueblo-perforado-por-la-mineria-ilegal.html"
  "https://www.dialogoydesarrollo.com.pe/regiones-pierden-canon-y-regalias-por-evasion-tributaria-de-mineros-ilegales-y-por-la-ineficiencia-de-las-autoridades.html"
  "https://www.dialogoydesarrollo.com.pe/regiones-y-municipios-recibieron-casi-7000-millones-de-soles-de-canon-minero.html"
  "https://www.dialogoydesarrollo.com.pe/se-suman-mas-buses-san-antonio-de-torontoy-en-la-ruta-hiram-bingham.html"
  "https://www.dialogoydesarrollo.com.pe/siete-de-cada-diez-mineros-del-reinfo-operan-en-concesiones-de-otros-peque%C3%B1os-mineros.html"
  "https://www.dialogoydesarrollo.com.pe/sunat-incauta-menos-del-1-del-oro-ilegal-que-el-peru-exporta-en-un-anio.html"
  "https://www.dialogoydesarrollo.com.pe/universidades-publicas-administran-casi-900-millones-de-canon-regalias-y-otros-recursos-determinados.html"
  "https://www.dialogoydesarrollo.com.pe/uso-de-mas-de-3000-millones-de-canon-minero-no-muestran-impacto-real-en-ancash.html"
)

foreach ($url in $lista) {
    $i++
    $nombre = $url.Substring($url.LastIndexOf("/") + 1)
    $destino = "articulos\$nombre"
    Write-Host "[$i/$total] $nombre"
    if (Test-Path $destino) { $ok++; continue }
    try {
        Invoke-WebRequest -Uri $url -OutFile $destino -UseBasicParsing -TimeoutSec 25
        $ok++
    } catch {
        Write-Host "    FALLO"
        Remove-Item -ErrorAction SilentlyContinue $destino
        $fail += $nombre
    }
}

Write-Host ""
Write-Host "===================================="
Write-Host "Descargados: $ok de $total"
if ($fail.Count -gt 0) {
    Write-Host "Fallaron $($fail.Count):"
    $fail | ForEach-Object { Write-Host "  - $_" }
}
Write-Host "Comprime la carpeta articulos y mandala por el chat."
Write-Host "===================================="