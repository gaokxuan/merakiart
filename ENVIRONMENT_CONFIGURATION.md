# Hugo Multi-Environment Configuration Guide

## 🎯 **Overview**

Your MerakiART photography portfolio is now configured to work seamlessly across multiple environments without manual configuration changes.

---

## **📁 Configuration Structure**

```
config/
├── _default/
│   └── config.toml          # Shared settings for all environments
├── development/
│   └── config.toml          # Local development settings
├── production/
│   └── config.toml          # GitHub Pages deployment
└── custom-domain/
    └── config.toml          # Future custom domain (optional)
```

---

## **🚀 How to Use**

### **Local Development**

```bash
# Standard development server (uses development config automatically)
hugo server -D

# Explicitly specify development environment
hugo server -D --environment development
```

**What happens:**
- ✅ Uses `baseURL = "http://localhost:1313/merakiart/"`
- ✅ Formspree redirects to `http://localhost:1313/merakiart/contact/?success=true`
- ✅ All links work correctly with `/merakiart/` path

### **Production Build (GitHub Pages)**

```bash
# Build for production
hugo --environment production

# Or let GitHub Actions handle it automatically
git push origin main
```

**What happens:**
- ✅ Uses `baseURL = "https://gaokxuan.github.io/merakiart/"`
- ✅ Formspree redirects to `https://gaokxuan.github.io/merakiart/contact/?success=true`
- ✅ All links work correctly on GitHub Pages
- ✅ GitHub Actions workflow automatically uses `--environment production`

### **Custom Domain (Future)**

When you're ready to use a custom domain:

1. **Update the custom domain config:**
   ```bash
   # Edit config/custom-domain/config.toml
   baseURL = "https://www.yourdomainname.com/"
   formspreeRedirect = "https://www.yourdomainname.com/contact/?success=true"
   ```

2. **Update GitHub Actions workflow:**
   ```yaml
   # In .github/workflows/hugo.yml, change:
   --environment production
   # to:
   --environment custom-domain
   ```

3. **Build and deploy:**
   ```bash
   hugo --environment custom-domain
   git push origin main
   ```

---

## **🔧 Environment-Specific Settings**

### **Development Environment**
- **baseURL:** `http://localhost:1313/merakiart/`
- **Formspree Redirect:** Local success page
- **Analytics:** Disabled
- **Minification:** Disabled (faster builds)

### **Production Environment (GitHub Pages)**
- **baseURL:** `https://gaokxuan.github.io/merakiart/`
- **Formspree Redirect:** Production success page
- **Analytics:** Can be enabled
- **Minification:** Enabled (optimized)

### **Custom Domain Environment**
- **baseURL:** Your custom domain
- **Formspree Redirect:** Custom domain success page
- **Analytics:** Enabled
- **Minification:** Enabled

---

## **✅ What Works Automatically**

All of these adapt to the environment automatically:

### **1. Navigation Links**
```html
<!-- Photographer photo link -->
<a href="{{ "/" | relURL }}">
  <!-- Always resolves correctly -->
</a>
```

### **2. Menu Items**
```toml
[[menu.main]]
  name = "Gallery"
  url = "/services/"  # Automatically prefixed with baseURL
```

### **3. Asset Paths**
```html
<!-- CSS, JS, Images -->
<link rel="stylesheet" href="{{ "css/photography.css" | relURL }}">
<img src="{{ .Site.Params.profileImage | relURL }}">
```

### **4. Gallery Images**
```html
<!-- Gallery photos -->
<img src="{{ $image.src | relURL }}">
```

### **5. Contact Form Redirect**
```html
<!-- Formspree redirect -->
<input type="hidden" name="_next" value="{{ .Site.Params.formspreeRedirect }}">
```

---

## **🔄 Switching Environments**

### **Scenario 1: Testing Production Build Locally**

```bash
# Build with production settings
hugo --environment production

# Serve the built site
cd public && python3 -m http.server 8000
# Visit: http://localhost:8000
```

### **Scenario 2: Changing Deployment URL**

**From GitHub Pages to Custom Domain:**

1. Update `config/custom-domain/config.toml`:
   ```toml
   baseURL = "https://www.merakiart.com/"
   ```

2. Update `.github/workflows/hugo.yml`:
   ```yaml
   hugo \
     --environment custom-domain \
     --minify
   ```

3. Push changes:
   ```bash
   git add .
   git commit -m "Switch to custom domain"
   git push origin main
   ```

**From Custom Domain back to GitHub Pages:**

1. Update `.github/workflows/hugo.yml`:
   ```yaml
   hugo \
     --environment production \
     --minify
   ```

2. Push changes - done!

---

## **📊 Configuration Hierarchy**

Hugo merges configurations in this order:

1. **`config/_default/config.toml`** - Base configuration (always loaded)
2. **`config/{environment}/config.toml`** - Environment-specific (overrides defaults)

**Example:**
```
_default/config.toml:
  title = "MerakiART"
  email = "merakiartphoto@gmail.com"

production/config.toml:
  baseURL = "https://gaokxuan.github.io/merakiart/"
  formspreeRedirect = "https://gaokxuan.github.io/merakiart/contact/?success=true"

Result in production:
  ✅ title = "MerakiART" (from _default)
  ✅ email = "merakiartphoto@gmail.com" (from _default)
  ✅ baseURL = "https://gaokxuan.github.io/merakiart/" (from production)
  ✅ formspreeRedirect = "https://..." (from production)
```

---

## **🛠️ Troubleshooting**

### **Issue: Links broken after deployment**

**Check:**
1. Verify correct environment is being used:
   ```bash
   hugo --environment production --verbose
   ```

2. Check baseURL in built site:
   ```bash
   grep -r "baseURL" public/index.html
   ```

### **Issue: Formspree redirect goes to wrong URL**

**Fix:**
1. Check environment config:
   ```bash
   cat config/production/config.toml | grep formspreeRedirect
   ```

2. Rebuild with correct environment:
   ```bash
   hugo --environment production
   ```

### **Issue: Assets (CSS/JS/Images) not loading**

**Verify:**
1. All asset paths use `relURL`:
   ```html
   ✅ <img src="{{ .Site.Params.profileImage | relURL }}">
   ❌ <img src="/img/photo.jpg">
   ```

2. Check browser console for 404 errors

---

## **📝 Best Practices**

### **1. Never Hardcode URLs**
```html
❌ BAD:  <a href="https://gaokxuan.github.io/merakiart/gallery/">
✅ GOOD: <a href="{{ "gallery" | relURL }}">
```

### **2. Use Environment Variables**
```toml
❌ BAD:  Hardcode redirect URL in template
✅ GOOD: Use {{ .Site.Params.formspreeRedirect }}
```

### **3. Test Before Deploying**
```bash
# Build production locally
hugo --environment production

# Check output
ls -la public/
```

### **4. Keep hugo.toml for Backward Compatibility**
The old `hugo.toml` file can stay in place as a fallback, but the `config/` directory takes precedence.

---

## **🎯 Quick Reference**

| Task | Command |
|------|---------|
| **Local development** | `hugo server -D` |
| **Production build** | `hugo --environment production` |
| **Custom domain build** | `hugo --environment custom-domain` |
| **Test production locally** | `hugo --environment production && cd public && python3 -m http.server` |
| **Check current config** | `hugo config` |
| **Deploy to GitHub** | `git push origin main` (GitHub Actions handles the rest) |

---

## **🌐 Current URLs**

### **Development:**
- Local: `http://localhost:1313/merakiart/`

### **Production:**
- GitHub Pages: `https://gaokxuan.github.io/merakiart/`
- Contact Form Success: `https://gaokxuan.github.io/merakiart/contact/?success=true`

### **Future Custom Domain:**
- Custom: `https://www.merakiart.com/` (example - update when ready)

---

## **✅ Benefits of This Setup**

1. ✅ **No manual config changes** when switching environments
2. ✅ **Easy to add new environments** (staging, preview, etc.)
3. ✅ **All links work correctly** in every environment
4. ✅ **Simple deployment** - just push to GitHub
5. ✅ **Future-proof** - easy to switch to custom domain
6. ✅ **Clean separation** of environment-specific settings
7. ✅ **No broken links** when changing deployment URLs

---

## **🚀 Next Steps**

1. ✅ **Test locally:** Run `hugo server -D` and verify everything works
2. ✅ **Test production build:** Run `hugo --environment production` and check output
3. ✅ **Deploy to GitHub:** Push changes and let GitHub Actions deploy
4. ✅ **Verify live site:** Check all links and forms work on GitHub Pages
5. ⏳ **Custom domain (later):** Update `config/custom-domain/config.toml` when ready

Your site is now fully configured for multi-environment deployment! 🎉📸

