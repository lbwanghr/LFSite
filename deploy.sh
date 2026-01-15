#!/bin/bash

# Deploy script for LFSite
# Builds the unified Jekyll site

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SITE_SRC="$ROOT_DIR/site"
SITE_OUT="$ROOT_DIR/_site"

# Suppress Sass deprecation warnings
export SASS_SILENCE_DEPRECATIONS=version-8_0

echo "Building LFSite..."

# Remove old _site directory if it exists
if [ -d "$SITE_OUT" ]; then
    echo "Cleaning old _site directory..."
    rm -rf "$SITE_OUT"
fi

# Build site
cd "$SITE_SRC"
echo "Installing dependencies..."
bundle install > /dev/null 2>&1
echo "Building site..."
bundle exec jekyll build --destination "$SITE_OUT" 2>&1 | grep -E "(Configuration|Source|Destination|Generating|done in)" || true

echo ""
echo "Build complete!"
echo "Site available at _site/"
