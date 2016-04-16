#!/bin/bash
echo "###################################################"
echo "installing homebrew..."

echo "###################################################"
echo "installing apps from Brewfile..."
brew bundle

# Symlink the dotfiles to the parent directory
echo "###################################################"
echo "symlinking dotfiles into parent directory..."
for dir in  `find * -type d -maxdepth 0 \( -iname ".*" \)`
do
    stow $dir 
done
echo "done!"