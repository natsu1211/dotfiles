#!/bin/sh
init_target ideaVim
process_ideaVim(){
	symlink Lvim/.vimrc.min .ideavimrc
}
