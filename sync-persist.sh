#!/bin/bash
# Simple Git-based persistence for free-tier Render

PERSIST=/persist
REPO_URL="https://github.com/yourusername/linux-gui-persist.git"
BRANCH="main"

mkdir -p $PERSIST
cd $PERSIST

if [ ! -d ".git" ]; then
    git clone -b $BRANCH $REPO_URL .
else
    git reset --hard
    git pull origin $BRANCH
fi

echo "Persistent folder synced."
