#!/bin/sh
#author: natsu1211

DIR=`cd $(dirname $0); pwd`
if ! [ -d $HOME/.oh-my-zsh ] ; then
    cd $HOME
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
for file in zshrc; do
    if [ -e $HOME/.$file ]; then
        old=$file${str}_old
        mv $HOME/.$file $HOME/.$old
    fi

    ln -sf $DIR/.$file $HOME/.$file
done

