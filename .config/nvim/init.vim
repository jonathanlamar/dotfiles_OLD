" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala
" development, without too much bloat.

" Outstanding TODOs:
" 1. Look into better code folding settings.
" 2. Turn off drop down completion in free text entry (comments, text/markdown)
" 3. Work on better ranger integration.
" 4. Finish configuing coc-explorer
" 5. Goyo should preserve old splits.

" Virtual environment for running required neovim modules
" TODO: Figure out where this belongs.
let g:python3_host_prog = expand('~/.config/nvim/venv/bin/python')

source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybindings.vim
source $HOME/.config/nvim/plugins/settings/vim-which-key.vim " This must be sourced after all bindings.
source $HOME/.config/nvim/general/terminal.vim
source $HOME/.config/nvim/filetypes/filetypes.vim

