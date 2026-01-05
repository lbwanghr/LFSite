.PHONY: help install serve clean build

help:
	@echo "Pinger Jekyll 本地开发命令"
	@echo ""
	@echo "  make install    - 安装依赖"
	@echo "  make serve      - 启动开发服务器（带实时重载）"
	@echo "  make build      - 构建站点"
	@echo "  make clean      - 清理构建文件"
	@echo ""

install:
	@echo "📦 安装 Jekyll 依赖..."
	bundle install --path vendor/bundle

serve:
	@echo "🚀 启动开发服务器..."
	@echo "📍 访问地址: http://localhost:4000"
	@echo "⏹️  停止服务器: Ctrl + C"
	bundle exec jekyll serve --baseurl "" --livereload

build:
	@echo "🔨 构建 Jekyll 站点..."
	bundle exec jekyll build --baseurl "/pinger"

clean:
	@echo "🧹 清理构建文件..."
	bundle exec jekyll clean
	rm -rf _site .jekyll-cache .jekyll-metadata vendor
