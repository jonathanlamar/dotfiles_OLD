#!/bin/bash

FZFDIR=$HOME/bin/fzf

if [ -d $FZFDIR ]
then
    echo "$FZFDIR exists.  Deleting it."
    rm -rf $FZFDIR
fi

git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
cd $FZFDIR
yes n | ./install

# Clean up junk
rm $HOME/.fzf.*
