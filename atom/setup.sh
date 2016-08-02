#!/bin/sh
#author: natsu1211

set -eu

has() {
	type "$1" > /dev/null 2>&1
}

#install Atom
cd $HOME
if [ "$(uname)" = "Darwin" ]; then
  #has atom || curl -OL https://github.com/atom/atom/releases/download/v1.9.0/atom-mac.zip && unzip atom-mac.zip && mv atom.app $HOME/Applications
  has atom || brew install caskroom/cask/brew-cask && brew cask install atom
elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
  #has atom || curl -OL https://github.com/atom/atom/releases/download/v1.9.0/atom-amd64.tar.gz && tar -xzf atom-amd64.tar.gz
  sudo apt-get install atom
fi
