export PATH=$PATH:$HOME/.scripts
# Auto-added by yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR="nvim -n"
export TERMINAL="iTerm2"
# export BROWSER="firefox"

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

# This was to auto-start xserver on my rickety arch laptop.
# if [[ "$(tty)" = "/dev/tty1" ]]; then
# 	#setfont ter-v24n # Irrelevant now that I have set /etc/vconsole.conf
# 	pgrep i3 || startx
# fi


