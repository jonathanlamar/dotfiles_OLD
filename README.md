# Dotfiles

These are my dotfiles.

## To-do list

1. Better pandoc loop script.  I want to detect changes to a wildcard search of markdown files, and compile all to their corresponding pdf outputs.
2. build script
3. Set up python virtual environment for nvim as suggested online. (I'm just lazy and haven't done it yet)

## Install

### Dependencies
The following are dependencies, whose installation varies by platform
* ripgrep
* fzf (but not through apt.  Build through source instead)
* python3
* exuberant ctags
* node.js
* yarn (TODO: Maybe.  I think it's only for building coc.nvim) Install using the following (may not be cross platform):
```bash
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

### Install instructions for neovim

* Once the above dependencies are met, run the following commands (should be cross platform at this point).
```bash
# Install coursier for metals (Make sure to use coursier v1.1.0-M9 or newer).
curl -L -o coursier https://git.io/coursier
chmod +x coursier
sudo ./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.7.6 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f

# Prep $HOME/.config/nvim.
mkdir -p ~/.config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

sudo pip3 install pynvim virtualenv sexpdata websocket-client
```
* Then, open vim and run `:PlugInstall`, then close, restart, and run `:UpdateRemotePlugins`.



