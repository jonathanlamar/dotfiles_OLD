#!/bin/bash

FONTDIR=/usr/share/fonts

cd $HOME/Downloads

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip -d FiraMono
sudo cp -r FiraMono $FONTDIR
rm -r FiraMono FiraMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip -d DejaVuSansMono
sudo cp -r DejaVuSansMono $FONTDIR
rm -r DejaVuSansMono DejaVuSansMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d Hack
sudo cp -r Hack $FONTDIR
rm -r Hack Hack.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip -d Iosevka
sudo cp -r Iosevka $FONTDIR
rm -r Iosevka Iosevka.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip
unzip Terminus.zip -d Terminus
sudo cp -r Terminus $FONTDIR
rm -r Terminus Terminus.zip

# I don't know why this these are not included out of the box...
wget http://raw.githubusercontent.com/adi1090x/polybar-themes/master/polybar-8/fonts/Material.ttf
sudo mv Material.ttf $FONTDIR

sudo fc-cache -f -v
