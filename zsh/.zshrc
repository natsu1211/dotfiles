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
# export ANDROID_SDK="$HOME/Library/Android/sdk"
# export ANDROID_NDK_ROOT="$HOME/Library/Android/sdk/ndk-bundle"
# export ANDROID_HOME="$HOME/Library/Android/sdk"
eval "$(rbenv init -)"
export GOPATH="$HOME/Documents/go"
export GOROOT_BOOTSTRAP=$GOROOT
export XBUILD="$HOME/Downloads/xbuild-master"
# export EDITOR="/Applications/MacVim.app/Contents/MacOS/MacVim"
export EDITOR='mvim -f'

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yutao.long/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/yutao.long/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yutao.long/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/yutao.long/google-cloud-sdk/completion.zsh.inc'; fi
