#!/bin/sh
#author: natsu1211

set -eu
slink() {
	[ -e "$2" ] || ln -sf "$1" "$2"
}
has() {
	type "$1" > /dev/null 2>&1
}

#install zsh
if ! has zsh; then
	if [ "$(uname)" = "Darwin" ]; then
		brew install zsh --disable-etcdir
		brew install zsh-completions
	elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
		sudo apt-get install zsh
	fi
fi
#install oh-my-zsh
if has zsh; then
	if [ ! -d $HOME/.oh-my-zsh ] ; then
	    cd $HOME
	    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
fi
DIR=`cd "$(dirname $0)"; pwd`
for file in zshrc; do
    if [ -e $HOME/.$file ]; then
        old=${file}_old
        mv $HOME/.$file $HOME/.$old
    fi

    slink $DIR/.$file $HOME/.$file
done
