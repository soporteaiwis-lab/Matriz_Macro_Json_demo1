#!/bin/bash
# ═══════════════════════════════════════════════════════
# MIGRADOR BCI — Build Script
# Inyecta GEMINI_API_KEY en el HTML estático
# AIWIS × CUBI-K · Armin Salazar
# ═══════════════════════════════════════════════════════

set -e
echo "🔨 MIGRADOR BCI — Build iniciado"

mkdir -p dist

# Detectar el archivo HTML fuente (acepta index.html o matriz_json_macro.html)
HTML_SRC=""
if [ -f "matriz_json_macro.html" ]; then
  HTML_SRC="matriz_json_macro.html"
  echo "📄 Fuente: matriz_json_macro.html"
elif [ -f "index.html" ]; then
  HTML_SRC="index.html"
  echo "📄 Fuente: index.html"
else
  echo "❌ Error: No se encontró matriz_json_macro.html ni index.html"
  exit 1
fi

# Copiar al directorio de build con ambos nombres
cp "$HTML_SRC" dist/index.html
cp "$HTML_SRC" dist/matriz_json_macro.html
echo "✅ HTML copiado a dist/"

# Inyectar la API Key de Gemini en el meta tag
if [ -n "$GEMINI_API_KEY" ]; then
  echo "✅ Inyectando GEMINI_API_KEY..."
  sed -i "s|GEMINI_API_KEY_PLACEHOLDER|${GEMINI_API_KEY}|g" dist/index.html
  sed -i "s|GEMINI_API_KEY_PLACEHOLDER|${GEMINI_API_KEY}|g" dist/matriz_json_macro.html
  echo "✅ API Key inyectada correctamente"
else
  echo "⚠️  GEMINI_API_KEY no configurada — IA no disponible sin key manual"
fi

# Copiar archivos JSON si existen
for f in *.json; do
  [ -f "$f" ] && cp "$f" dist/ && echo "📄 Copiado: $f"
done

# Copiar _redirects si existe en raíz (Netlify lo necesita en publish dir)
[ -f "_redirects" ] && cp "_redirects" dist/ && echo "📄 _redirects copiado"

echo ""
echo "✅ Build completado"
ls -la dist/
