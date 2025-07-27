#!/bin/bash
set -e

# 1. Rename _astro to astro_assets
if [ -d "dist/_astro" ]; then
  mv dist/_astro dist/astro_assets
fi

# 2. Replace all references in HTML files
find dist -name "*.html" -exec sed -i '' 's|/_astro/|/astro_assets/|g' {} +

# 3. Move everything from dist to root, overwriting
cp -Rf dist/* ../
