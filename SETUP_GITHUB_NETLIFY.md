# Guía de Configuración: GitHub + Netlify + Anthropic API

## 🚀 Paso 1: Crear Repositorio en GitHub

### 1.1 Crear nuevo repositorio

1. Ir a https://github.com/new
2. Completar:
   - **Repository name:** `matriz-bci-inventario`
   - **Description:** Sistema de inventario de macros Excel para migración a Google Sheets
   - **Public** (o Private si prefieres)
   - NO inicializar con README (ya tenemos uno)

3. Click en **Create repository**

### 1.2 Conectar el repositorio local con GitHub

```bash
# En la carpeta del proyecto (ya está en C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO)
cd C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO

# Cambiar el origin remoto (reemplazar con tu usuario)
git remote add origin https://github.com/TU_USUARIO/matriz-bci-inventario.git

# Renombrar rama a 'main' (si es necesario)
git branch -M main

# Hacer push del commit inicial
git push -u origin main
```

**Resultado esperado:** El código está ahora en GitHub

---

## 🌐 Paso 2: Configurar en Netlify

### 2.1 Crear cuenta en Netlify

1. Ir a https://netlify.com
2. Click en **Sign up** 
3. Conectar con GitHub (recomendado)

### 2.2 Desplegar desde GitHub

1. En Netlify, ir a **Add new site** → **Import an existing project**
2. Seleccionar **GitHub**
3. Buscar y seleccionar `matriz-bci-inventario`
4. Dejar configuración por defecto:
   - **Build command:** (vacío — sitio estático)
   - **Publish directory:** `.` (raíz del proyecto)

5. Click en **Deploy site**

**Resultado esperado:** El sitio está desplegado en una URL como `https://[random-name].netlify.app`

### 2.3 Configurar dominio personalizado (opcional)

En Netlify:
1. **Site settings** → **Domain management**
2. **Add custom domain** (si tienes dominio propio)

---

## 🔑 Paso 3: Configurar API de Anthropic

### 3.1 Crear cuenta en Anthropic

1. Ir a https://console.anthropic.com
2. Sign up o Log in
3. Ir a **API Keys**
4. Click en **Create Key**
5. Copiar la clave (empieza con `sk-ant-`)

**⚠️ IMPORTANTE:** No compartir esta clave públicamente

### 3.2 Configurar variable de entorno en Netlify

1. En Netlify, ir a **Site settings** → **Build & deploy** → **Environment**
2. Click en **Edit variables**
3. Agregar:
   - **Key:** `ANTHROPIC_API_KEY`
   - **Value:** `sk-ant-...` (tu API key)
4. Click en **Save**

### 3.3 Redeploy el sitio

En Netlify → **Deploys** → Click en el último deploy → **Trigger deploy**

**Resultado esperado:** El sitio se redeploy con la API key configurada

---

## ✅ Paso 4: Verificar que todo funciona

### 4.1 Probar en local

```bash
# Iniciar servidor local
npm start
# O si no tienes npm:
python3 -m http.server 8000
```

Ir a `http://localhost:8000` y probar:
- **Login con:** `admin` / `admin`
- **Crear nueva ficha** 
- **Analizar Excel con Claude AI**
- **Exportar JSON**

### 4.2 Probar en producción

1. Ir a tu URL de Netlify (ej: https://matriz-bci.netlify.app)
2. Probar login
3. Probar Claude AI (debería funcionar con la API key configurada)

---

## 📝 Paso 5: Hacer cambios y actualizar

Cada vez que hagas cambios:

```bash
# Ir a la carpeta del proyecto
cd C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO

# Hacer cambios en index.html o archivos

# Commit
git add .
git commit -m "Fix: descripción del cambio"

# Push a GitHub
git push origin main

# Netlify despliega automáticamente ✨
```

---

## 🆘 Troubleshooting

### El sitio no se ve bien en Netlify
- Verificar que `_redirects` está en la raíz
- En Netlify → **Deploys** → ver logs de build

### Claude AI no funciona en producción
- Verificar que `ANTHROPIC_API_KEY` está configurada
- Ir a **Site settings** → **Build & deploy** → **Environment** y revisar
- Hacer redeploy después de cambiar variables

### El login falla
- Credenciales de prueba:
  - **admin** / **admin**
  - **demo** / **demo**
  - **armin.salazar@aiwis.cl** / **AIWIS2026**
- Limpiar cookies/localStorage del navegador (F12 → Storage → Clear All)

### Los datos no se guardan
- Verificar que localStorage está habilitado
- En navegadores privados los datos se pierden al cerrar
- Exportar a JSON antes de cerrar

---

## 📧 Contacto

- **Email:** soporte.aiwis@gmail.com
- **Responsable técnico:** Armin Salazar

---

**¡Listo!** Tu aplicación está ahora en GitHub y desplegada en Netlify con Claude AI integrado.
