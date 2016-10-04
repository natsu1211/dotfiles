#!/bin/sh
#author: natsu1211
set -eu
#install homebrew
if [ "$(uname)" = "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
for folder in git vim_win tmux
do
    cd $folder
    sh setup.sh
    cd ..
done
