# LFSite 项目指南

## 项目概述
单一 Jekyll 站点，托管于 GitHub Pages (www.lonefondness.com)，展示多个 App Store 应用。

## 目录结构
```
/
├── site/                       # Jekyll 站点源码
│   ├── _config.yml             # 统一配置
│   ├── _layouts/               # 共享布局
│   ├── _data/apps.yml          # App 元数据
│   ├── assets/css/style.css    # 统一样式
│   ├── Gemfile                 # 唯一依赖文件
│   ├── index.md                # 主站首页（聚合展示）
│   │
│   ├── lonefondness/           # 卡牌游戏 app
│   │   ├── index.md
│   │   ├── privacy.md
│   │   ├── server.md
│   │   └── icon.png            # App 图标
│   ├── pinger/                 # 网络监测 app
│   ├── iboot/                  # 启动磁盘快捷方式 app
│   └── power-event-wizard/     # 电源调度 app
│
├── scripts/
│   ├── deploy.sh
│   └── serve.sh
├── deploy                      # 便捷入口
├── serve                       # 便捷入口
└── _site/                      # 构建输出（gitignore）
```

## 日常工作流

### 维护内容
编辑 `site/<app>/` 下的 `.md` 文件即可。

### 本地测试
```bash
./deploy    # 构建站点
./serve     # 启动 http://localhost:4000
```

### 部署
推送到 `main` 分支，GitHub Actions 自动构建部署。

## 添加新 App

1. 创建 `site/new-app/` 目录
2. 添加内容文件：
   - `index.md`（App 介绍）
   - `privacy.md`（隐私政策）
   - `icon.png`（App 图标，建议 180x180 或更大）
3. 在 `site/_data/apps.yml` 添加 App 元数据
4. 在 `site/_config.yml` 的 defaults 中添加配置

## App 图标规范

- **位置**: `site/<app>/icon.png`
- **格式**: PNG
- **尺寸**: 建议 180x180 像素或更大（会自动缩放显示）
- **样式**: 建议使用 App Store 图标，带圆角

## 技术要点
- 单一 Jekyll 4.3 引擎
- 共享布局和样式
- `_data/apps.yml` 驱动首页聚合展示
