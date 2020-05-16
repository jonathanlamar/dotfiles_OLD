#!/bin/bash

read -p "Enter your username: " USERNAME
read -p "Enter your password: " PASSWD

# Install apt dependencies
echo $PASSWD | sudo -S apt install exuberant-ctags git golang-go neovim nodejs \
    npm openjdk-8-jdk python3-gi python3-pip python3-xlib ripgrep xsel yarn zsh

# Install pip dependencies
pip3 install pylint jedi virtualenv

# Install pygrid
./pygrid.sh $USERNAME

# Change default shell to fzf
yes $PASSWD | chsh -s /bin/zsh

# Install oh-my-zsh
./ohMyZsh.sh $USERNAME

# Install powerline fonts
./powerline.sh $USERNAME

# Install fzf
./fzf.sh $USERNAME

# Install neovim
./neovim.sh $USERNAME
