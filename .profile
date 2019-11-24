export PATH=$PATH:$HOME/.scripts
# Auto-added by yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR="nvim -n"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"

# Dotfiles for easy access
export PROFILE=$HOME/.profile
export SCRIPTS=$HOME/.scripts
export VIMRC=$HOME/.config/nvim/init.vim

#export TERM=xterm-256color

alias ll="ls -lhG --color"
alias la="ls -alhG --color"
alias vim="nvim"
alias jnb="jupyter notebook"
alias pip=pip3
alias python=python3

# Golang stuff.  Going with 1.13 even though apt installed 1.12.
export GOROOT=/lib/go-1.13
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/repos/golang

# This was to auto-start xserver on my rickety arch laptop.
# if [[ "$(tty)" = "/dev/tty1" ]]; then
# 	#setfont ter-v24n # Irrelevant now that I have set /etc/vconsole.conf
# 	pgrep i3 || startx
# fi


# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jon/Applications/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jon/Applications/fzf/bin"
fi
