# Copilot Instructions for LFSite

## Project Overview
LFSite is a Jekyll-based multi-site hosting setup:
- **Root site**: Lone Fondness at repository root.
- **Sub-sites**: Each lives in its own folder (e.g., `/pinger`, `/iboot`, and future additions), each with its own Jekyll config, layouts, and assets.

Root and all sub-sites build into `_site` via `deploy.sh` and are deployed together to GitHub Pages.
