#!/bin/bash

# Local serving script for testing generated _site
# Requires: Python 3 (or python3)

cd "$(dirname "$0")"

if [ ! -d "_site" ]; then
    echo "❌ Error: _site directory not found!"
    echo "Please run ./deploy.sh first to generate the site."
    exit 1
fi

echo "🚀 Starting local server..."
echo "📍 Visit http://localhost:4000 in your browser"
echo "   - Root site (lonefondness): http://localhost:4000"
echo "   - Sub-site (pinger): http://localhost:4000/pinger"
echo "   - Sub-site (iboot): http://localhost:4000/iboot"
echo "   - Sub-site (power-event-wizard): http://localhost:4000/power-event-wizard"
echo ""
echo "Press Ctrl+C to stop the server"

cd _site
python3 -m http.server 4000
