#!/bin/bash

# uhomes Hackathon 2025 - GitHub Pages 部署脚本
# 使用方法: ./deploy-github.sh

set -e

echo "🚀 uhomes Hackathon 2025 - GitHub Pages 部署向导"
echo "================================================"
echo ""

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误：请在 hackathon-website 目录下运行此脚本"
    exit 1
fi

# 获取GitHub用户名
echo "📝 请输入您的 GitHub 用户名："
read -r GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ 错误：GitHub用户名不能为空"
    exit 1
fi

# 获取仓库名称
echo ""
echo "📝 请输入仓库名称（默认: hackathon-2025）："
read -r REPO_NAME
REPO_NAME=${REPO_NAME:-hackathon-2025}

echo ""
echo "📋 确认信息："
echo "   GitHub 用户名: $GITHUB_USERNAME"
echo "   仓库名称: $REPO_NAME"
echo "   部署后网址: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "继续部署吗？(y/n)"
read -r CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ 取消部署"
    exit 0
fi

# 初始化Git仓库
echo ""
echo "📦 步骤 1/4: 初始化 Git 仓库..."
if [ -d ".git" ]; then
    echo "   ⚠️  Git 仓库已存在，跳过初始化"
else
    git init
    echo "   ✅ Git 仓库初始化完成"
fi

# 添加文件
echo ""
echo "📦 步骤 2/4: 添加文件到 Git..."
git add .
git commit -m "Initial commit: uhomes Hackathon 2025 website" || echo "   ⚠️  没有新的更改需要提交"
git branch -M main
echo "   ✅ 文件已添加"

# 添加远程仓库
echo ""
echo "📦 步骤 3/4: 连接到 GitHub..."
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# 检查远程仓库是否已存在
if git remote | grep -q "^origin$"; then
    echo "   ⚠️  远程仓库 'origin' 已存在"
    echo "   当前远程地址: $(git remote get-url origin)"
    echo "   是否更新为: $REMOTE_URL ? (y/n)"
    read -r UPDATE_REMOTE
    if [ "$UPDATE_REMOTE" = "y" ] || [ "$UPDATE_REMOTE" = "Y" ]; then
        git remote set-url origin "$REMOTE_URL"
        echo "   ✅ 远程仓库地址已更新"
    fi
else
    git remote add origin "$REMOTE_URL"
    echo "   ✅ 远程仓库已添加"
fi

# 推送到GitHub
echo ""
echo "📦 步骤 4/4: 推送到 GitHub..."
echo "   正在推送到 $REMOTE_URL ..."
echo ""

if git push -u origin main; then
    echo ""
    echo "   ✅ 推送成功！"
else
    echo ""
    echo "   ⚠️  推送失败。可能的原因："
    echo "   1. 仓库不存在 - 请先在 GitHub 上创建仓库: https://github.com/new"
    echo "   2. 没有权限 - 请检查 GitHub 认证"
    echo "   3. 分支冲突 - 尝试使用 'git push -f origin main' 强制推送"
    exit 1
fi

echo ""
echo "================================================"
echo "✅ 部署完成！"
echo ""
echo "📋 下一步操作："
echo ""
echo "1. 访问 GitHub 仓库设置："
echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
echo ""
echo "2. 在 'Build and deployment' 部分："
echo "   - Source: 选择 'Deploy from a branch'"
echo "   - Branch: 选择 'main' 分支，'/ (root)' 目录"
echo "   - 点击 'Save'"
echo ""
echo "3. 等待 1-2 分钟后，访问您的网站："
echo "   🌐 https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "================================================"
echo ""
echo "💡 提示："
echo "- 如果网站未显示，等待几分钟后刷新"
echo "- 查看部署状态：https://github.com/$GITHUB_USERNAME/$REPO_NAME/actions"
echo "- 修改网站后，重新运行此脚本即可更新"
echo ""
