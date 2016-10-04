#!/bin/sh
#author: natsu1211
set -eu
for folder in git vim_win tmux bash
do
    cd $folder
    sh setup.sh
    cd ..
done
