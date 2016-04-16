#!/bin/bash

for dir in  `find * -type d -maxdepth 0 \( -iname ".*" \)`
do
    stow $dir 
done
