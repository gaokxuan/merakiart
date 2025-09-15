# GitHub Deployment Guide for MerakiART Photography Portfolio

## 🚀 **Ready for GitHub Deployment!**

Your Hugo photography portfolio is now prepared for GitHub Pages deployment. Follow these steps to get your site live.

## **📋 Pre-Deployment Checklist ✅**

- ✅ **GitHub Actions Workflow**: Created `.github/workflows/hugo.yml`
- ✅ **Git Ignore File**: Created `.gitignore` to exclude build files
- ✅ **Contact Form**: Updated Formspree integration for production
- ✅ **Base URL**: Configured for GitHub Pages (needs your repo details)
- ✅ **Documentation Cleanup**: Removed development files

## **🔧 Step-by-Step Deployment**

### **Step 1: Base URL ✅ COMPLETED**

Your `hugo.toml` is already configured with the correct base URL:
```toml
baseURL = "https://gaokxuan.github.io/merakiart/"
```

### **Step 2: GitHub Repository ✅ COMPLETED**

Your repository is already created at:
**https://github.com/gaokxuan/merakiart**

### **Step 3: Push Your Code to GitHub**

Since your repository already exists, run these commands in your project directory:

```bash
# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Complete MerakiART Photography Portfolio - Ready for deployment"

# Add GitHub remote
git remote add origin https://github.com/gaokxuan/merakiart.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### **Step 4: Enable GitHub Pages**

1. **Go to your GitHub repository**
2. **Click Settings** tab
3. **Scroll to Pages** section (left sidebar)
4. **Source**: Select "GitHub Actions"
5. **Save** the settings

### **Step 5: Wait for Deployment**

1. **Go to Actions tab** in your repository
2. **Watch the workflow** run (takes 2-3 minutes)
3. **Green checkmark** means successful deployment
4. **Your site URL** will be shown in the Pages settings

## **🌐 Your Live Website**

Once deployed, your site will be available at:
```
https://gaokxuan.github.io/merakiart/
```

## **📧 Formspree Configuration**

Your contact form will work immediately because:
- ✅ **Formspree endpoint**: Already configured (`xnnbyppq`)
- ✅ **Email delivery**: Will send to your inbox
- ✅ **Redirect URL**: Automatically uses your GitHub Pages URL

## **🔄 Making Updates**

To update your live site:

```bash
# Make your changes
# Then commit and push:
git add .
git commit -m "Update: description of changes"
git push

# GitHub Actions will automatically rebuild and deploy
```

## **🎯 Custom Domain (Optional)**

To use a custom domain like `merakiart.com`:

1. **Buy domain** from registrar (Namecheap, GoDaddy, etc.)
2. **Add CNAME file** to your repository root:
   ```
   merakiart.com
   ```
3. **Update DNS** at your registrar:
   - Add CNAME record: `www` → `YOUR_USERNAME.github.io`
   - Add A records for apex domain to GitHub's IPs
4. **Update baseURL** in `hugo.toml`:
   ```toml
   baseURL = "https://merakiart.com/"
   ```

## **📊 Performance Optimizations**

Your site is already optimized with:
- ✅ **Minified HTML/CSS/JS**: Hugo build process
- ✅ **Optimized Images**: Properly sized gallery photos
- ✅ **Fast Loading**: Minimal, clean code
- ✅ **Mobile Responsive**: Perfect on all devices
- ✅ **SEO Ready**: Proper meta tags and structure

## **🔍 SEO & Analytics (Next Steps)**

Consider adding:
- **Google Analytics**: Track visitor behavior
- **Google Search Console**: Monitor search performance
- **Meta descriptions**: Improve search results
- **Social media tags**: Better sharing appearance

## **🛠 Troubleshooting**

**Common Issues:**

1. **Build Fails**: Check Actions tab for error details
2. **Images Not Loading**: Verify image paths in `static/img/`
3. **Contact Form Issues**: Check Formspree dashboard
4. **CSS Not Applied**: Clear browser cache

**Getting Help:**
- Check GitHub Actions logs for build errors
- Verify all file paths are correct
- Ensure `hugo.toml` baseURL matches your site URL

## **📱 Mobile Testing**

After deployment, test on:
- ✅ **Desktop browsers**: Chrome, Firefox, Safari, Edge
- ✅ **Mobile devices**: iPhone, Android phones
- ✅ **Tablets**: iPad, Android tablets
- ✅ **Contact form**: Submit test inquiry

## **🎉 Launch Checklist**

Before announcing your site:
- ✅ **Test all pages**: About, Gallery, Pricing, Contact
- ✅ **Submit contact form**: Verify email delivery
- ✅ **Check mobile experience**: All devices work properly
- ✅ **Verify social links**: Instagram, etc. work correctly
- ✅ **Test image loading**: All gallery photos display
- ✅ **Check spelling**: Review all text content

## **🚀 You're Ready to Launch!**

Your MerakiART photography portfolio is production-ready with:
- **Professional design** showcasing your work
- **Functional contact form** for client inquiries
- **Mobile-optimized** experience
- **Fast loading** performance
- **Easy maintenance** through GitHub

**Next Step**: Follow the deployment steps above to get your site live!

---

**Need help?** The GitHub Actions workflow will automatically build and deploy your site every time you push changes. Your photography business is ready to go online! 📸✨
