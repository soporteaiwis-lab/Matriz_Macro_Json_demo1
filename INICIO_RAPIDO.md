# 🚀 Inicio Rápido — Matriz Inventario Macros BCI

## 📋 Credenciales de Prueba

Usa estas credenciales para probar la app:

| Usuario | Contraseña | Rol |
|---------|-----------|-----|
| `admin` | `admin` | Admin |
| `demo` | `demo` | Usuario |
| `armin` | `aiwis` | Admin |
| `armin.salazar@aiwis.cl` | `AIWIS2026` | Admin |
| `soporte.aiwis@gmail.com` | `SOPORTE2026` | Admin |

O usa **🔑 Acceso ROOT** (abajo del formulario de login) con clave: `aiwis` o `AIWIS2026`

---

## 🏃 Ejecutar Localmente

### Opción 1: Python (recomendado)
```bash
cd C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO
python3 -m http.server 8000
# Abrir: http://localhost:8000
```

### Opción 2: Node.js
```bash
npm install -g http-server
http-server . -p 8000 -o
```

### Opción 3: Visual Studio Code
1. Instalar extensión **Live Server**
2. Click derecho en `index.html` → **Open with Live Server**

---

## 📝 Usando la Aplicación

### 1️⃣ Iniciar Sesión
- Ingresa credenciales de prueba (arriba)
- O usa **🔑 ROOT** con clave: `aiwis`

### 2️⃣ Crear Nueva Ficha
- Click en **+ Nueva Ficha**
- Completa los campos obligatorios (marcados con *)
- La app muestra % de completitud

### 3️⃣ Usar Claude AI (Análisis automático)
Hay dos formas:

#### A) Analizar Excel Local
- Click en **📊 Analizar Excel Local**
- Sube un archivo .xlsx o .xlsm
- Claude AI extrae datos automáticamente

#### B) Analizar desde Google Drive
- Pega URL de Google Drive
- Click en **🔗 Analizar desde Drive URL**
- La app genera una ficha base

**⚠️ Requisito:** Configurar API Key de Anthropic (ver más abajo)

### 4️⃣ Guardar
- Click en **💾 Guardar en Google Sheets**
- Los datos se guardan en localStorage (local) o Google Sheets

### 5️⃣ Exportar
- **{ } Exportar JSON** — para el motor de migración
- **⬇ CSV** — para reportes en Excel
- **⬇ Importar JSON** — cargar ficha anterior

---

## 🤖 Configurar Claude AI

### Para usar análisis automático de Excel:

#### 1. Obtener API Key de Anthropic
1. Ir a https://console.anthropic.com
2. Crear cuenta o iniciar sesión
3. Ir a **API Keys**
4. Click en **Create Key**
5. Copiar la clave (empieza con `sk-ant-`)

#### 2. Configurar en la App

**Opción A - En local (desarrollo):**
- Cuando intentes usar Claude AI, la app te pide la key
- Ingrésala cuando te pida (se guarda en localStorage)

**Opción B - En Netlify (producción):**
1. Ir a https://netlify.com/apps/matriz-bci-inventario (tu sitio)
2. **Site settings** → **Build & deploy** → **Environment**
3. Click en **Edit variables**
4. Agregar:
   ```
   Key: ANTHROPIC_API_KEY
   Value: sk-ant-... (tu clave)
   ```
5. Click en **Save**
6. Ir a **Deploys** → Click en último deploy → **Trigger deploy**

---

## 💾 Persistencia de Datos

### Dónde se guardan los datos:

**Modo Local:**
- ✅ Se guardan en `localStorage` del navegador
- Los datos persisten al cerrar el navegador
- Se pierden si limpias cache/cookies

**Modo Google Sheets:**
- Si configuras `GAS_ENDPOINT`, se guardan también en Sheets
- (Requiere backend Apps Script — opcional)

### Cómo exportar tus datos:

1. Completa fichas
2. Click en **{ } Exportar JSON**
3. Guarda el archivo
4. Luego puedes importarlo en otro navegador o dispositivo

---

## 🔍 Campos del Formulario

La ficha tiene **8 secciones** con **45+ campos**:

- **A) Identificación** — Nombre, departamento, responsable, ruta
- **B) Características técnicas** — Version Office, formato, tamaño, código VBA
- **C) Funcionalidad** — Categoría, descripción, reglas de negocio
- **D) Dependencias** — Conexiones, sistemas, entrada/salida de datos
- **E) Uso y criticidad** — Frecuencia, usuarios, impacto de falla
- **F) Impresión** — ¿Imprime? Tipo de papel, márgenes
- **G) Migración** — Viabilidad, complejidad, destino, prioridad
- **H) Validación** — Criterios de cuadratura, datos de prueba

---

## 📊 Estadísticas

En la barra superior ves en tiempo real:
- **Total macros** — Fichas creadas
- **Completas 100%** — Campos obligatorios completos
- **Listas migrar** — Viabilidad alta
- **Con impresión** — Generan output físico
- **Alta/Crítica** — Complejidad alta o crítica

---

## 🎯 Flujo Típico de Trabajo

1. **Login** → credenciales de demo
2. **Importar JSON** (si tienes análisis previo) O **Analizar Excel** con Claude AI
3. **Completar campos** manualmente
4. **Revisar** estadísticas de completitud
5. **Guardar** localmente
6. **Exportar JSON** para el Migrador BCI

---

## 🆘 Problemas Comunes

### "Email o clave incorrectos"
✅ Usa credenciales de la tabla al inicio  
✅ O **🔑 ROOT** con clave: `aiwis`  
❌ Verifica que no hay espacios extra

### "Claude AI no responde"
✅ Verificar que API Key está configurada  
✅ Si es local: ingresar key cuando pida  
✅ Si es Netlify: redeploy después de agregar variable  
❌ No pasar clave en URL (siempre en variable segura)

### "Los datos no se guardan"
✅ Verificar que localStorage está habilitado  
✅ Exportar a JSON antes de cerrar en privado  
❌ No usar navegador privado (datos se pierden)

### "¿Cómo me veo en el navegador?"
🔗 Ir a `http://localhost:8000` (o tu URL de Netlify)

---

## 📚 Documentación Completa

- **README.md** — Overview del proyecto
- **SETUP_GITHUB_NETLIFY.md** — Configurar GitHub + Netlify

---

## 💬 Contacto

**Email:** soporte.aiwis@gmail.com  
**GitHub Issues:** Tu repositorio  
**Responsable:** Armin Salazar (armin.salazar@aiwis.cl)

---

**¡Listo para empezar!** 🎉
