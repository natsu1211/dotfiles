#!/bin/bash

process_pre(){
	#install homebrew
	if ! has brew; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew update
	fi
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
		if [ ! -d $HOME/.oh-my-zsh ]; then
			cd $HOME  || return
			sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		fi
	fi
	#install anyenv
	if ! has anyenv; then
		git clone https://github.com/riywo/anyenv ~/.anyenv
		symlink $HOME/github/dotfiles/zsh/.zshrc.base $HOME/.zshrc
		source $HOME/.zshrc
		$SHELL -l
		if ! has rbenv; then
			anyenv install rbenv
			$SHELL -l
			RECOMMENDED_RB_VAR="2.5.1"
			rbenv install $RECOMMENDED_RB_VAR
			rbenv global $RECOMMENDED_RB_VAR
			rbenv rehash
			gem install bundler
			gem install rubocop
		fi
		if ! has pyenv; then
			anyenv install pyenv
			$SHELL -l
			RECOMMENDED_PY3_VAR="3.7"
			export PYTHON_CONFIGURE_OPTS="--enable-framework"
			pyenv install $RECOMMENDED_PY3_VAR
			pyenv global $RECOMMENDED_PY3_VAR
			pyenv rehash
		fi
		if ! has goenv; then
			anyenv install goenv
			$SHELL -l
			RECOMMENDED_GO_VAR="1.10.3"
			goenv install $RECOMMENDED_GO_VAR
			goenv global $RECOMMENDED_GO_VAR
			goenv rehash
		fi
	fi

	#install Atom
	if [ "$(uname)" = "Darwin" ]; then
		brew cask update
		has atom || brew cask install atom
	elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
		sudo apt-get install atom
	fi
	#install vscode
	if [ "$(uname)" = "Darwin" ]; then
		has visual-studio-code || brew cask install visual-studio-code
	fi
	#install tmux
	if ! has tmux; then
		if [ "$(uname)" = "Darwin" ]; then
			brew install tmux
		elif [ "$(expr substr "$(uname -s)" 1 5)" = "Linux" ]; then
			sudo apt-get install tmux
		fi
	fi
	#install NeoVim
	if [ "$(uname)" = "Darwin" ]; then
		has nvim || brew install neovim
		sudo pip install --upgrade neovim
	fi
	#install macvim
	if [ "$(uname)" = "Darwin" ]; then
		brew install macvim
	fi

	#install prerequist for YCM
	# CMake
	brew install --upgrade cmake
	# c# support
	brew install mono
	# js,ts support
	if ! has nvm; then
		#install nvm, nodejs, npm
		curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
		source ~/.zshrc
		nvm install node
		npm install -g typescript
	fi
	# rust support
	brew install rust
	# rsense
	gem install rsense
	# jedi
	pip install jedi
	# pylint
	pip install pylint
	# font
	FONT_DIR=$HOME/fonts
	cd $HOME || return
	git clone https://github.com/powerline/fonts.git
	cd $FONT_DIR || return
	./install.sh
	cd $HOME || return
	# tig
	brew install tig
}
