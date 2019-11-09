export PATH=$PATH:$HOME/.scripts
export EDITOR="nvim -n"
export TERMINAL="termite"
export BROWSER="firefox"

# Dotfiles for easy access
export PROFILE=~/.profile
export VIMRC=~/.config/nvim/init.vim

#export TERM=xterm-256color

alias ll="ls -lhG --color"
alias la="ls -alhG --color"
alias vim="nvim"
alias jnb="jupyter notebook"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	#setfont ter-v24n # Irrelevant now that I have set /etc/vconsole.conf
	pgrep i3 || startx
fi

#neofetch

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
