# LFSite 部署指南

本项目是一个 Jekyll 多站点托管设置，包含：
- **根网站**: Lone Fondness (lonefondness/) - 3人卡牌游戏
- **子网站**: Pinger (pinger/) - iOS/macOS 网络监测应用

## 本地开发

### 1. 生成静态网站

运行部署脚本，该脚本会构建两个 Jekyll 站点到 `_site` 目录：

```bash
./deploy.sh
```

输出结构：
- `/` - lonefondness 站点
- `/pinger` - Pinger 子站点

### 2. 本地测试

生成 _site 后，可以在本地启动一个简单的 HTTP 服务器：

```bash
./serve-local.sh
```

然后访问：
- **根站点**: http://localhost:4000
- **子站点**: http://localhost:4000/pinger

## GitHub Pages 部署

### 自动部署

项目已配置 GitHub Actions workflow (`.github/workflows/jekyll-gh-pages.yml`)：

1. 推送到 `main` 分支会自动触发构建和部署
2. 构建过程：
   - 检出代码
   - 安装 Ruby 依赖
   - 构建 lonefondness（输出到 `_site`）
   - 构建 pinger（输出到 `_site/pinger`）
   - 上传构建产物到 GitHub Pages

### 手动触发

可以在 GitHub Actions 标签页手动运行 "Deploy Jekyll with GitHub Pages dependencies preinstalled" workflow

### 配置要求

- 在 GitHub 仓库设置中，将 GitHub Pages 源设置为"GitHub Actions"
- 确保 GitHub Actions 权限允许读写权限

## 项目结构

```
LFSite/
├── lonefondness/           # 根网站源代码
│   ├── _config.yml
│   ├── Gemfile
│   ├── _layouts/
│   ├── assets/
│   └── ...
├── pinger/                 # 子网站源代码
│   ├── _config.yml
│   ├── Gemfile
│   ├── _layouts/
│   ├── assets/
│   └── ...
├── _site/                  # 生成的静态网站（git 忽略）
├── deploy.sh               # 构建脚本
├── serve-local.sh          # 本地服务脚本
└── .github/workflows/      # GitHub Actions 配置
```

## 配置说明

### lonefondness/_config.yml
- 使用 `pages-themes/cayman` 远程主题
- 排除 pinger、vendor 等文件夹

### pinger/_config.yml
- 设置 `baseurl: /pinger` 用于子路径托管
- 自定义 HTML/CSS

## 依赖

- Ruby 3.2+
- Bundler
- Jekyll 4.3
- Python 3（用于本地服务）

## 故障排查

### 构建失败

1. 清除缓存：
   ```bash
   rm -rf lonefondness/.bundle lonefondness/Gemfile.lock
   rm -rf pinger/.bundle pinger/Gemfile.lock
   ```

2. 重新运行：
   ```bash
   ./deploy.sh
   ```

### Ruby 版本问题

如果使用 Ruby 4.0+，需要在 Gemfile 中添加：
```ruby
gem "logger"
```

## 更新流程

1. 编辑 `lonefondness/` 或 `pinger/` 目录中的内容
2. 运行 `./deploy.sh` 验证本地生成
3. 在浏览器中访问 `http://localhost:4000` 测试
4. 提交更改到 `main` 分支
5. GitHub Actions 自动构建并部署到 GitHub Pages
