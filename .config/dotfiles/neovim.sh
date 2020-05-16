#!/bin/bash

NVIMDIR=/home/$1/.config/nvim

mkdir -p $NVIMDIR/autoload
curl -fLo $NVIMDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd $NVIMDIR
virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt
deactivate

nvim -c "PlugInstall" -c "qa\!"
nvim -c "GoInstallBinaries" -c "qa\!"
