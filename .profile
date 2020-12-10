alias ll="ls -lhGt"
alias la="ls -alhGt"
alias vim="nvim"
alias pip=pip3
alias python=python3
alias cl=clear

export EDITOR="nvim -n"
export BROWSER="google-chrome-stable"
export TERMINAL="alacritty"

# Dotfiles for easy access
export PROFILE=$HOME/.profile
export SCRIPTS=$HOME/.scripts
export VIMRC=$HOME/.config/nvim/init.vim
export REPOS=$HOME/repos

# Make sure my scripts are on path
export PATH=$SCRIPTS:$PATH

# Make sure cargo is on PATH
source "$HOME/.cargo/env"

# python virtualenv stuff
export PATH=$HOME/.local/bin:$PATH

# Java stuff
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
alias jshell=$JAVA_HOME/bin/jshell

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jon/repos/notMine/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jon/repos/notMine/fzf/bin"
fi

# TODO: Make these scripts and move to $SCRIPTS
function fv() {
    local file
    file="$(fzf --height 40% --reverse --query="$1" --select-1 --exit-0)"
    [[ -n $file ]] && vim $file
}

function tm() { 
    if [[ -n $1 ]]; then
        tmux new -A -s $1
    else
        tmux
    fi
}

function tma() {
    local sess
    sess="$(tmux ls | sed "s/:.*//" | fzf --height 40% --reverse --select-1 --exit-0)"
    [[ -n $sess ]] && tmux new -A -s $sess
}
