#!/bin/sh
#author: natsu1211

for folder in atom git vim zsh tmux
do
    cd $folder
    sh setup.sh
    cd ..
done
