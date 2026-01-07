# Jekyll 项目快速配置指南

## 问题诊断与解决过程

### 遇到的关键问题

1. **Ruby 4.0 兼容性**
   - **问题**: Ruby 4.0.0 移除了 `csv`, `base64`, `bigdecimal`, `logger` 等标准库 gem
   - **表现**: `cannot load such file -- csv (LoadError)`
   - **解决**: 在 Gemfile 中显式添加这些依赖

2. **Jekyll 版本不兼容**
   - **问题**: `github-pages` gem 使用 Jekyll 3.9.0，依赖 Liquid 4.0.3，与 Ruby 4.0 不兼容
   - **表现**: `undefined method 'tainted?' for an instance of String`
   - **解决**: 改用 Jekyll 4.x（4.3+），原生支持 Ruby 4.0

3. **Jekyll SEO 标签问题**
   - **问题**: `_layouts/default.html` 中有 `{% seo %}` 标签，但未安装 `jekyll-seo-tag` 插件
   - **表现**: `Liquid syntax error: Unknown tag 'seo'`
   - **解决**: 移除该标签或安装插件

4. **工作目录混淆**
   - **问题**: bundle exec 在根目录执行，读取错误的 Gemfile.lock
   - **表现**: 找不到 pinger 目录安装的 gems
   - **解决**: 使用脚本确保在正确目录执行

## 最小化 Jekyll 项目配置

### 核心文件结构

```
pinger/
├── _config.yml          # Jekyll 配置
├── _layouts/            # 布局模板
│   ├── default.html     # 基础布局
│   ├── home.html        # 首页布局
│   └── page.html        # 页面布局
├── assets/css/          # 样式文件
│   └── style.css
├── index.md             # 首页内容
├── privacy.md           # 其他页面
├── Gemfile              # Ruby 依赖
└── serve.sh             # 启动脚本（可选）
```

### 精简 Gemfile（Ruby 4.0+）

```ruby
source "https://rubygems.org"

# Ruby 4.0+ 必需的标准库 gems
gem "csv"
gem "base64"
gem "bigdecimal"
gem "logger"

# Jekyll 4.x（支持 Ruby 4.0）
gem "jekyll", "~> 4.3"
gem "webrick", "~> 1.8"  # 开发服务器依赖
```

### 最小化 _config.yml

```yaml
title: Your Site Name
description: Your site description
baseurl: ""  # 本地开发为空，生产可设置如 "/subpath"
url: "https://yourdomain.com"
```

**不需要的配置**：
- `theme:` - 使用自定义布局时不需要
- `plugins:` - 最小化项目可不配置插件
- 复杂的 defaults, collections 等

### 布局文件注意事项

#### default.html 模板

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ page.title | default: site.title }}</title>
    <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
</head>
<body>
    {{ content }}
</body>
</html>
```

**避免的陷阱**：
- ❌ 不要使用 `{% seo %}` 标签（除非安装了 jekyll-seo-tag 插件）
- ✅ 手动添加 meta 标签即可

#### 使用布局的 Markdown 文件

```markdown
---
layout: default
title: Page Title
---

# Content Here

Your markdown content
```

## 开发工作流

### 1. 初始化项目

```bash
cd your-project
bundle config set --local path 'vendor/bundle'
bundle install
```

### 2. 本地开发

```bash
bundle exec jekyll serve --baseurl ""
```

访问: `http://127.0.0.1:4000/`

### 3. 生产构建

```bash
bundle exec jekyll build --baseurl "/yourpath"
```

输出到 `_site/` 目录

### 4. 清理缓存（遇到问题时）

```bash
rm -rf _site .jekyll-cache
bundle exec jekyll serve --baseurl ""
```

## 关键要点总结

### Ruby 4.0 兼容性清单

- ✅ 显式添加 `csv`, `base64`, `bigdecimal`, `logger` gems
- ✅ 使用 Jekyll 4.3+ （不使用 github-pages gem）
- ✅ 使用 bundle config 指定本地 vendor/bundle 路径

### 布局与模板

- ✅ 使用 Liquid 语法: `{{ variable }}` 和 `{% tag %}`
- ✅ Front Matter 必须在文件开头
- ✅ 移除未安装插件的标签（如 `{% seo %}`）
- ✅ 使用 `| relative_url` 过滤器处理资源路径

### 文件路径

- ✅ 本地开发: `--baseurl ""`
- ✅ GitHub Pages子目录: `--baseurl "/subpath"`
- ✅ CSS/JS 路径: 使用 `{{ '/assets/css/style.css' | relative_url }}`

### 常见错误

1. **Liquid syntax error**: 检查是否使用了未安装插件的标签
2. **LoadError**: 添加对应的 gem 到 Gemfile
3. **找不到 gems**: 确保在正确目录执行 bundle exec
4. **样式未加载**: 检查 baseurl 配置和 relative_url 过滤器使用

## 快速启动脚本（推荐）

创建 `serve.sh`:

```bash
#!/bin/bash
cd "$(dirname "$0")"
bundle exec jekyll serve --baseurl ""
```

使用：
```bash
chmod +x serve.sh
./serve.sh
```

## 与 GitHub Pages 集成

如果需要部署到 GitHub Pages：

1. **根目录项目**: baseurl 留空
2. **子目录项目**: 在 _config.yml 设置 `baseurl: "/subdir"`
3. **构建时**: 使用 `--baseurl` 参数覆盖配置
4. **本地测试**: 始终用 `--baseurl ""`

## 总结

最小化 Jekyll 项目只需要：
- 6 个 gems (Jekyll 4.x + Ruby 4.0 必需库)
- 简单的 _config.yml (3-5 行)
- 自定义 _layouts/ 模板
- Markdown 内容文件

**核心原则**：
1. 保持 Gemfile 精简
2. 移除不需要的插件
3. 使用脚本确保工作目录正确
4. 理解 baseurl 的本地与生产差异
