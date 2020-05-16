#!/bin/bash

FZFDIR=/home/$1/bin/fzf

if [ -d $FZFDIR ]
then
    echo "$FZFDIR exists.  Deleting it."
    rm -rf $FZFDIR
fi

git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
cd $FZFDIR
./install

# Clean up junk
rm /home/$1/.fzf.*
