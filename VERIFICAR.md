# ✅ Checklist de Verificación

## 🎯 Verificar que TODO funciona

Ejecuta estos pasos para confirmar que la app está lista:

### 1. Verificar Archivos del Proyecto
```bash
cd C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO
ls -la
```

Deberías ver:
- ✅ `index.html` (81 KB aprox)
- ✅ `README.md`
- ✅ `INICIO_RAPIDO.md`
- ✅ `SETUP_GITHUB_NETLIFY.md`
- ✅ `PASOS_FINALES.md`
- ✅ `package.json`
- ✅ `netlify.toml`
- ✅ `_redirects`
- ✅ `build.sh`
- ✅ `.gitignore`
- ✅ `.git` (carpeta con historial)

### 2. Verificar Git
```bash
git log --oneline
```

Deberías ver 3-4 commits:
```
4333626 Feat: Agregar guía final de pasos completados
307cfaa Add: Documentación completa y archivos de configuración
c205a05 Initial commit: Matriz Inventario Macros BCI v2.0
```

### 3. Iniciar Servidor Local
```bash
python3 -m http.server 8000
# O:
npm start
```

Salida esperada:
```
Serving HTTP on 0.0.0.0 port 8000 ...
```

### 4. Abrir en Navegador
```
http://localhost:8000
```

Deberías ver:
- ✅ Header con "Matriz de Inventario Macros Excel"
- ✅ Modal de login
- ✅ Campos de email y contraseña
- ✅ Botón "Ingresar"
- ✅ Opción 🔑 ROOT

### 5. Probar Login
**Opción A:**
- Email: `admin`
- Contraseña: `admin`
- Click "Ingresar"

**Opción B:**
- Clave master: `aiwis`
- Click 🔑 ROOT

Resultado esperado:
- ✅ Modal desaparece
- ✅ Aparece "Admin Demo" en esquina superior derecha
- ✅ Aparece barra con botones
- ✅ Se ve sección de importar/analizar
- ✅ Se ve lista de macros (vacía)

### 6. Probar Nueva Ficha
- Click en **+ Nueva Ficha**
- Completa:
  - Nombre del archivo: `Test_Macro_001`
  - Departamento: `Testing`
  - Responsable: `Test User`
  - Email: `test@test.com`
  - Ruta: `/test/path`
  - Otros campos opcionales
- Click **💾 Guardar en Google Sheets**

Resultado esperado:
- ✅ Toast verde con "Guardado localmente"
- ✅ La ficha aparece en la lista
- ✅ Puedes expandirla (click en tarjeta)

### 7. Probar Exportar
- Click **{ } Exportar JSON**

Resultado esperado:
- ✅ Se descarga archivo `Inventario_Macros_BCI_[fecha].json`
- ✅ Contiene tus datos

### 8. Probar Claude AI (Opcional)
**Requisito:** API Key de Anthropic configurada

Si tienes la key:
- Click **📊 Analizar Excel Local**
- Sube un archivo .xlsx
- Debería decir "Analizando con CLAUDE AI..."
- Los campos se rellenan automáticamente

### 9. Probar Logout
- Click **Salir** (esquina superior derecha)
- Modal de login reaparece
- Sesión se cierra

---

## 🟢 Si Todo Pasa ✅

¡Excelente! Tu app está lista para:
1. Guardar en GitHub (`git push`)
2. Desplegar en Netlify
3. Usar en producción

---

## 🔴 Si Algo Falla ❌

| Problema | Solución |
|----------|----------|
| Login no funciona | Limpia localStorage: F12 → Storage → Clear All |
| Archivos no se descarga | Verificar que descarga está habilitada en navegador |
| Claude AI no funciona | Configurar ANTHROPIC_API_KEY en Netlify |
| Servidor no inicia | Verificar puerto 8000 no está en uso: `netstat -an \| grep 8000` |
| Git error | Asegúrate de estar en `C:\AIWIS\CUBI-K\MATRIZ_JSON_MACK_DEMO` |

---

## 📝 Notas

- **Datos locales:** Se guardan en localStorage, se pierden al limpiar cache
- **API Key:** Nunca guardar en código, siempre en variables de Netlify
- **Navegador privado:** Los datos se pierden al cerrar
- **Soporte a usuarios:** Ver `INICIO_RAPIDO.md`

---

## ✅ Checklist de Lanzamiento

- [ ] Verificar que todos los archivos están presentes
- [ ] Git funciona y tiene commits
- [ ] Servidor local inicia sin errores
- [ ] Login funciona
- [ ] Nueva ficha se crea y guarda
- [ ] Exportar JSON/CSV funciona
- [ ] Puedo cerrar sesión

**Si todos los puntos están ✅, ¡estás listo!**

---

**Siguiente paso:** Ver `SETUP_GITHUB_NETLIFY.md` para desplegar en GitHub y Netlify

Fecha: 25 de mayo de 2026
