#!/bin/sh
#author: natsu1211

set -eu
has() {
	type "$1" > /dev/null 2>&1
}

#install tmux
if ! has tmux; then
	if [ "$(uname)" = "Darwin" ]; then
		brew install tmux
	elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
    sudo apt-get install tmux
	fi
fi
