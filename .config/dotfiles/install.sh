#!/bin/bash

# Install apt dependencies
sudo apt install curl exuberant-ctags git golang-go neovim nodejs \
    npm openjdk-8-jdk python3-gi python3-pip python3-xlib ripgrep xsel yarn zsh

# Install pip dependencies
pip3 install pylint jedi virtualenv

# Install pygrid
./pygrid.sh

# Change default shell to fzf
chsh -s /bin/zsh

# Install oh-my-zsh
./ohMyZsh.sh

# Install powerline fonts
./powerline.sh

# Install fzf
./fzf.sh

# Install neovim
./neovim.sh