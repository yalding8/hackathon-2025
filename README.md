# uhomes Hackathon 2025 Website

A premium, bilingual (中文/English) static website for the uhomes Spring Festival Hackathon.

## 🎨 Design Features

- **Premium Editorial Aesthetic**: Combines Apple-inspired minimalism with editorial magazine layouts
- **Distinctive Typography**: Playfair Display (display), DM Sans (body), JetBrains Mono (accent)
- **Smooth Animations**: Staggered reveals, hover effects, scroll-triggered animations
- **Bilingual Toggle**: Seamless Chinese/English language switching
- **Fully Responsive**: Mobile-first design, works perfectly on all devices

## 📁 Structure

```
hackathon-website/
├── index.html          # Main website (single-page, all-in-one)
└── README.md           # This file
```

## 🚀 Quick Start

### Option 1: Open Locally
Simply open `index.html` in any modern web browser.

### Option 2: Deploy to GitHub Pages

1. Create a new repository on GitHub (e.g., `hackathon-2025`)

2. Push the website files:
```bash
cd hackathon-website
git init
git add .
git commit -m "Initial hackathon website"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/hackathon-2025.git
git push -u origin main
```

3. Enable GitHub Pages:
   - Go to repository **Settings** → **Pages**
   - Source: Deploy from **main** branch, **/ (root)** folder
   - Click **Save**

4. Your site will be live at: `https://YOUR_USERNAME.github.io/hackathon-2025/`

### Option 3: Deploy to Vercel/Netlify

**Vercel:**
```bash
npm i -g vercel
cd hackathon-website
vercel
```

**Netlify:**
Drag and drop the `hackathon-website` folder into [Netlify Drop](https://app.netlify.com/drop)

## ✏️ Customization

### Update Business Challenges
Find the "Challenges Section" in `index.html` (around line 700) and replace placeholder text:

```html
<p class="challenge-desc">
    <span class="zh-only">您的业务问题描述（中文）</span>
    <span class="en-only">Your business challenge description (English)</span>
</p>
```

### Add QR Codes
Replace the placeholder QR boxes (around line 820) with actual images:

```html
<div class="qr-box">
    <img src="path/to/qr-code.png" alt="QR Code" style="width: 100%; height: 100%; object-fit: contain;">
</div>
```

### Update Colors
Modify CSS variables in the `<style>` section (around line 20):

```css
:root {
    --primary: #0A0E27;      /* Main dark color */
    --accent: #6366F1;       /* Accent color */
    --gold: #F59E0B;         /* Highlight color */
}
```

## 🌐 Browser Support

- Chrome/Edge: ✅ Latest 2 versions
- Firefox: ✅ Latest 2 versions
- Safari: ✅ Latest 2 versions
- Mobile browsers: ✅ iOS Safari, Chrome Mobile

## 📱 Features

- ✅ Bilingual (中文/English) with instant toggle
- ✅ Smooth scroll navigation
- ✅ Animated sections with intersection observer
- ✅ Responsive design (mobile, tablet, desktop)
- ✅ No external dependencies (zero JavaScript libraries)
- ✅ Fast loading (single HTML file)
- ✅ Accessible (semantic HTML)

## 🎯 Sections

1. **Hero** - Eye-catching intro with CTA buttons
2. **About** - 4 key value propositions
3. **Timeline** - 5 key milestones with visual timeline
4. **Prizes** - 4 award tiers with amounts
5. **Challenges** - 4 business challenge placeholders
6. **Register** - 2 QR code areas (group + form)
7. **Footer** - Credits and tagline

## 💡 Tips

- **Preview locally**: Use `python3 -m http.server 8000` or any local server
- **SEO**: Add meta tags in `<head>` section for better search visibility
- **Analytics**: Add Google Analytics or similar tracking if needed
- **Custom domain**: Configure in GitHub Pages settings or your hosting provider

## 📝 License

© 2026 uhomes. All rights reserved.

---

**Built with care by Claude Code** 🚀
