#!/bin/bash

FZFDIR=/home/$1/bin/fzf

git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
.$FZFDIR/install
rm /home/$1/.fzf.*
