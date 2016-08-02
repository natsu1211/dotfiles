#!/bin/sh
#author: natsu1211
set -eu
DIR=`cd $(dirname $0); pwd`
for file in vimrc ycm_extra_conf.py
do
    if [ -e $HOME/.$file ]; then
        old=${file}_old
        mv $HOME/.$file $HOME/.$old
    fi

    ln -sf $DIR/.$file $HOME/.$file
done
