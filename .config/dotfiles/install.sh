#!/bin/bash

# Install pacman dependencies
yes | sudo pacman -S alacritty curl fzf git go i3-gaps i3lock neovim nodejs \
    npm jdk-openjdk light picom python-pip ranger ripgrep unzip wget \
    xorg-xbacklight xsel yarn zip zsh

# Not sure about these
#python3-gi python3-xlib

# Install yay
./yay.sh

# Install AUR dependencies
yes | yay -S universal-ctags autotiling

# Install pip dependencies
pip3 install pylint jedi virtualenv

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
