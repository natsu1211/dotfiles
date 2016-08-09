#!/bin/sh
#author: natsu1211

set -eu
slink() {
	[ -e "$2" ] || ln -sf "$1" "$2"
}
has() {
	type "$1" > /dev/null 2>&1
}

#install MacVim
if [ "$(uname)" = "Darwin" ]; then
  has mvim || curl -OL https://github.com/macvim-dev/macvim/releases/download/snapshot-105/MacVim.dmg && unzip MacVim.zip && mv MacVim.app $HOME/Applications && cp /Applications/MacVim.app/Contents/MacOS/mvim /usr/local/bin
fi

#install xvim
cd $HOME
git clone https://github.com/XVimProject/XVim.git
cd XVim
make
#link .vimrc
for folder in Lvim xvim
do
    cd $folder
    sh setup.sh
    cd ..
done
