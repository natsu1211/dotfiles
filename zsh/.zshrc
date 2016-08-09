# Path to your oh-my-zsh installation.
export ZSH=/Users/yutao.long/.oh-my-zsh

ZSH_THEME="gianu"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

plugins=(git ruby rails brew  z common-aliases)
# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/share/npm/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v='mvim'
export PATH="$HOME/.rbenv/bin:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk
eval "$(rbenv init -)"
export GOPATH="$HOME/Documents/go"
export GOROOT_BOOTSTRAP=$GOROOT
export EDITOR=/Applications/TextEdit.app/Contents/MacOS/MacVim


[[ -s "/Users/yutao.long/.gvm/scripts/gvm" ]] && source "/Users/yutao.long/.gvm/scripts/gvm"
