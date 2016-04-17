#!/bin/bash
which -s brew
if [[ $? != 0 ]] ; then
    echo "###################################################"
    echo "installing homebrew..."
else
    echo "###################################################"
    echo "updating homebrew..."
    brew update
fi

echo "###################################################";
echo "installing apps from Brewfile...";
brew bundle check
if [[ $? != 0 ]] ; then
    brew bundle;
fi

# Symlink the dotfiles to the parent directory
echo "###################################################"
echo "symlinking dotfiles into parent directory..."
for dir in  `find * -type d -maxdepth 0 \( -iname ".*" \)`
do
    stow $dir 
done
echo "done!"
