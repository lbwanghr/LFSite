# Copilot Instructions for LFSite

## Project Overview
LFSite is a Jekyll-based multi-site hosting setup:
- **Root site**: Lone Fondness at repository root.
- **Sub-sites**: Each lives in its own folder (e.g., `/pinger`, `/iboot`, `/power-event-wizard`, and future additions), each with its own Jekyll config, layouts, and assets.

Root and all sub-sites build into `_site` via `deploy.sh` and are deployed together to GitHub Pages.

## Adding a New Sub-site

When adding a new sub-site, the following files must be created and updated:

### Required Sub-site Files
- `_config.yml` - Jekyll configuration with `baseurl` set to the sub-site path
- `_layouts/default.html` - Main layout template
- `Gemfile` - Gem dependencies (include `jekyll`, `webrick`, and for Ruby 4.0+: `logger`, `csv`, `base64`)
- `assets/css/style.css` - Stylesheet
- `index.md` - Home page with `---layout: page---` front matter
- `privacy.md` (optional) - Privacy policy with `---layout: page---` front matter

### Required Script Updates
1. **`deploy.sh`** - Add a new build section for the sub-site:
   ```bash
   # Build <sitename> site to _site/<sitename> (sub-site)
   echo "🏗️  Building <sitename> (sub-site)..."
   cd <sitename>
   echo "   Installing dependencies..."
   bundle install > /dev/null 2>&1
   echo "   Building site..."
   {
     bundle exec jekyll build --baseurl /<sitename> --destination ../_site/<sitename> 2>&1 | grep -E "(Configuration|Source|Destination|Incremental|Generating|done in|Auto-regeneration)"
   } || true
   cd ..
   ```
   Also update the final success message to include the new sub-site.

2. **`serve-local.sh`** - Add the new sub-site to the information output:
   ```bash
   echo "   - Sub-site (<sitename>): http://localhost:4000/<sitename>"
   ```

### Example
For a new `my-app` sub-site:
- Add build section in `deploy.sh` with `cd my-app` and `--baseurl /my-app`
- Add output line in `serve-local.sh`: `echo "   - Sub-site (my-app): http://localhost:4000/my-app"`
