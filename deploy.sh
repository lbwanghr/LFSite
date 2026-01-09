#!/bin/bash

# Deploy script for LFSite
# Builds both lonefondness (root) and pinger (subsite) into _site directory

set -e

# Suppress Sass deprecation warnings
export SASS_SILENCE_DEPRECATIONS=version-8_0

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
bundle install > /dev/null 2>&1
echo "   Building site..."
{
  bundle exec jekyll build --destination ../_site 2>&1 | grep -E "(Configuration|Source|Destination|Incremental|Generating|done in|Auto-regeneration)"
} || true
cd ..

# Build pinger site to _site/pinger (subsite)
echo "🏗️  Building pinger (sub-site)..."
cd pinger
echo "   Installing dependencies..."
bundle install > /dev/null 2>&1
echo "   Building site..."
{
  bundle exec jekyll build --baseurl /pinger --destination ../_site/pinger 2>&1 | grep -E "(Configuration|Source|Destination|Incremental|Generating|done in|Auto-regeneration)"
} || true
cd ..

# Build iboot site to _site/iboot (sub-site)
echo "🏗️  Building iboot (sub-site)..."
cd iboot
echo "   Installing dependencies..."
bundle install > /dev/null 2>&1
echo "   Building site..."
{
  bundle exec jekyll build --baseurl /iboot --destination ../_site/iboot 2>&1 | grep -E "(Configuration|Source|Destination|Incremental|Generating|done in|Auto-regeneration)"
} || true
cd ..

echo "✅ Build complete! Generated _site directory with:"
echo "   - lonefondness at /"
echo "   - pinger at /pinger"
echo "   - iboot at /iboot"
echo ""
echo "To serve locally: cd _site && python3 -m http.server 4000"
