#!/bin/sh
#author: natsu1211

set -eu
#link .vimrc
for folder in vim_min vsvim
do
    cd $folder
    sh setup.sh
    cd ..
done

