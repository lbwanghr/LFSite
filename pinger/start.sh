#!/bin/bash

# 快速启动脚本 - 最简版本

echo "🚀 启动 Pinger 本地预览..."

# 进入 pinger 目录（如果不在）
if [ ! -f "_config.yml" ]; then
    if [ -d "pinger" ]; then
        cd pinger
    else
        echo "❌ 找不到 pinger 目录"
        exit 1
    fi
fi

# 检查是否已安装依赖
if [ ! -d "vendor/bundle" ] && [ ! -d ".bundle" ]; then
    echo "📦 首次运行，正在安装依赖..."
    bundle install
fi

# 启动服务器
echo ""
echo "✅ 服务器启动在: http://localhost:4000"
echo "💡 按 Ctrl+C 停止服务器"
echo ""

bundle exec jekyll serve --baseurl "" --livereload
