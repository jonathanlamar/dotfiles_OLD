#!/bin/bash

# Install pacman dependencies
yes | sudo pacman -S alacritty blueman bluez bluez-utils curl feh flameshot \
    fzf git gnome-keyring gnome-keyring go htop i3-gaps jdk-openjdk light-locker \
    lightdm  neovim nodejs npm picom playerctl pulseaudio-bluetooth python-pip \
    ranger ripgrep rofi tmux unzip wget xorg-xbacklight xsel yarn zip zsh

# Install yay
./yay.sh

# Install AUR dependencies
yay -S autotiling deadd-notification-center light-locker lightdm-slick-greeter \
    universal-ctags ytop-bin

# Install pip dependencies
pip3 install pylint jedi virtualenv notify-send.py

# Install nerd fonts
./nerdfonts.sh

# Change default shell to fzf
chsh -s /bin/zsh

# Install oh-my-zsh
./ohMyZsh.sh

# Install neovim
./neovim.sh
