#!/bin/bash
# ═══════════════════════════════════════════════════════
# MIGRADOR BCI — Build Script
# Inyecta GEMINI_API_KEY en el HTML estático
# ═══════════════════════════════════════════════════════

set -e
echo "🔨 MIGRADOR BCI — Build iniciado"

mkdir -p dist

# Verificar que existe el HTML fuente
if [ ! -f "matriz_json_macro.html" ]; then
  echo "❌ Error: matriz_json_macro.html no encontrado"
  exit 1
fi

# Copiar HTML base al directorio de build
cp matriz_json_macro.html dist/index.html
cp matriz_json_macro.html dist/matriz_json_macro.html

# Inyectar la API Key de Gemini en el meta tag
if [ -n "$GEMINI_API_KEY" ]; then
  echo "✅ Inyectando GEMINI_API_KEY en el HTML..."
  sed -i "s|GEMINI_API_KEY_PLACEHOLDER|${GEMINI_API_KEY}|g" dist/index.html
  sed -i "s|GEMINI_API_KEY_PLACEHOLDER|${GEMINI_API_KEY}|g" dist/matriz_json_macro.html
  echo "✅ API Key inyectada correctamente"
else
  echo "⚠️  GEMINI_API_KEY no configurada en Netlify Environment Variables"
  echo "   La función de análisis con IA no estará disponible"
  echo "   Configurar en: Netlify → Site config → Environment variables"
fi

# Copiar archivos adicionales si existen
for f in *.json; do
  [ -f "$f" ] && cp "$f" dist/ && echo "📄 Copiado: $f"
done

echo "✅ Build completado — dist/ listo para deploy"
ls -la dist/
