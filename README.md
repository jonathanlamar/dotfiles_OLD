# Dotfiles

These are my dotfiles.  **By far** Most work has been done on the vim config.

## To-do list

1. Integrate relevant parts of init.vim with vscode and intellij vim plugins (in
   progress).

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

I made an Ansible playbook for installing, hidden in
`.config/dotfiles/install.sh`.  Just execute that script (from that directory)
and follow the prompts.

### Manual Install

To install manually, follow the steps in the install scripts in your shell.  It
really isn't that complicated.
