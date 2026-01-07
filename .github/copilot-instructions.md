# Copilot Instructions for LFSite

## Project Overview
LFSite is a Jekyll-based multi-site hosting setup:
- **Root site**: Lone Fondness (a 3-player card game) - theme-based Jekyll at root
- **Pinger sub-site**: Product site for network monitoring app (iOS/macOS), fully custom HTML/CSS, located in `/pinger/`

Both sites are independently deployed to GitHub Pages with separate configurations.

## Architecture & Key Files

### Root Site Structure
- `_config.yml` - Main Jekyll config (uses Cayman remote theme)
- `_layouts/default.html` - Custom header with navigation, footer with email support
- `assets/css/style.scss` - SCSS styling (compiled to CSS)
- Content: `index.markdown`, `about.markdown`, `privacy.md`, `server.md`

### Pinger Sub-site (/pinger/)
**Critical**: Pinger is a **completely independent Jekyll site** with own `_config.yml`, layouts, and styling.

#### Key Files:
- `pinger/_config.yml` - baseurl: "/pinger", uses custom themes
- `pinger/_layouts/` - home.html, page.html, default.html (custom, NOT inherited from root)
- `pinger/index.md` - Complex YAML Front Matter with hero section & features array
- `pinger/assets/css/style.css` - Standalone CSS (not SCSS)
- `pinger/Makefile` - build/serve commands with custom baseurl handling

#### Pinger Layouts Pattern:
Layout files use YAML Front Matter structure with nested objects:
```yaml
---
layout: home
hero:
  title: Pinger
  tagline: Make Ping a Pleasure
features:
  title: Core Features
  items:
    - icon: 📊
      title: Real-time Monitoring
      description: ...
---
```

### Deployment & CI/CD
- **GitHub Actions**: `.github/workflows/jekyll-gh-pages.yml` - Builds on push
- **GitHub Pages integration**: Root deploys to `https://lonefondness.com`, Pinger to `/pinger/`
- **Baseurl configuration**: 
  - Root: no baseurl specified
  - Pinger: `baseurl: "/pinger"` in _config.yml AND `--baseurl "/pinger"` in build command

## Developer Workflows

### Local Development

#### Root Site:
```bash
bundle install
bundle exec jekyll serve  # localhost:4000
```

#### Pinger Sub-site:
```bash
cd pinger
make install     # bundle install --path vendor/bundle
make serve       # bundle exec jekyll serve --baseurl "" --livereload
make build       # bundle exec jekyll build --baseurl "/pinger"
make clean       # Remove build artifacts
```

**Important**: Pinger uses `--baseurl ""` for local testing (not `"/pinger"`), but builds with `--baseurl "/pinger"` for production.

### Testing Checklist
- Local: Run Pinger in `/pinger` directory, not root
- Remote links: Use `/pinger/path` in Pinger's links when deployed
- Style changes: Pinger uses standalone CSS, not root's SCSS
- New pages in Pinger: Must use Pinger's layout templates, not root's

## Conventions & Patterns

### Content Structure
- **Markdown files**: Use Front Matter with `layout:` and `title:`, `description:` fields
- **URLs**: Markdown files become pretty-printed URLs (e.g., `privacy.md` → `/privacy/`)
- **Pinger special**: Features/Use Cases are data-driven via YAML arrays, not static HTML

### HTML/Layout Conventions
- **Root layouts**: Use Cayman theme base, custom header with emoji icons for nav
- **Pinger layouts**: Fully custom; home.html uses YAML data to generate feature cards, page.html for simple content
- **CSS**: Root uses SCSS (compiles to CSS), Pinger uses plain CSS
- **Icons**: Emoji convention throughout (📊, 🚀, etc.)

### Jekyll-Specific
- **Gemfile**: Both use `github-pages` gem for compatibility
- **Exclude patterns**: Each site excludes `vendor/`, `node_modules/`, build artifacts
- **Permalink format**: `pretty` (no .html extensions in URLs)

## Critical Gotchas

1. **Baseurl management**: Don't mix `--baseurl ""` and `--baseurl "/pinger"`. Use empty string for local dev, "/pinger" for builds.

2. **Layout inheritance**: Pinger layouts are NOT inherited from root. Each has full custom implementation. Changes to root don't affect Pinger.

3. **CSS paths**: Pinger uses CSS directly, not SCSS. Root uses SCSS. Don't confuse their compile pipelines.

4. **Directory context**: When editing Pinger files, most commands (make, jekyll) must be run from `/pinger/` directory, not root.

5. **GitHub Pages build**: The jekyll-gh-pages workflow builds the entire root directory, which includes Pinger. Ensure both _config.yml files are valid.

## File Purpose Reference

| File | Purpose |
|------|---------|
| `_config.yml` | Root site config, Cayman theme |
| `pinger/_config.yml` | Pinger config, custom theme, baseurl="/pinger" |
| `_layouts/default.html` | Root header/footer template |
| `pinger/_layouts/home.html` | Pinger hero + features page template |
| `pinger/Makefile` | Development automation for Pinger |
| `pinger/LOCAL-TESTING.md` | Detailed setup instructions (Ruby, dependencies) |
| `.github/workflows/jekyll-gh-pages.yml` | CI/CD pipeline (auto-builds on push) |
