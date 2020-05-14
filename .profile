alias ll="ls -lhG"
alias la="ls -alhG"
alias vim="nvim"
alias jnb="jupyter notebook"
alias pip=pip3
alias python=python3

export EDITOR="nvim -n"
export BROWSER="firefox"
export TERMINAL="alacritty"

# Dotfiles for easy access
export PROFILE=$HOME/.profile
export SCRIPTS=$HOME/.scripts
export VIMRC=$HOME/.config/nvim/init.vim
export REPOS=$HOME/repos

# Make sure my scripts are on path
export PATH=$SCRIPTS:$PATH

# python virtualenv stuff
export PATH=$HOME/.local/bin:$PATH

# Golang stuff.
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/repos/golang
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/bin/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/bin/fzf/bin"
fi

# FZF functions

# Checkout git branch
fbr() {
  # git fetch
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf --height=50% +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

# ls and change directory
lscd() {
  # git fetch
  dirs=$(ls -a -1) &&
  dir=$(echo "$dirs" | fzf --height=50%) &&
  cd $dir
}
