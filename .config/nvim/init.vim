" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala
" development, without too much bloat.

" Outstanding TODOs:
" 1. Integrate with vim plugins for intellij, vscode, and other editors
" 2. Figure out option for Alt+* keybindings in Mac (use option instead)

" Virtual environment for running required neovim modules
" TODO: Figure out where this belongs.
let g:python3_host_prog = expand('~/.config/nvim/venv/bin/python')

" Remember gf goes to a file!
source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybindings.vim
source $HOME/.config/nvim/plugins/settings/vim-which-key.vim " This must be sourced after all bindings.
source $HOME/.config/nvim/general/terminal.vim
source $HOME/.config/nvim/filetypes/filetypes.vim

