#!/bin/sh
init_target atom
process_atom(){
	if [ -d $HOME/.atom/ ]; then
		for file in init.coffee keymap.cson snippets.cson styles.less
		do
			symlink atom/$file .atom/$file
		done
	fi
}
