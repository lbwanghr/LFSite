#!/bin/bash

# Local serving script for testing generated _site

# Get the root directory (parent of scripts/)
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SITE_DIR="$ROOT_DIR/_site"

if [ ! -d "$SITE_DIR" ]; then
    echo "Error: _site directory not found!"
    echo "Please run ./deploy first to generate the site."
    exit 1
fi

echo "Starting local server..."
echo ""
echo "Visit http://localhost:4000 in your browser"
echo ""
echo "Press Ctrl+C to stop"

cd "$SITE_DIR"
python3 -m http.server 4000
