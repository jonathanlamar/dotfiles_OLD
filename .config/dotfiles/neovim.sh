#!/bin/bash

NVIMDIR=$HOME/.config/nvim

mkdir -p $NVIMDIR/autoload
curl -fLo $NVIMDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd $NVIMDIR
virtualenv --system-site-packages venv
source venv/bin/activate
pip install -r requirements.txt
deactivate

echo "Installing vim plugins."
nvim +"PlugInstall" +qa

echo "Configuring golang integration with neovim."
# Golang stuff.
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/repos/golang
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
nvim +"GoInstallBinaries" +qa

