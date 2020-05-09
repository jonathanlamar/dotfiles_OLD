" ## 3. Basic settings

" TODO: Finish integration with vscode
if !exists('g:vscode')
  set nocompatible
  filetype plugin indent on    " required
  syntax enable

  " ColorScheme settings need to be enabled before the colorscheme is set.
  set termguicolors
  set background=dark

  colorscheme gruvbox

  set number

  " General stuff I like to have
  set clipboard=unnamedplus
  set nowrap
  set encoding=utf-8
  set fileencoding=utf-8
  set mouse=a
  set hidden " TextEdit might fail if hidden is not set.
  set nobackup " Some servers have issues with backup files, see #649.
  set nowritebackup
  set cmdheight=2 " Give more space for displaying messages.
  set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
  set shortmess+=c " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
  set lazyredraw
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
  " set wildignore+=.git/*,*/target/*
  set wildmenu " I TODO: What does this do?

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
endif
