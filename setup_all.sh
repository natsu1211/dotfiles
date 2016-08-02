#!/bin/sh
#author: natsu1211
set -eu
#install homebrew
if [ "$(uname)" = "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
for folder in atom git vim zsh tmux ruby
do
    cd $folder
    sh setup.sh
    cd ..
done
