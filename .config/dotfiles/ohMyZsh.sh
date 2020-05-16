#!/bin/bash

HOMEDIR=/home/$1

if [ -d $HOMEDIR/.oh-my-zsh ]
then
    echo "$HOMEDIR/.oh-my-zsh found.  Deleting it."
    rm -rf $HOMEDIR/.oh-my-zsh
fi

git clone https://github.com/ohmyzsh/ohmyzsh.git $HOMEDIR/.oh-my-zsh
