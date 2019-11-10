" README: Initial Setup
" DEPENDENCIES:
" The following are dependencies, whose installation varies by platform
" ripgrep, fzf, python3, exuberant ctags, node.js
"
" Is this cross-platform?
" curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
"
" # Make sure to use coursier v1.1.0-M9 or newer.
" curl -L -o coursier https://git.io/coursier
" chmod +x coursier
" sudo ./coursier bootstrap \
"   --java-opt -Xss4m \
"   --java-opt -Xms100m \
"   --java-opt -Dmetals.client=coc.nvim \
"   org.scalameta:metals_2.12:0.7.6 \
"   -r bintray:scalacenter/releases \
"   -r sonatype:snapshots \
"   -o /usr/local/bin/metals-vim -f
"
" Before copying this to ~/.config/nvim/init.vim, make sure to prep by running the following:
" > mkdir -p ~/.config/nvim/autoload
" > curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
" >     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" > curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" pip install pynvim
" pip install sexpdata websocket-client
" Then, open vim, run :PlugInstall, then close, restart, and run :UpdateRemotePlugins
"
" TODO: Set up python virtual environment for nvim as suggested online. (I'm
" lazy and haven't done it yet)



" ## 1: Plugins
"
"
"
execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype plugin on

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

" General functionality
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
" Bundle 'altercation/vim-colors-solarized' " Gross
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'mechatroner/rainbow_csv'
Plug 'derekwyatt/vim-scala' " This one has a bit more than syntax highlighting.
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Code auto-completion
"Plug 'davidhalter/jedi-vim' " Something for python I think?
Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
" IDE-like features for scala
Plug 'neoclide/coc.nvim', {'branch': 'release' }
" This was recommended in the install guide for coc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Commenting and other nice code stuff
" Comment-in-movement:
Plug 'tpope/vim-commentary'
" Surround-movement-with-X:
Plug 'tpope/vim-surround'
" Repleat-plugin-with-.:
Plug 'tpope/vim-repeat'

" CTRL P for fuzzy codebase searching
" FZF / Ctrlp for file navigation
if executable('fzf')
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

" Git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' " Not sure if this plays nice with fugitive.
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call plug#end()


" ## 2. Plugin Configs
"
"
"
" NERDTree stuff
let NERDTreeDirArrows = 1


" vim-scala - modern scaladoc indentation
let g:scala_scaladoc_indent = 1


" Airline settings
let g:airline_theme = 'gruvbox'
" Show tab line even if only one tab, but hide buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
" How to format long paths in tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


" Gruvbox settings need to be enabled before the colorscheme is set..?
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_white = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_number_column = 'bg1'


"Deoplete settings
" TODO: Figure out what these actually do.  I'm pretty sure deoplete is not optimal.
" Disable deoplete at start and only enable for specific filetypes below.
let g:deoplete#enable_at_startup = 0
let g:deoplete#auto_complete_delay = 500 " Wait this many milliseconds for autocomplete
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


" Ripgrep for file indexing, sort of faster, but not really, but also why not use ripgrep for everything
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
endif


" Use FZF for files and tags if available, otherwise fall back onto CtrlP
if executable('fzf')
  let g:fzf_command_prefix = 'Fzf' " namespacing commands
  " Change fzf actions to mimic nerdtree
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit' }
  " Set colors to match colorscheme
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>a :FzfBuffers<CR>
  nnoremap <leader>A :FzfWindows<CR>
  " <leader>j will search for tag using word under cursor
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
else
  nnoremap <leader>v :CtrlP<Space><cr>
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = '\v\.(xml|jar|properties)$'
endif





" ## 3. Basic sets
"
"
"

" No-brainers
set background=dark
colorscheme gruvbox
" Match tildes at end of buffer to number column color... sort of.
autocmd ColorScheme * highlight! EndOfBuffer ctermfg=243 guifg=#7c6f64
" Allow terminal default transparent background
" WARNING: Only do this if the terminal and vim colorschemes are the same
" autocmd ColorScheme * highlight! Normal guibg=NONE ctermbg=NONE
filetype plugin indent on    " required
set termguicolors " This allows truecolor, so the gruvbox settings work
set number
set relativenumber
syntax enable

" General stuff I like to have
set showcmd " drop-down tab completion on commands
set showmatch " highlight matching parens
set incsearch " search as characters are entered
set hlsearch " highlight matches
set splitbelow " This is more intuitive to me
set splitright

" Tabs are always four spaces and no funny business.
" Except for filetypes where I don't like that.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

" TODO: Does this actually have anything to do with fzf?  If not, remove it.
set wildignore+=.git/*,*/target/*
set lazyredraw
set wildmenu " I TODO: What does this do?

" Global code folding settings
set foldenable " enable folding
set foldlevelstart=100 " open most folds by default
set foldnestmax=1000 " 10 nested fold max

" When using macros, I always accidentally hit shift-Q and go to Ex mode.
nnoremap Q <Nop>

" I like to see a cursorline only on the active pane
" FIXME: This breaks nocursorline setting on terminals
augroup culine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup end

" easier split navigations
" a la i3
nnoremap <C-J> <C-W><C-J>
nnoremap <C-U> <C-W>-
nnoremap <C-K> <C-W><C-K>
nnoremap <C-I> <C-W>+
nnoremap <C-L> <C-W><C-L>
nnoremap <C-O> <C-W>>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Y> <C-W><
nnoremap <C-Y> <C-W><
nnoremap <C-Y> <C-W><



" ## 4. Cool remaps
"
"
"
" map to move up/down over wraps
nnoremap j gj
nnoremap k gk

""  The sacred spacebar remap
"nnoremap <space> ifoo<ESC>

" NERDTree stuff
augroup nerd
  autocmd!
  nnoremap <Leader>f :NERDTreeFocus <CR>
  autocmd FileType nerdtree nnoremap <Esc> :NERDTreeClose <CR>
augroup end

" Make it easier to make it easier to edit text :P
map <leader>rc :tabe $MYVIMRC <cr>
" TODO: This breaks vim-airline.
autocmd bufwritepost $MYVIMRC source $MYVIMRC

" ## 5. Terimal Stuff
"
"
"

" Terminal stuff for neovim
" These are for more permanent shells.  They will not persist on close
command! T new term://$SHELL | setlocal nonumber norelativenumber nocursorline
command! VT vnew term://$SHELL | setlocal nonumber norelativenumber nocursorline
command! TT tabnew term://$SHELL | setlocal nonumber norelativenumber nocursorline

" Set Esc to be the key for leaving the terminal.
" Except for fzf, where it is already mapped to kill the program and exit.
" This dumb mapping with no qualification is to silence an error for unmapping
" when there has been no map.  Very :|
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"


" Popup guake-style terminal
" Keep track of buffer and window with these variables
let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
  if win_gotoid(s:term_win)
    hide
  else
    botright new terminal
    exec "resize ".a:height
    try
      exec "buffer ".s:term_buf
      exec "bd terminal"
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
      setlocal nonu nornu scl=no nocul
    endtry
    startinsert!
    let s:term_win = win_getid()
  endif
endfunction

" TODO: Open a fixed percentage of overall lines
nnoremap <silent><leader>t :call TermToggle(20)<CR>
" FIXME: This activates in insert mode. Not good!
" inoremap <silent><leader>t <Esc>:call TermToggle(20)<CR>
" FIXME: This still activates in insert mode while in a terminal buffer.
" Also not good!
tnoremap <silent><leader>t <C-\><C-n>:call TermToggle(20)<CR>

" ## 6. Autogroups
"
"
"
" TODO: Move these to ftplugins folder
augroup python
  autocmd!
  autocmd FileType python set shiftwidth=4
  autocmd FileType python set softtabstop=4
  autocmd FileType python set tabstop=4
  autocmd FileType python set expandtab
  autocmd FileType python set autoindent
  autocmd Filetype python call deoplete#enable()
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  autocmd filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup sql
  autocmd!
  autocmd BufRead,BufNewFile *.hql set syntax=sql
  autocmd BufRead,BufNewFile *.sql,*.hql set tabstop=2
  autocmd BufRead,BufNewFile *.sql,*.hql set softtabstop=2
  autocmd BufRead,BufNewFile *.sql,*.hql set shiftwidth=2
  autocmd BufRead,BufNewFile *.sql,*.hql set softtabstop=2
  autocmd BufRead,BufNewFile *.sql,*.hql call deoplete#enable()
  autocmd BufWritePre *.sql,*.hql %s/\s\+$//e
augroup end

augroup scala
  autocmd!
  " TODO: Set filetype scala for sbt files
  autocmd BufRead,BufNewFile *.sbt set filetype=scala
  autocmd FileType scala set tabstop=2
  autocmd FileType scala set softtabstop=2
  autocmd FileType scala set shiftwidth=2
  autocmd FileType scala set softtabstop=2
  autocmd FileType scala set foldmethod=syntax " This will do for now
  " Still figuring out what to do RE deoplete and metals
  autocmd Filetype scala call deoplete#enable()
  autocmd BufWritePre *.scala,*.sbt %s/\s\+$//e
augroup end

augroup markdown
  autocmd!
  " TODO: Set filetype scala for sbt files
  autocmd FileType markdown set tabstop=4
  autocmd FileType markdown set softtabstop=4
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set softtabstop=4
  autocmd Filetype markdown call deoplete#disable()
  autocmd BufWritePre *.md %s/\s\+$//e
augroup end

augroup bash
  autocmd!
  autocmd FileType bash set tabstop=2
  autocmd FileType bash set softtabstop=2
  autocmd FileType bash set shiftwidth=2
  autocmd FileType bash set softtabstop=2
  autocmd Filetype bash call deoplete#enable()
  autocmd BufWritePre *.sh %s/\s\+$//e
augroup end

augroup vim
  autocmd!
  autocmd FileType vim set tabstop=2
  autocmd FileType vim set softtabstop=2
  autocmd FileType vim set shiftwidth=2
  autocmd FileType vim set softtabstop=2
  autocmd Filetype vim call deoplete#enable()
  autocmd BufWritePre *.vim %s/\s\+$//e
augroup end

