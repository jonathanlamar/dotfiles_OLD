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

# echo "Installing vim plugins."
# nvim -c "PlugInstall" -c "qa\!"

# if [ ! -d $GOROOT ]
# then
#     echo "GOROOT not set.  Skipping golang integration with neovim."
#     echo "Set that up and run :GoInstallBinaries in a veovim session."
# else
#     echo "Configuring golang integration with neovim."
#     # Golang stuff.
#     export PATH=$GOROOT/bin:$PATH
#     export GOPATH=$HOME/repos/golang
#     export GOBIN=$GOPATH/bin
#     export PATH=$GOBIN:$PATH
#     nvim -c "GoInstallBinaries" -c "qa\!"
# fi

