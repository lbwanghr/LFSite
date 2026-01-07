#!/bin/bash

# Deploy script for LFSite
# Builds both lonefondness (root) and pinger (subsite) into _site directory

set -e

echo "🔨 Building LFSite..."

# Remove old _site directory if it exists
if [ -d "_site" ]; then
    echo "📦 Cleaning old _site directory..."
    rm -rf _site
fi

# Build lonefondness site to _site (root)
echo "🏗️  Building lonefondness (root site)..."
cd lonefondness
echo "   Installing dependencies..."
bundle install
echo "   Building site..."
bundle exec jekyll build --destination ../_site
cd ..

# Build pinger site to _site/pinger (subsite)
echo "🏗️  Building pinger (sub-site)..."
cd pinger
echo "   Installing dependencies..."
bundle install
echo "   Building site..."
bundle exec jekyll build --baseurl /pinger --destination ../_site/pinger
cd ..

echo "✅ Build complete! Generated _site directory with:"
echo "   - lonefondness at /"
echo "   - pinger at /pinger"
echo ""
echo "To serve locally: cd _site && python3 -m http.server 4000"
