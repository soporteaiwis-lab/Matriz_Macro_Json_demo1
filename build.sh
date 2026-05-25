#!/bin/bash
set -e
echo "🔨 MIGRADOR BCI — Build v3 (Claude AI)"
mkdir -p dist

HTML_SRC=""
if   [ -f "matriz_json_macro.html" ]; then HTML_SRC="matriz_json_macro.html"
elif [ -f "index.html" ];             then HTML_SRC="index.html"
else echo "❌ No se encontró el HTML fuente" && exit 1
fi
echo "📄 Fuente: $HTML_SRC"

cp "$HTML_SRC" dist/index.html
cp "$HTML_SRC" dist/matriz_json_macro.html

# Inyectar ANTHROPIC_API_KEY (Claude AI)
if [ -n "$ANTHROPIC_API_KEY" ]; then
  sed -i "s|ANTHROPIC_API_KEY_PLACEHOLDER|${ANTHROPIC_API_KEY}|g" dist/index.html
  sed -i "s|ANTHROPIC_API_KEY_PLACEHOLDER|${ANTHROPIC_API_KEY}|g" dist/matriz_json_macro.html
  echo "✅ ANTHROPIC_API_KEY inyectada (Claude AI)"
else
  echo "⚠️  ANTHROPIC_API_KEY no configurada en Netlify"
  echo "   Agregar en: Netlify → Site config → Environment variables"
  echo "   Key: ANTHROPIC_API_KEY"
fi

[ -f "_redirects" ] && cp "_redirects" dist/
for f in *.json; do [ -f "$f" ] && cp "$f" dist/; done

echo "✅ Build OK"
ls -la dist/
