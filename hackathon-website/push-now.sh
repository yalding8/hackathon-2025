#!/bin/bash
# 推送到 GitHub 的便捷脚本
# 使用方法: ./push-now.sh

echo "🚀 正在推送到 GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "================================================"
    echo "📋 下一步操作："
    echo ""
    echo "1. 访问 GitHub 仓库设置页面："
    echo "   https://github.com/yalding8/hackathon-2025/settings/pages"
    echo ""
    echo "2. 在 'Build and deployment' 部分："
    echo "   - Source: 选择 'Deploy from a branch'"
    echo "   - Branch: 选择 'main' 分支"
    echo "   - Folder: 选择 '/ (root)'"
    echo "   - 点击 'Save'"
    echo ""
    echo "3. 等待 1-2 分钟后，访问你的网站："
    echo "   🌐 https://yalding8.github.io/hackathon-2025/"
    echo ""
    echo "================================================"
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "请确认："
    echo "1. 已在 GitHub 创建仓库: https://github.com/new"
    echo "2. 仓库名称: hackathon-2025"
    echo "3. 仓库设置为 Public（公开）"
fi
