#!/bin/bash
set -e

OWNER="JordanSinko"
REPO="setup-new-mac-via-command-line"
BRANCH="master"
INSTALL_DIR="$HOME/Downloads"  # or wherever you want it

echo "Downloading $REPO..."
curl -fsSL "https://github.com/$OWNER/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar xz

# tar extracts to REPO_NAME-BRANCH/, so move it
mv "$REPO-$BRANCH" "$INSTALL_DIR"

cd "$INSTALL_DIR"
chmod +x setup.sh
./setup.sh

echo "Cleaning up $REPO..."
rm -rf "$INSTALL_DIR/$REPO-$BRANCH"