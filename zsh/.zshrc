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
export PATH="$PATH:/node_modules/.bin"

source $ZSH/oh-my-zsh.sh
export ANDROID_HOME="$HOME/Library/Android"
export PATH="$ANDROID_HOME:$HOME/.rbenv/bin:$HOME/Downloads/xbuild-maste:$PATH"
eval "$(rbenv init -)"
export GOPATH="$HOME/Documents/go"
export GOROOT_BOOTSTRAP=$GOROOT
export XBUILD="$HOME/Downloads/xbuild-master"
export EDITOR='mvim -f'
alias n='nvim'
alias v='mvim'
alias a='atom'

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yutao.long/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/yutao.long/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yutao.long/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/yutao.long/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
