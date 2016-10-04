#!/bin/sh
#author: natsu1211

set -eu
has() {
	type "$1" > /dev/null 2>&1
}

slink() {
    [ -e "$2" ] || ln -sf "$1" "$2"
}
#install tmux
if ! has tmux; then
	if [ "$(uname)" = "Darwin" ]; then
		brew install tmux
	elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
    sudo apt-get install tmux
	fi
fi

#link
set -eu
DIR=`cd $(dirname $0); pwd`
for file in tmux.conf; do
    if [ -e $HOME/.$file ]; then
        old=${file}_old
        mv $HOME/.$file $HOME/.$old
    fi

    slink $DIR/.$file $HOME/.$file
done


