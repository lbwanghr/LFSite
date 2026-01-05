#!/bin/bash

# Pinger 本地测试脚本
# 用法: ./test-local.sh

set -e

echo "🚀 Pinger 本地测试启动脚本"
echo "================================"

# 检查是否在 pinger 目录
if [ ! -f "_config.yml" ]; then
    echo "❌ 错误：请在 pinger 目录下运行此脚本"
    echo "   cd pinger && ./test-local.sh"
    exit 1
fi

# 检查 Ruby 是否安装
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby 未安装"
    echo "📦 请先安装 Ruby："
    echo "   macOS: brew install ruby"
    echo "   Ubuntu: sudo apt-get install ruby-full"
    exit 1
fi

echo "✅ Ruby 版本: $(ruby -v)"

# 检查 Bundler 是否安装
if ! command -v bundle &> /dev/null; then
    echo "📦 正在安装 Bundler..."
    gem install bundler
fi

echo "✅ Bundler 版本: $(bundle -v)"

# 安装依赖
if [ ! -d "vendor/bundle" ]; then
    echo "📦 正在安装 Jekyll 依赖..."
    bundle install --path vendor/bundle
else
    echo "✅ 依赖已安装"
fi

# 清理之前的构建
echo "🧹 清理旧的构建文件..."
bundle exec jekyll clean

# 启动服务器
echo ""
echo "🎉 启动 Jekyll 服务器..."
echo "📍 访问地址: http://localhost:4000"
echo "⏹️  停止服务器: Ctrl + C"
echo ""

# 使用空 baseurl 和 livereload
bundle exec jekyll serve --baseurl "" --livereload --open-url

# 如果不想自动打开浏览器，移除 --open-url
# bundle exec jekyll serve --baseurl "" --livereload
