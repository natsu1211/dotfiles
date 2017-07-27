#!/bin/sh
init_target Lvim

process_Lvim(){
	symlink Lvim/.vimrc .vimrc
	symlink Lvim/.ycm_extra_conf.py .ycm_extra_conf.py
	symlink Lvim/userautoload/ .vim/userautoload
	symlink Lvim/template .vim/template
}
