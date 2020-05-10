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

### Ansible Install

I made an Ansible playbook for installing, hidden in
`.config/dotfiles/install.yml`.  This has not been tested, but should work in
Ubuntu.

### Manual Install

To install without Ansible, follow the steps in the playbook in your shell.  It
should be fairly human-readable.
