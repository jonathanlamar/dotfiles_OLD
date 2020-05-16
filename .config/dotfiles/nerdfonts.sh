#!/bin/bash

FONTDIR=/usr/share/fonts/truetype

cd $HOME/Downloads

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip -d FiraMono
sudo cp -r FiraMono $FONTDIR
rm -r FiraMono FiraMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip -d DejaVuSansMono
sudo cp -r DejaVuSansMono $FONTDIR
rm -r DejaVuSansMono DejaVuSansMono.zip

sudo fc-cache -f -v
