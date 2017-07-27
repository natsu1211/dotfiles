#!/bin/sh
init_target atom
process_atom(){
	if [ -d $HOME/.atom/ ]; then
		for file in *.[!s][!h]*
		do
			symlink atom/$file .atom/$file
		done
	fi
}
