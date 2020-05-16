#!/bin/bash

HOMEDIR=/home/$1

cd $HOMEDIR
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

if [ -f $HOMEDIR/.zshrc.pre-oh-my-zsh ]
then
    echo "$HOMEDIR/.zshrc was moved.  Moving it back."
    rm $HOMEDIR/.zshrc
    mv $HOMEDIR/.zshrc.pre-oh-my-zsh .zshrc
fi
