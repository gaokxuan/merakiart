# Color Theme Configuration Guide

## Overview

Your MerakiArt photography portfolio has a centralized color theme system. All colors are managed from a single file, making it easy to change the entire site's color scheme.

## Available Themes

### Theme Option 1: Sage Green & Cream
- **Primary Color:** `#768C45` (Sage Green)
- **Hover Color:** `#5d6e36` (Darker Sage)
- **Background:** `#F2f1f0` (Warm Cream)
- **Style:** Soft, warm, natural aesthetic

### Theme Option 2: Deep Forest Green & Soft Mint (DEFAULT)
- **Primary Color:** `#3a4d19` (Deep Forest Green)
- **Hover Color:** `#2a3812` (Darker Forest)
- **Background:** `#edf3e6` (Soft Mint)
- **Style:** Bold, earthy, sophisticated aesthetic

## How to Change Themes

### Step 1: Open the Color Configuration File
Navigate to: `static/css/photography.css`

### Step 2: Find the Theme Section
Look for the section at the top of the file that starts with:
```css
/* ========================================
   COLOR THEME OPTIONS
   ======================================== */
```

### Step 3: Switch Themes
You'll see two theme blocks. One is commented out (wrapped in `/* */`), and one is active.

**To switch to Theme Option 1:**
1. Comment out Theme Option 2 by wrapping it in `/* */`
2. Uncomment Theme Option 1 by removing the `/* */` around it

**Example:**
```css
/* THEME OPTION 1: Sage Green & Cream (ACTIVE) */
:root {
  --primary-color: #768C45;
  --primary-hover: #5d6e36;
  --light-bg: #F2f1f0;
  ...
}

/* THEME OPTION 2: Deep Forest Green & Soft Mint */
/* 
:root {
  --primary-color: #3a4d19;
  --primary-hover: #2a3812;
  --light-bg: #edf3e6;
  ...
}
*/
```

### Step 4: Save and Refresh
1. Save the file
2. Hugo will automatically rebuild the site
3. Refresh your browser to see the new theme

## What Changes When You Switch Themes

The theme affects all of these elements across your entire site:

### Navigation
- Sidebar background color
- Active menu item highlights

### Buttons
- "Book Your Session" button
- "View Services" button
- Contact form submit button
- All primary action buttons

### Links
- All text links
- Hover states
- Social media icons

### Accents
- Section headings
- FAQ questions
- Form focus borders
- Gallery lightbox titles
- Decorative elements

## Creating a Custom Theme

If you want to create your own custom theme:

1. Copy one of the existing theme blocks
2. Change the color values:
   - `--primary-color`: Main brand color (buttons, links, accents)
   - `--primary-hover`: Darker shade for hover effects
   - `--light-bg`: Light background color for sections
3. Update the box-shadow rgba values in contact forms to match your primary color
4. Save and test

### Finding the Right Colors

**Tools for choosing colors:**
- [Coolors.co](https://coolors.co/) - Color palette generator
- [Adobe Color](https://color.adobe.com/) - Color wheel and harmony rules
- [Paletton](https://paletton.com/) - Color scheme designer

**Tips:**
- Keep good contrast between text and backgrounds
- Test on different devices and lighting conditions
- Consider your photography style and brand identity

## Technical Details

### CSS Variables Used
All color references throughout the site use these CSS variables:
- `var(--primary-color)` - Main brand color
- `var(--primary-hover)` - Hover state color
- `var(--light-bg)` - Light background sections
- `var(--text-color)` - Body text color
- `var(--heading-color)` - Heading text color

### Files That Reference These Colors
The following files automatically use the theme colors:
- `static/css/photography.css` - Main theme file (EDIT THIS ONE)
- `layouts/_default/contact.html` - Contact page
- `layouts/contact/list.html` - Contact list layout
- `layouts/pricing/list.html` - Pricing page
- `layouts/services/list.html` - Gallery page
- `themes/resume/static/css/resume.css` - Base theme styles
- `themes/resume/static/css/tweaks.css` - Theme tweaks

**Important:** You only need to edit `static/css/photography.css` to change the theme. All other files will automatically pick up the new colors.

## Troubleshooting

### Theme not changing after saving?
1. Make sure you saved the file
2. Check that Hugo server is running
3. Do a hard refresh in your browser (Cmd+Shift+R on Mac, Ctrl+Shift+R on Windows)
4. Clear your browser cache if needed

### Colors look different on mobile?
- Some devices have color profiles that affect display
- Test on multiple devices
- Ensure good contrast ratios for accessibility

### Want to test before committing?
- Use browser DevTools to temporarily change CSS variables
- Test different colors in real-time
- Once you find colors you like, update the CSS file

## Current Active Theme

**Default Theme:** Theme Option 2 (Deep Forest Green & Soft Mint)

To verify which theme is active, look for the `:root` block that is NOT commented out in `static/css/photography.css`.

---

**Questions?** The color theme system is designed to be simple and centralized. If you need help, refer to this guide or check the comments in the `photography.css` file.

