" ## 4. Cool remaps

" map to move up/down over wraps
" nnoremap j gj
" nnoremap k gk

imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>

nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

" Insert mode nav keys
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Half page up/down but recenter
nnoremap <m-d> Lzz
nnoremap <m-u> Hzz

" When using macros, I always accidentally hit shift-Q and go to Ex mode.
nnoremap Q <Nop>

" Add blank line below cursor
nnoremap <M-o> o<Esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

if !exists('g:vscode')

  " Navigation a la Intellij
  nnoremap <C-[> <C-O> 
  nnoremap <C-]> <C-I> 
  " nnoremap <C-O> <Nop>
  " nnoremap <C-I> <Nop>

  " Make it easier to make it easier to edit text :P
  map <leader>rc :tabe $MYVIMRC <cr>
  autocmd! bufwritepost $MYVIMRC source % " TODO: This breaks vim-airline.

  " easier split navigations
  " a la i3
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-L> <C-W><C-L>

  " Window resize a la i3
  nnoremap <M-j> :resize -1<CR>
  nnoremap <M-k> :resize +1<CR>
  nnoremap <M-h> :vertical resize -1<CR>
  nnoremap <M-l> :vertical resize +1<CR>

endif