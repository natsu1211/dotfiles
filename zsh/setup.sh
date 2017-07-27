#!/bin/sh

init_target zsh
process_zsh(){
	symlink zsh/.zshrc.base .zshrc
}
