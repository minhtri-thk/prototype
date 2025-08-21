# Prototype Repository

This repository contains shared frontend assets (e.g., CSS, JS, images, fonts, and libraries) used across multiple projects.

## 📁 Folder Structure

```
src/
└── assets/
    ├── css/
    ├── js/
    ├── libs/
    ├── fonts/
    └── images/
    *.html
```

## 🚀 Usage Guide

### 1. Use the provided setup script

To integrate the shared assets into your project, follow these steps:

#### Step 1: Copy the script into your project

From this repo, copy the setup script to your project root:

```bash
cp script_setups/make_assets_setup.sh /path/to/your-project/
```

#### Step 2: Grant execute permission

```bash
chmod +x /path/to/your-project/make_assets_setup.sh
```

#### Step 3: Run the script

```bash
cd /path/to/your-project
./make_assets_setup.sh
```

This script will:
- Clone only the `src/assets/` directory using Git sparse checkout.
- Move the folder into your project’s `public/assets` directory.
- Automatically add `/public/assets` to `.gitignore` if not already present.

## 🛠 Notes

- Do not edit this repository unless you're managing shared design assets.
- Make sure to keep this directory out of your own `.git` commits if using it as an external clone (e.g., add `/public/assets` to `.gitignore`).