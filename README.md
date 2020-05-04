# Dotfiles

These are my dotfiles.  Most work has been done on the vim config.

## To-do list

1. Consolidate branches and handle different computers by sourcing another file,
   or somethinhg.
2. Automate build using ansible.

## Install

I don't have a script for deploying this repo, so you'll have to follow these
instructions and be ready to improvise.

### Cloning

The best and easiest way is to clone directly into your home directory. This is
done with the following commands.

```bash
cd
git init
git remote add origin https://github.com/jonathanlamar/dotfiles.git
git fetch
git checkout -f master
git pull
```

### Dependencies

The following are dependencies, whose installation varies by platform

* neovim >= 0.4.3 (as of Ubuntu 20.04, this is the version available through
    apt.)
* ripgrep
* fzf, but not through apt.
  * Clone the repo and follow the install instructions,
  * Install in ~/bin/fzf, and do not let the installer update the dotfiles.
* python3
  * `pip3 install jedi virtualenv`
* exuberant-ctags
* nodejs
* npm
* yarn
* java 8

### Install instructions for neovim

* Once the above dependencies are met, run the following commands (should be
cross platform at this point).

```bash

# Prep $HOME/.config/nvim.
mkdir -p ~/.config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/.config/nvim
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```

Run the following commands in neovim

```vim
:PlugInstall
:GoInstallBinaries
:CocInstall coc-python
:CocInstall coc-metals
```
