# Pinger 本地测试指南

## 快速开始（推荐方式）

### 1️⃣ 一键启动脚本

```bash
cd pinger
chmod +x test-local.sh
./test-local.sh
```

这个脚本会自动：
- ✅ 检查 Ruby 和依赖
- ✅ 安装 Jekyll
- ✅ 启动开发服务器
- ✅ 打开浏览器到 http://localhost:4000

---

## 手动测试步骤

### 前置要求

#### macOS
```bash
# 1. 安装 Homebrew（如果没有）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. 安装 Ruby
brew install ruby

# 3. 添加到 PATH（根据你的 shell 选择）
# 对于 zsh (macOS 默认)
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# 对于 bash
echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# 4. 安装 Jekyll
gem install jekyll bundler
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install ruby-full build-essential zlib1g-dev

# 配置 gem 安装路径
echo '# 安装 Ruby Gems 到 ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 安装 Jekyll
gem install jekyll bundler
```

#### Windows
```powershell
# 1. 下载并安装 Ruby+Devkit
# 访问: https://rubyinstaller.org/downloads/
# 选择 "Ruby+Devkit 3.2.X (x64)"

# 2. 在安装结束时，运行 'ridk install'，选择选项 3

# 3. 打开新的命令提示符
gem install jekyll bundler
```

---

### 启动开发服务器

```bash
# 进入 pinger 目录
cd pinger

# 安装依赖（首次运行或 Gemfile 更新后）
bundle install

# 启动服务器
bundle exec jekyll serve --baseurl ""
```

#### 带实时重载（推荐）
```bash
bundle exec jekyll serve --baseurl "" --livereload
```

#### 其他有用的选项
```bash
# 增量构建（更快）
bundle exec jekyll serve --baseurl "" --livereload --incremental

# 显示详细信息
bundle exec jekyll serve --baseurl "" --verbose

# 草稿模式（显示 _drafts 文件夹中的内容）
bundle exec jekyll serve --baseurl "" --drafts

# 指定端口
bundle exec jekyll serve --baseurl "" --port 4001
```

---

## 访问网站

启动成功后，你会看到：

```
Configuration file: /path/to/pinger/_config.yml
            Source: /path/to/pinger
       Destination: /path/to/pinger/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 0.5 seconds.
 Auto-regeneration: enabled for '/path/to/pinger'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```

打开浏览器访问：**http://localhost:4000**

---

## 快速测试（不用 Jekyll）

如果你只想快速预览**现有的 HTML 文件**（不处理 Markdown）：

### Python 方式
```bash
cd pinger
python3 -m http.server 8000
# 访问: http://localhost:8000/index.html
```

### PHP 方式
```bash
cd pinger
php -S localhost:8000
# 访问: http://localhost:8000/index.html
```

### Node.js 方式
```bash
# 安装 http-server
npm install -g http-server

cd pinger
http-server -p 8000
# 访问: http://localhost:8000/index.html
```

---

## 常见问题

### ❓ 报错：`Gem::FilePermissionError`

**解决方案**：使用用户级别安装
```bash
gem install --user-install jekyll bundler

# 或者使用 rbenv/rvm 管理 Ruby 版本
```

### ❓ 报错：`cannot load such file -- webrick`

**解决方案**：添加 webrick 到 Gemfile
```bash
bundle add webrick
```

### ❓ 样式/链接不正常

**原因**：baseurl 设置问题

**解决方案**：
- 本地测试时使用：`--baseurl ""`
- 生产环境（GitHub Pages）会自动使用 `_config.yml` 中的 `baseurl: "/pinger"`

### ❓ 修改后没有更新

1. **使用 `--livereload`** 选项
2. 手动刷新浏览器（Cmd/Ctrl + Shift + R 强制刷新）
3. 重启 Jekyll 服务器
4. 清理构建：`bundle exec jekyll clean`

---

## 开发工作流

```bash
# 1. 启动开发服务器（终端 1）
cd pinger
bundle exec jekyll serve --baseurl "" --livereload

# 2. 编辑文件（另一个终端或编辑器）
vim index.md
# 或使用你喜欢的编辑器

# 3. 保存后浏览器自动刷新
# 查看效果！

# 4. 满意后提交
git add .
git commit -m "Update pinger content"
git push
```

---

## 性能优化技巧

### 使用 Docker（可选）

创建 `Dockerfile`:
```dockerfile
FROM jekyll/jekyll:latest

WORKDIR /srv/jekyll

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["jekyll", "serve", "--baseurl", "", "--host", "0.0.0.0", "--livereload"]
```

运行：
```bash
docker build -t pinger-jekyll .
docker run -p 4000:4000 -v $(pwd):/srv/jekyll pinger-jekyll
```

---

## 测试检查清单

在推送到 GitHub 之前：

- [ ] 本地运行 `bundle exec jekyll serve` 无错误
- [ ] 所有链接正常工作
- [ ] 移动端响应式正常（浏览器开发者工具）
- [ ] 图片和资源加载正常
- [ ] 语法检查：`bundle exec jekyll build --verbose`
- [ ] SEO 标签正确：查看页面源代码

---

## 进阶：使用 GitHub Actions 测试

创建 `.github/workflows/test-pinger.yml`（可选）：

```yaml
name: Test Pinger Jekyll Site

on:
  pull_request:
    paths:
      - 'pinger/**'

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true
          working-directory: ./pinger
      
      - name: Build Jekyll site
        run: |
          cd pinger
          bundle exec jekyll build --baseurl "/pinger"
      
      - name: Test HTML
        run: |
          cd pinger
          bundle exec htmlproofer ./_site --disable-external
```

这会在每次 PR 时自动测试构建。

---

需要帮助？参考：
- [Jekyll 文档](https://jekyllrb.com/docs/)
- [GitHub Pages 文档](https://docs.github.com/en/pages)
