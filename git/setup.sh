#!/bin/sh
init_target git
process_git(){
	symlink git/.gitconfig .gitconfig
	symlink git/.gitignore_global .gitignore_global
}
