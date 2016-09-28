#!/bin/bash
# Symlink the dotfiles to the parent directory
echo "###################################################"
echo "symlinking dotfiles into parent directory..."
for dir in  `find  * -maxdepth 0 -type d \( -iname ".*" \)`
do
    stow $dir 
done
echo "done!"

if [ ! -d ~/.vim/bundle/Vundle.vim/ ]; then
    echo "###################################################"
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
