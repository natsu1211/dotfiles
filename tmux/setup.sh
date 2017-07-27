#!/bin/sh
#author: natsu1211
init_target tmux
process_tmux(){
	symlink tmux/.tmux.conf .tmux.conf
}
