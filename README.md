# Matriz de Inventario de Macros Excel — Migrador BCI

**Proyecto:** MIGRADOR BCI · AIWIS × CUBI-K  
**Versión:** 2.0  
**Estado:** Producción en Netlify  

## Descripción

Sistema web para gestionar el inventario de macros Excel/VBA del Banco BCI, facilitando la migración a Google Sheets y Google Apps Script. Permite:

- 📋 Importar y crear fichas de inventario de macros
- 🤖 Análisis automático con Claude AI
- 💾 Guardar datos localmente o en Google Sheets
- 📤 Exportar en JSON y CSV para el motor de migración
- 👤 Sistema de autenticación con roles (admin/usuario)

## Acceso Rápido

**URL de Producción:** https://matriz-bci.netlify.app  
**Credenciales de Demo:**

| Email | Contraseña | Rol |
|-------|-----------|-----|
| `admin` | `admin` | Admin |
| `armin.salazar@aiwis.cl` | `AIWIS2026` | Admin |
| `soporte.aiwis@gmail.com` | `SOPORTE2026` | Admin |
| `demo` | `demo` | Usuario |

## Instalación Local

### Requisitos
- Navegador moderno (Chrome, Firefox, Safari, Edge)
- Node.js 18+ (opcional, para desarrollo)

### Pasos

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/matriz-bci-inventario.git
   cd matriz-bci-inventario
   ```

2. **Servir localmente (simple HTTP server):**
   ```bash
   python3 -m http.server 8000
   # O con Node.js:
   npx http-server .
   ```

3. **Abrir en navegador:**
   ```
   http://localhost:8000
   ```

## Configuración de Producción en Netlify

### 1. Conectar GitHub a Netlify

```bash
# En GitHub, crear nuevo repositorio
git init
git remote add origin https://github.com/tu-usuario/matriz-bci-inventario.git
git add .
git commit -m "Initial commit: Matriz Inventario Macros BCI v2.0"
git push -u origin main
```

### 2. Desplegar en Netlify

1. Ir a [netlify.com](https://netlify.com)
2. Clickear **Add new site** → **Import an existing project**
3. Conectar GitHub y seleccionar el repositorio
4. Configurar:
   - **Build command:** `./build.sh` (o dejar vacío si no hay build)
   - **Publish directory:** `.` (raíz del proyecto)

### 3. Configurar Variables de Entorno

En **Netlify → Site settings → Build & deploy → Environment**:

```
ANTHROPIC_API_KEY = sk-ant-...  (tu API key de Anthropic)
```

### 4. Redeploy después de cambios

```bash
git add .
git commit -m "Fix: arreglar login y modo local"
git push origin main
# Netlify despliega automáticamente
```

## Características Principales

### 🔐 Autenticación
- Login con email y contraseña
- Modo fallback local (sin backend requerido)
- Almacenamiento de sesión en `sessionStorage`
- Acceso root con clave maestra

### 📝 Formulario de Ficha
- 8 secciones: Identificación, Técnica, Funcionalidad, Dependencias, Uso, Impresión, Migración, Validación
- 45+ campos estructurados
- Validación de campos obligatorios
- Indicadores de progreso (% obligatorios y totales)

### 🤖 Claude AI Integration
- Análisis automático de archivos Excel
- Extracción de metadatos
- Relleno automático de campos
- Soporte para URLs de Google Drive

### 💾 Persistencia
- Almacenamiento local en `localStorage`
- Exportación a JSON (formato Migrador BCI)
- Exportación a CSV (reportes)
- Importación de JSONs previos

### 📊 Gestión de Datos
- Vista tipo tarjetas con expandible
- Filtros por departamento y complejidad
- Estadísticas en tiempo real
- Contador de macros por estado

## Estructura de Archivos

```
matriz-bci-inventario/
├── index.html              # Aplicación web completa (HTML + CSS + JS)
├── README.md              # Este archivo
├── .gitignore            # Archivos a ignorar en Git
├── netlify.toml          # Configuración de Netlify
├── _redirects            # Reglas de redirección
└── build.sh              # Script de build (inyecta API keys)
```

## API y Backend

### Modo Offline (Default)
La aplicación funciona completamente offline usando:
- `localStorage` para persistencia de datos
- Fallback de usuarios hardcodeados para login
- Claude AI API (requiere ANTHROPIC_API_KEY)

### Modo Online (Opcional)
Si deseas conectar Google Sheets:
1. Crear un Apps Script Web App en Google
2. Configurar `GAS_ENDPOINT` en `index.html`
3. Implementar endpoint `/login` y `/getMacros`

## Claude AI Configuration

### Usar Claude AI para análisis de Excel

La aplicación requiere una **API Key de Anthropic** para usar Claude AI.

#### Obtener tu API Key:
1. Ir a https://console.anthropic.com
2. Crear una cuenta o iniciar sesión
3. Generar una API Key
4. En Netlify (o localStorage para dev):
   ```
   ANTHROPIC_API_KEY = sk-ant-...
   ```

#### Uso:
- **Analizar Excel local:** Subir .xlsx y Claude extrae metadatos
- **Analizar desde Google Drive:** Pegar URL de Drive para análisis
- **Generación automática:** Los campos se rellenan inteligentemente

## Troubleshooting

### Login no funciona
- Verificar credenciales de demo en la tabla arriba
- Limpiar cookies/localStorage: F12 → Storage → Clear All
- Verificar que el navegador no está en incógnito

### Claude AI no responde
- Verificar que `ANTHROPIC_API_KEY` está configurada en Netlify
- Si es local: ingresar la key en el prompt que aparece
- Verificar límites de rate-limit en Anthropic Dashboard

### Los datos no se guardan
- Verificar que localStorage está habilitado
- En navegadores privados, los datos se pierden al cerrar
- Exportar a JSON antes de cerrar en modo privado

### Google Sheets no sincroniza
- El backend de Google Apps Script debe estar desplegado
- Configurar `GAS_ENDPOINT` con la URL correcta
- Verificar que el Apps Script tiene permisos de lectura/escritura

## Desarrollo

### Agregar nuevos campos al formulario

En `DEFAULT_SCHEMA` (línea ~491):

```javascript
{
  field_name: 'nuevo_campo',
  label: 'Etiqueta visible',
  type: 'text|select|textarea|multicheck|email|number',
  required: 'SI|NO',
  section: 'A|B|C|D|E|F|G|H',
  section_label: 'Nombre de la sección',
  options: ['opcion1', 'opcion2']  // Solo si type='select' o 'multicheck'
}
```

### Agregar nuevos usuarios de demo

En `loginFallbackCheck()` (línea ~595):

```javascript
{email:'nuevo@bci.cl', clave:'CLAVE2026', rol:'usuario', nombre:'Nombre Usuario'}
```

### Personalizar estilos

Las variables CSS están en `:root` (línea ~11). Cambiar colores, tipografía, spacing aquí.

## Contacto y Soporte

**Email:** soporte.aiwis@gmail.com  
**GitHub Issues:** https://github.com/tu-usuario/matriz-bci-inventario/issues  
**Responsable técnico:** Armin Salazar (armin.salazar@aiwis.cl)

## Licencia

Proyecto interno de AIWIS para Banco BCI. Uso restringido.

---

**Última actualización:** Mayo 2026  
**Estado del servidor:** ✅ Operativo
