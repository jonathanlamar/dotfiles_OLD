#!/bin/bash

BINDIR=/home/$1/bin

# Make bin if not there
if [ ! -d $BINDIR ]
then
    echo "$BINDIR does not exist.  Making it."
    mkdir $BINDIR
fi

# Delete pygrid if not there
if [ -d $BINDIR/pygrid ]
then
    echo "$BINDIR/pygrid exists.  Deleting it."
    rm -rf $BINDIR/pygrid
fi

echo "Cloning pygrid..."
git clone https://github.com/mjs7231/pygrid.git $BINDIR/pygrid
