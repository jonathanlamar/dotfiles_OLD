" ## 4. Cool remaps
"
" g Leader key
" let mapleader=" "
" " let localleader=" "
" nnoremap <Space> <Nop>

" map to move up/down over wraps
nnoremap j gj
nnoremap k gk

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

" Source vimrc after saving.  Have to refresh airline and colorscheme to fix
" some weird behavior, which is probably related to order of settings
" FIXME: This doesn't fix the issue.  I still have to manually call
" :colorscheme gruvbox
function! ResetColors()
  AirlineRefresh
  " colorscheme gruvbox
endfunction

autocmd! bufwritepost $MYVIMRC source % | call ResetColors()

" Window resize a la i3
nnoremap <M-j> :resize -1<CR>
nnoremap <M-k> :resize +1<CR>
nnoremap <M-h> :vertical resize -1<CR>
nnoremap <M-l> :vertical resize +1<CR>
