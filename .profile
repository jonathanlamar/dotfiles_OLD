alias ll="ls -lhG"
alias la="ls -alhG"
alias vim="nvim"
alias pip=pip3
alias python=python3
alias cl=clear
alias jnb="jupyter notebook"

export EDITOR="nvim -n"

# Dotfiles for easy access
export PROFILE=$HOME/.profile
export SCRIPTS=$HOME/.scripts
export VIMRC=$HOME/.config/nvim/init.vim
export REPOS=$HOME/repos

# Make sure my scripts are on path
export PATH=$SCRIPTS:$PATH

# python virtualenv stuff
export PATH=$HOME/Library/Python/3.8/bin:$PATH

# Need to add library to path
export PATH=/Library/Frameworks/R.framework/Resources:$PATH

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
