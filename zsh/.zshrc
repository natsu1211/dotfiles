# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gianu"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

plugins=(git ruby rails brew  z common-aliases hub)
# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
alias v='mvim'
alias a='atom'
export PATH="$HOME/.rbenv/bin:$HOME/Downloads/xbuild-maste:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk
eval "$(rbenv init -)"
export GOPATH="$HOME/Documents/go"
export GOROOT_BOOTSTRAP=$GOROOT
export XBUILD="$HOME/Downloads/xbuild-master"
# export EDITOR="/Applications/MacVim.app/Contents/MacOS/MacVim"
export EDITOR='mvim -f'

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
