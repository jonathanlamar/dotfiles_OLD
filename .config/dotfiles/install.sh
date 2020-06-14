#!/bin/bash

# Install pacman dependencies
yes | sudo pacman -S alacritty curl fzf git go i3-gaps i3lock jdk-openjdk \
    light neovim nodejs npm picom python-pip ranger ripgrep unzip wget \
    xorg-xbacklight xsel yarn zip zsh

# Not sure about these
#python3-gi python3-xlib

# Install yay
./yay.sh

# Install AUR dependencies
yes | yay -S universal-ctags autotiling deadd-notification-center ytop

# Install pip dependencies
pip3 install pylint jedi virtualenv notify-send.py

# Other packages for my i3 config
./i3other.sh

# Install nerd fonts
./nerdfonts.sh

# Change default shell to fzf
chsh -s /bin/zsh

# Install oh-my-zsh
./ohMyZsh.sh

# Install neovim
./neovim.sh
