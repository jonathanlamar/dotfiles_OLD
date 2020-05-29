#!/bin/bash

if [ -d $HOME/.oh-my-zsh ]
then
    echo "$HOME/.oh-my-zsh found.  Deleting it."
    rm -rf $HOME/.oh-my-zsh
fi

git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

# Place custom theme in correct location
ln $HOME/.oh-my-zsh/custom/themes/mine.zsh-theme $HOME/.config/dotfiles/mine.zsh-theme
