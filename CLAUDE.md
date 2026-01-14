# LFSite 项目指南

## 项目概述
这是一个 Jekyll 多站点项目，托管于 GitHub Pages (www.lonefondness.com)，采用单一代码库管理多个子站点。

## 站点结构
- `lonefondness/` - 根站点（3人卡牌游戏）→ /
- `pinger/` - 子站点（iOS/macOS 网络监测）→ /pinger
- `iboot/` - 子站点（macOS 启动磁盘快捷方式）→ /iboot
- `power-event-wizard/` - 子站点（macOS 电源调度）→ /power-event-wizard

## 核心工作流

### 日常维护
只需编辑各站点目录下的 `.md` 文件，无需关心构建细节。

### 本地测试
```bash
./deploy.sh      # 构建所有站点到 _site/
./serve-local.sh # 启动本地服务器 http://localhost:4000
```

### 部署
推送到 `main` 分支后，GitHub Actions 自动执行 `deploy.sh` 并部署到 GitHub Pages。

## 添加新子站点清单
1. 创建目录：`new-site/`
2. 必要文件：
   - `_config.yml` (必须设置 `baseurl: "/new-site"`)
   - `_layouts/default.html`
   - `Gemfile` (包含 jekyll, webrick, logger, csv, base64)
   - `index.md` (front matter: `layout: page`)
   - `privacy.md` (隐私政策)
3. 更新脚本：
   - `deploy.sh` - 添加构建段落
   - `serve-local.sh` - 添加 URL 提示行

## 技术要点
- Jekyll 4.3 + Ruby
- 使用 `SASS_SILENCE_DEPRECATIONS=version-8_0` 抑制 Sass 警告
- 子站点通过 `--baseurl` 和 `--destination` 参数隔离构建
- `_site/` 目录是构建产物，已被 .gitignore 忽略

## 注意事项
- 根站点 `_config.yml` 的 `exclude` 需排除所有子站点目录
- 各站点 Gemfile 需包含 Ruby 4.0+ 兼容依赖
- Markdown 文件头部需要 front matter（如 `layout: page`）
