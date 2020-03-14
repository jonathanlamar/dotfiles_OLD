alias ll="ls -lhG --color"
alias la="ls -alhG --color"
alias vim="nvim"
alias jnb="jupyter notebook"
alias pip=pip3
alias python=python3

export EDITOR="nvim -n"
export BROWSER="firefox"
export TERMINAL="gnome-terminal"

# Dotfiles for easy access
export PROFILE=$HOME/.profile
export SCRIPTS=$HOME/.scripts
export VIMRC=$HOME/.config/nvim/init.vim
export REPOS=$HOME/repos

# Make sure my scripts are on path
export PATH=$SCRIPTS:$PATH

# python virtualenv stuff
export PATH=$HOME/.local/bin:$PATH

# Auto-added by yarn
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH

# Golang stuff.  Going with 1.13 even though apt installed 1.12.
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/repos/golang
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jon/bin/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jon/bin/fzf/bin"
fi
