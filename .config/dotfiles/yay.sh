#!/bin/bash

CLONEDIR=$HOME/repos/notMine

if [ ! -d $CLONEDIR ]
then
    echo "$CLONEDIR does not exist.  Creating it."
    mkdir -p $CLONEDIR
fi

cd $CLONEDIR

git clone https://aur.archlinux.org/yay.git

cd yay

yes | makepkg -si
