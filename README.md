# Dotfiles

These are my dotfiles.  Most work has been done on the vim config, but the i3
config is coming along nicely.

## Install

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

### Install script

I made a shell script for installing the necessary dependencies, after the repo
has been clones.  It is hidden in `.config/dotfiles/install.sh`.  Just execute
that script (from that directory) and follow the prompts.  It should work on
Ubuntu 20, but no promises.

### Manual Install

To install manually, follow the steps in the install scripts in your shell.  It
really isn't that complicated.
