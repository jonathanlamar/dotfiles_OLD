#!/bin/bash

CLONEDIR=/home/$1/repos/notMine

if [ ! -d $CLONEDIR ]
then
    echo "$CLONEDIR does not exist.  Creating it."
    mkdir -p $CLONEDIR
fi

git clone https://github.com/powerline/fonts.git --depth=1 $CLONEDIR/fonts
cd $CLONEDIR/fonts
./install.sh
cd ..
rm -rf fonts
