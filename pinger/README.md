# Pinger Jekyll 子站点配置指南

## 文件结构

```
/pinger/
├── _config.yml           # Jekyll 配置文件
├── _layouts/             # 布局模板
│   ├── default.html      # 基础布局
│   ├── home.html         # 首页布局
│   └── page.html         # 普通页面布局
├── assets/
│   └── css/
│       └── style.css     # 样式文件
├── index.md              # 首页（Markdown 格式）
├── privacy.md            # 隐私政策页面
└── Gemfile               # Ruby 依赖（用于本地测试）
```

## 如何使用

### 1. 修改首页内容

编辑 `index.md` 文件，这是一个 YAML Front Matter + Markdown 格式的文件。

所有内容都在顶部的 YAML 区域中定义：

```yaml
---
layout: home

hero:
  title: Pinger
  tagline: Make Ping a Pleasure
  subtitle: Elegant and powerful network monitoring

features:
  title: Core Features
  subtitle: Everything you need
  items:
    - icon: 📊
      title: Real-time Monitoring
      description: Your description here
---
```

### 2. 添加新页面

创建新的 `.md` 文件，例如 `features.md`：

```markdown
---
layout: page
title: Features
description: Pinger Features
---

# Detailed Features

Your content here in **Markdown** format.
```

### 3. 修改样式

编辑 `assets/css/style.css` 来调整视觉风格。

### 4. 本地测试

如果需要在本地测试：

```bash
cd pinger
bundle install
bundle exec jekyll serve --baseurl ""
```

然后访问 `http://localhost:4000`

## 主站配置

确保你的主站点 `_config.yml`（根目录）包含以下设置，以排除 pinger 子站点：

```yaml
exclude:
  - pinger/_site
  - pinger/.jekyll-cache
```

或者更好的方案是在根目录的 `_config.yml` 中添加：

```yaml
# 排除子站点目录，让它独立处理
exclude:
  - pinger
```

但由于 GitHub Pages 的限制，实际上每个目录都会被处理，所以我们需要确保 `/pinger` 有自己的 `_config.yml`。

## GitHub Pages 部署

推送到 GitHub 后，GitHub Pages 会：

1. 自动识别 `/pinger/_config.yml`
2. 独立构建 pinger 子站点
3. 可以通过 `www.lonefondness.com/pinger` 访问

## 注意事项

1. **baseurl 设置**：`_config.yml` 中的 `baseurl: "/pinger"` 很重要，确保链接正确
2. **主题冲突**：子站点使用自定义主题，不会影响主站
3. **构建时间**：推送后 GitHub Pages 需要几分钟构建

## 快速修改示例

### 添加新功能到首页

编辑 `index.md`，在 `features.items` 下添加：

```yaml
- icon: 🚀
  title: New Feature
  description: Description of the new feature
```

### 修改配色

编辑 `assets/css/style.css`，找到：

```css
header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}
```

改为你想要的颜色。

## 文档链接

- [Jekyll 文档](https://jekyllrb.com/docs/)
- [GitHub Pages 文档](https://docs.github.com/en/pages)
- [YAML Front Matter 语法](https://jekyllrb.com/docs/front-matter/)
