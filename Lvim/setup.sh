#!/bin/sh
init_target Lvim

process_Lvim(){
	symlink Lvim/.vimrc .vimrc
	symlink Lvim/.ycm_extra_conf.py .ycm_extra_conf.py
	if [ ! -d "$HOME/.vim" ]; then
		directory $HOME/.vim
	fi
	symlink Lvim/userautoload/ .vim/userautoload
	symlink Lvim/template .vim/template
	symlink Lvim/colors .vim/colors
	symlink Lvim/autoload .vim/autoload
}
