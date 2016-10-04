#!/bin/sh
#author: natsu1211

set -eu
slink() {
	[ -e "$2" ] || ln -sf "$1" "$2"
}
DIR=`cd $(dirname $0); pwd`
for file in bashrc; do
    if [ -e $HOME/.$file ]; then
        old=${file}_old
        mv $HOME/.$file $HOME/.$old
    fi

    slink $DIR/.$file $HOME/.$file
done

