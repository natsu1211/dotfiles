#!/bin/sh
#author: natsu1211

set -eu

DIR=`cd $(dirname $0); pwd`
for file in zshrc; do
    if [ -e $HOME/.$file ]; then
        old=$file${str}_old
        mv $HOME/.$file $HOME/.$old
    fi

    ln -sf $DIR/$file $HOME/.$file
done
