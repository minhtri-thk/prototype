#!/bin/bash

SSH_COMMON_PATH="git@github.com:thk-vn/prototype.git"
ASSETS_PATH="public/assets"

if [ -d "$ASSETS_PATH/.git" ]; then
    echo "Updating existing submodule at $ASSETS_PATH..."
    cd "$ASSETS_PATH" || exit 1
    git fetch origin main --depth=1 || exit 1
    git pull origin main || exit 1
    cd ..
else
    echo "Cloning assets as submodule..."
    rm -rf "$ASSETS_PATH" || exit 1
    mkdir -p "$ASSETS_PATH" || exit 1
    cd "$ASSETS_PATH" || exit 1

    git init
    git remote add -f origin "$SSH_COMMON_PATH" || exit 1
    git config core.sparsecheckout true || exit 1
    echo "src/assets/" >> .git/info/sparse-checkout
    git pull origin main || exit 1

    mv src/assets/* ./ || exit 1
    rm -rf src

    cd ../..
fi

grep -qxF '/public/assets' .gitignore || echo '/public/assets' >> .gitignore
