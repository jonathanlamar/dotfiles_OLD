#!/bin/bash

# Install pacman dependencies
yes | sudo pacman -S alacritty blueman bluez bluez-utils curl feh flameshot \
    fzf git gnome-keyring gnome-keyring go htop i3-gaps jdk-openjdk light-locker \
    lightdm lightdm-slick-greeter neovim nodejs npm picom playerctl \
    pulseaudio-bluetooth python-pip ranger ripgrep rofi unzip wget xorg-xbacklight \
    xsel yarn zip zsh

# Not sure about these
#python3-gi python3-xlib

# Install yay
./yay.sh

# Install AUR dependencies
yes | yay -S universal-ctags autotiling deadd-notification-center ytop

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
