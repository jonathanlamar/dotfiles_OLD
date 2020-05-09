" ## 4. Cool remaps

" map to move up/down over wraps
nnoremap j gj
nnoremap k gk

" Half page up/down but recenter
nnoremap <m-d> Lzz
nnoremap <m-u> Hzz

""  The sacred spacebar remap
"nnoremap <space> ifoo<ESC>

" Make it easier to make it easier to edit text :P
map <leader>rc :tabe $MYVIMRC <cr>
" TODO: This breaks vim-airline.
autocmd! bufwritepost $MYVIMRC source %

" When using macros, I always accidentally hit shift-Q and go to Ex mode.
nnoremap Q <Nop>

" easier split navigations
" a la i3
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Window resize a la i3
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Add blank line below cursor
nnoremap <M-o> o<Esc>

