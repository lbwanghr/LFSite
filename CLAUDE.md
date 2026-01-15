# LFSite 项目指南

## 项目概述
单一 Jekyll 站点，托管于 GitHub Pages (www.lonefondness.com)，展示多个 App Store 应用。

## 目录结构
```
/
├── site/                       # Jekyll 站点源码
│   ├── _config.yml
│   ├── _layouts/
│   ├── _data/apps.yml          # App 元数据
│   ├── assets/css/style.css
│   ├── Gemfile
│   ├── index.md                # 主站首页
│   │
│   ├── lonefondness/           # 各 App 目录
│   │   ├── index.md
│   │   ├── privacy.md
│   │   └── icon.png
│   ├── pinger/
│   ├── iboot/
│   └── power-event-wizard/
│
├── deploy.sh                   # 构建脚本
├── serve.sh                    # 本地测试
└── _site/                      # 构建输出
```

## 日常工作流

```bash
./deploy.sh    # 构建站点
./serve.sh     # 本地测试 http://127.0.0.1:4000
```

推送到 `main` 分支自动部署。

## 添加新 App

1. 创建 `site/new-app/` 目录
2. 添加 `index.md`、`privacy.md`、`icon.png`
3. 在 `site/_data/apps.yml` 添加：
```yaml
- name: New App
  slug: new-app
  tagline: App Tagline
  icon: new-app/icon.png
  platforms:
    - iOS
    - macOS
  app_store_url: https://apps.apple.com/app/...
```
4. 在 `site/_config.yml` 的 defaults 中添加配置

## App 图标
- 位置: `site/<app>/icon.png`
- 格式: PNG, 建议 180×180 或更大
