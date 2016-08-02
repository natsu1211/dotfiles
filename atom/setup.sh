#!/bin/sh
#author: natsu1211

set -eu

has() {
	type "$1" > /dev/null 2>&1
}
ATOM_HOME=$HOME/.atom
DIR=`cd $(dirname $0); pwd`
slink() {
	[ -e "$2" ] || ln -sf "$1" "$2"
}
#install Atom
cd $HOME
if [ "$(uname)" = "Darwin" ]; then
  #has atom || curl -OL https://github.com/atom/atom/releases/download/v1.9.0/atom-mac.zip && unzip atom-mac.zip && mv atom.app $HOME/Applications
  has atom || brew install caskroom/cask/brew-cask
	has atom || brew cask install atom
elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
  #has atom || curl -OL https://github.com/atom/atom/releases/download/v1.9.0/atom-amd64.tar.gz && tar -xzf atom-amd64.tar.gz
  sudo apt-get install atom
fi
cd $DIR
#clone from gist
git clone https://gist.github.com/c75b07894f099c5ffe2a8b9a7513373c.git atom-settings && cd atom-settings
for file in init.coffee keymap.cson settings.json snippets.cson styles.less
do
    if [ -e $ATOM_HOME/$file ]; then
        old=${file}_old
        mv $ATOM_HOME/$file $ATOM_HOME/$old
    fi

    slink $DIR/$file $ATOM_HOME/$file
done
