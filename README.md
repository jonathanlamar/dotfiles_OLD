# Dotfiles

These are my dotfiles.  Most work has been done on the vim config.

## To-do list

1. Better pandoc loop script.  I want to detect changes to a wildcard search of
markdown files, and compile all to their corresponding pdf outputs.
2. Write a build script!

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

* neovim >= 0.4.2 (compile from source if on ubuntu; requires cmake and other dependencies)
* ripgrep
* fzf (but not through apt.  Build through source instead)
* python3
  * also the `jedi` package available through pip, for code completion.
* exuberant ctags
* node.js and npm
* yarn
* java

### Install instructions for neovim

* Once the above dependencies are met, run the following commands (should be
cross platform at this point).

```bash

# Prep $HOME/.config/nvim.
mkdir -p ~/.config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip install virtualenv
cd ~/.config/nvim
virtualenv venv
source venv/bin/activate
pip install pynvim sexpdata websocket-client
deactivate
```

Run the following commands in neovim

```vim
:PlugInstall
:GoInstallBinaries
:CocInstall coc-python
```

Finally, install metals node module

```bash
cd ~/.config/coc/extensions
npm install metals-languageclient
```
