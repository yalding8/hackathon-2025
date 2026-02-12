# GitHub Pages 部署指南

本指南将帮助你将 uhomes Hackathon 2025 网站部署到 GitHub Pages。

---

## 🚀 快速部署（使用脚本）

### 步骤 1: 准备
```bash
cd hackathon-website
chmod +x deploy-github.sh
```

### 步骤 2: 运行部署脚本
```bash
./deploy-github.sh
```

脚本会引导你完成整个部署过程。

---

## 📝 手动部署（详细步骤）

### 前提条件
- ✅ 已安装 Git
- ✅ 拥有 GitHub 账号
- ✅ 已配置 GitHub 认证（SSH 或 HTTPS）

### 步骤 1: 在 GitHub 创建新仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `hackathon-2025` (或你喜欢的名称)
   - **Description**: `uhomes Hackathon Spring Festival 2025`
   - **Public** (必须是公开仓库才能使用免费的 GitHub Pages)
   - ⚠️ **不要**勾选 "Add a README file"
3. 点击 **Create repository**

### 步骤 2: 本地初始化并推送

在 `hackathon-website` 目录下执行：

```bash
# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 创建首次提交
git commit -m "Initial commit: uhomes Hackathon 2025 website"

# 重命名分支为 main
git branch -M main

# 添加远程仓库（替换 YOUR_USERNAME 和 REPO_NAME）
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# 推送到 GitHub
git push -u origin main
```

### 步骤 3: 启用 GitHub Pages

1. 访问仓库的 Settings 页面：
   ```
   https://github.com/YOUR_USERNAME/REPO_NAME/settings/pages
   ```

2. 在 **"Build and deployment"** 部分：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main` 分支
   - **Folder**: 选择 `/ (root)`

3. 点击 **Save** 按钮

4. 等待 1-2 分钟，页面顶部会显示：
   ```
   Your site is live at https://YOUR_USERNAME.github.io/REPO_NAME/
   ```

### 步骤 4: 访问网站

打开浏览器，访问：
```
https://YOUR_USERNAME.github.io/REPO_NAME/
```

---

## 🔧 常见问题

### Q1: 推送时提示 "Permission denied"

**原因**: GitHub 认证未配置

**解决方案**:

**选项A - 使用 Personal Access Token (推荐)**:
1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 选择权限：`repo` (勾选所有子选项)
4. 生成 token 并复制
5. 推送时使用：
   ```bash
   git push https://YOUR_TOKEN@github.com/YOUR_USERNAME/REPO_NAME.git main
   ```

**选项B - 使用 SSH**:
1. 生成 SSH 密钥：`ssh-keygen -t ed25519 -C "your_email@example.com"`
2. 添加到 GitHub：https://github.com/settings/keys
3. 修改远程地址：
   ```bash
   git remote set-url origin git@github.com:YOUR_USERNAME/REPO_NAME.git
   ```

### Q2: 网站显示 404

**可能原因**:
1. GitHub Pages 未启用
2. 分支或文件夹选择错误
3. 网站还在构建中

**解决方案**:
1. 检查 Settings → Pages 设置是否正确
2. 查看部署状态：`https://github.com/YOUR_USERNAME/REPO_NAME/actions`
3. 等待 2-5 分钟后刷新

### Q3: 网站样式/字体未加载

**原因**: 相对路径问题

**解决方案**:
网站已使用绝对路径和 CDN 资源，应该不会出现此问题。如果仍有问题，清除浏览器缓存后重试。

### Q4: 如何更新网站内容？

修改本地文件后：
```bash
git add .
git commit -m "Update: 描述你的修改"
git push origin main
```

等待 1-2 分钟，网站会自动更新。

### Q5: 想使用自定义域名

1. 在 Settings → Pages 的 **Custom domain** 输入你的域名（如 `hackathon.uhomes.com`）
2. 在你的 DNS 提供商添加 CNAME 记录：
   ```
   CNAME  hackathon  YOUR_USERNAME.github.io
   ```
3. 等待 DNS 生效（通常几分钟到几小时）

---

## 📊 监控部署状态

### 查看部署历史
访问仓库的 Actions 标签页：
```
https://github.com/YOUR_USERNAME/REPO_NAME/actions
```

这里会显示：
- ✅ 成功的部署
- ⏳ 进行中的部署
- ❌ 失败的部署（可查看日志）

### 部署失败怎么办？

1. 点击失败的工作流
2. 查看错误日志
3. 常见错误：
   - 文件路径问题
   - HTML 语法错误
   - 文件大小超限（>100MB）

---

## 🔄 更新工作流

### 日常更新流程
```bash
# 1. 修改网站内容（如更新业务挑战、添加二维码）
vim index.html

# 2. 测试（可选）
python3 -m http.server 8000
# 访问 http://localhost:8000 检查

# 3. 提交更改
git add .
git commit -m "Update: 添加具体业务挑战内容"
git push origin main

# 4. 等待自动部署完成（1-2分钟）
```

### 回滚到之前的版本
```bash
# 查看提交历史
git log --oneline

# 回滚到指定版本（替换 COMMIT_HASH）
git revert COMMIT_HASH
git push origin main
```

---

## 🎨 定制建议

### 添加真实二维码

找到 `index.html` 中的二维码占位区域（约第820行）：

```html
<!-- 原来的占位符 -->
<div class="qr-box">
    <span class="zh-only">企业微信群<br>二维码</span>
</div>

<!-- 替换为真实图片 -->
<div class="qr-box">
    <img src="images/wechat-group-qr.png" alt="WeChat Group QR"
         style="width: 100%; height: 100%; object-fit: contain; padding: 10px;">
</div>
```

**推荐做法**：
1. 创建 `hackathon-website/images/` 目录
2. 将二维码图片放入该目录
3. 更新 HTML 中的图片路径
4. 提交并推送更新

### 更新业务挑战内容

找到 `index.html` 中的挑战区域（约第700行）：

```html
<div class="challenge-card">
    <div class="challenge-number">01</div>
    <h3 class="challenge-title">
        <span class="zh-only">优化用户登录体验</span>
        <span class="en-only">Optimize User Login Experience</span>
    </h3>
    <p class="challenge-desc">
        <span class="zh-only">如何减少用户登录流程的摩擦，提升首次登录转化率...</span>
        <span class="en-only">How to reduce friction in the login process and improve first-time login conversion...</span>
    </p>
</div>
```

---

## 📱 测试清单

部署后，请在以下环境测试：

- [ ] **桌面浏览器**
  - [ ] Chrome/Edge (Windows/Mac)
  - [ ] Firefox
  - [ ] Safari (Mac)

- [ ] **移动设备**
  - [ ] iOS Safari
  - [ ] Android Chrome
  - [ ] 微信内置浏览器

- [ ] **功能测试**
  - [ ] 中英文切换正常
  - [ ] 所有链接可点击
  - [ ] 平滑滚动工作正常
  - [ ] 动画流畅
  - [ ] 二维码清晰可扫描

---

## 🆘 获取帮助

如遇到问题：

1. **检查部署日志**: GitHub Actions 页面
2. **验证文件**: 确保 `index.html` 在仓库根目录
3. **清除缓存**: 浏览器硬刷新 (Ctrl+Shift+R / Cmd+Shift+R)
4. **联系支持**: GitHub Docs - https://docs.github.com/en/pages

---

**祝部署顺利！🚀**
