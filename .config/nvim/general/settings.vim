" ## 3. Basic settings

" Configure how vim runs

" Vim is becoming a slight memory hog... :/
set maxmempattern=10000

set clipboard=unnamedplus " Enable clipboard interaction.
set cmdheight=2 " Give more space for displaying messages.
set encoding=utf-8
set fileencoding=utf-8
set lazyredraw
set scrolloff=3
set mouse=a " Enable mouse interaction.
set nobackup " Recommended by coc
set nowritebackup " Recommended by coc
set noswapfile
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set showcmd " drop-down tab completion on commands
set updatetime=100 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set nocompatible
filetype plugin indent on    " required
syntax enable
set wildmenu " 'wild' tab completion of commands
set signcolumn=yes
set fillchars=vert:\│
" Allow terminal default transparent background
" WARNING: Only do this if the terminal and vim colorschemes match
autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE


" GENERAL:
set hidden " TextEdit might fail if hidden is not set.
set nowrap
set number
" set relativenumber
set splitbelow " These are more intuitive to me
set splitright
set viewoptions=cursor,folds


" COLORSCHEME:
" ColorScheme settings need to be enabled before the colorscheme is set.
set termguicolors
set background=dark
colorscheme gruvbox
let g:airline_theme = 'gruvbox'


" TABS:
" Tabs are always four spaces and no funny business.
" Except for filetypes where I don't like that.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent


" SEARCHING:
set showmatch " highlight matching parens
set incsearch " search as characters are entered
set hlsearch " highlight matches


" FOLDS:
set foldenable " enable folding
set foldlevelstart=100 " open most folds by default
set foldnestmax=1000 " 10 nested fold max


" I like to see a cursorline only on the active pane
" FIXME: This breaks nocursorline setting on terminals
augroup culine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup end
