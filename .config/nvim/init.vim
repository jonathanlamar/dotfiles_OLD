" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala/spark
" development without missing Intellij or PyCharm too much, or being a bloated
" and generally worse version of those programs.  Generally stay out of the
" way for  way for all other filetypes.
"
" Outstanding TODOs:
" 1. Incorporate make scripts for scala and markdown (pandoc)

" Virtual environment for running required neovim modules
let g:python3_host_prog = '/Users/p2837730/.config/nvim/venv/bin/python'

" ## 1: Plugins and their settings

set nocompatible
filetype plugin on

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')


" Colorschemes
" Bundle 'altercation/vim-colors-solarized' " Gross
Plug 'morhetz/gruvbox' " The gold standard of warm dark colorschemes
Plug 'NLKNguyen/papercolor-theme' " Beautiful with python! But not much support for scala.
Plug 'joshdick/onedark.vim' " Decent middle ground with good support for both scala and python, but low contrast
Plug 'drewtempelmeyer/palenight.vim' " Based on onedark: harder contrast, but also cooler.
Plug 'ayu-theme/ayu-vim'
" ColorScheme settings need to be enabled before the colorscheme is set.
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_white = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_number_column = 'bg1'
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \   }
  \ }
let g:onedark_terminal_italics = 1
let g:palenight_terminal_italics=1
let ayucolor = 'mirage'


" General functionality
" NERDTree for file navigation
Plug 'scrooloose/nerdtree'
let NERDTreeDirArrows = 1


" Airline for nifty info in the status and tablines
Plug 'vim-airline/vim-airline'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" Show tab line even if only one tab, but hide buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
" How to format long paths in tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'onedark'


" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Neat column highlighting for csv and tsv files.
Plug 'mechatroner/rainbow_csv'
" for nested parentheses
Plug 'kien/rainbow_parentheses.vim'

" vim-scala - modern scaladoc indentation
Plug 'derekwyatt/vim-scala' " This one has a bit more than syntax highlighting.
let g:scala_scaladoc_indent = 1

" Nice python syntax highlighting.  Doesn't seem to work with all
" colorschemes, but does with gruvbox
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Golang support for building, etc.
Plug 'fatih/vim-go'
" disable vim-go :GoDef short cut (gd)
" this is handled by coc.nvim
let g:go_def_mapping_enabled = 0
" Set foldmethod=syntax and get this stuff
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
" vim-go syntax highlighting
let g:go_highlight_trailing_whitespace_error = 1
" Highlight commonly used types
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
" highlight struct and interface names
let g:go_highlight_types = 1
" highlight struct field named
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0


" Code auto-completion.
Plug 'neoclide/coc.nvim', {'branch': 'release' }

" ------- coc settings
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Support comments within json syntax.  Useful for editing coc config
autocmd FileType json syntax match Comment +\/\/.\+$+

" Global extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-markdownlint',
  \ 'coc-r-lsp',
  \ 'coc-json',
  \ ]

" To add new snippets, run the command :CocCommand snippets.editSnippets

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show signature help
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

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
  " TODO: Should this be an option?
  set rtp+=/usr/local/opt/fzf
  " set rtp+=/home/jon/bin/fzf
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif
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


" Git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nerdtree git plugin symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }
Plug 'airblade/vim-gitgutter' " Not sure if this plays nice with fugitive.
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call plug#end()



" ## 3. Basic sets
" No-brainers
set background=dark
colorscheme onedark

" Match tildes at end of buffer to number column color...
" TODO: These are gruvbox colors.  Generalize.
" autocmd ColorScheme * highlight! EndOfBuffer ctermfg=243 guifg=#7c6f64

" Allow terminal default transparent background
" WARNING: Only do this if the terminal and vim colorschemes are the same
autocmd ColorScheme * highlight! Normal guibg=NONE ctermbg=NONE

" Make vertical splits more visible
" WARNING: These colors are chosen for onedark
autocmd ColorScheme * highlight! VertSplit ctermbg=236 guibg=#2C323C ctermfg=145 guifg=#ABB2BF
set fillchars+=vert:\|

filetype plugin indent on    " required
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

" I like to see a cursorline only on the active pane
" FIXME: This breaks nocursorline setting on terminals
augroup culine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup end



" ## 4. Cool remaps
"
"
"
" map to move up/down over wraps
nnoremap j gj
nnoremap k gk

" Half page up/down but recenter
nnoremap <m-d> Lzz
nnoremap <m-u> Hzz

""  The sacred spacebar remap
"nnoremap <space> ifoo<ESC>

" NERDTree stuff
augroup nerd
  autocmd!
  nnoremap <Leader>f :NERDTreeFocus <CR>
  autocmd FileType nerdtree nnoremap <buffer> <Esc> :NERDTreeClose <CR>
augroup end

" Make it easier to make it easier to edit text :P
map <leader>rc :tabe $MYVIMRC <cr>
" TODO: This breaks vim-airline.
autocmd bufwritepost $MYVIMRC source $MYVIMRC

" When using macros, I always accidentally hit shift-Q and go to Ex mode.
nnoremap Q <Nop>

" easier split navigations
" a la i3
nnoremap <C-J> <C-W><C-J>
nnoremap <M-j> <C-w>-
nnoremap <C-K> <C-W><C-K>
nnoremap <M-k> <C-w>+
nnoremap <C-L> <C-W><C-L>
nnoremap <M-l> <C-W>>
nnoremap <C-H> <C-W><C-H>
nnoremap <M-h> <C-W><

" Add blank line below cursor
nnoremap <M-o> o<Esc>

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
  autocmd FileType python set colorcolumn=80
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  " autocmd FileType python :CocEnable
  autocmd filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup golang
  autocmd!
  autocmd FileType go set shiftwidth=4
  autocmd FileType go set softtabstop=4
  autocmd FileType go set tabstop=4
  autocmd FileType go set expandtab
  autocmd FileType go set autoindent
  " autocmd FileType go :CocEnable
  autocmd filetype go set foldmethod=indent
  autocmd BufWritePre *.go :GoFmt " Auto-format on save
augroup end

augroup sql
  autocmd!
  autocmd BufRead,BufNewFile *.hql set filetype=sql
  autocmd FileType sql set tabstop=2
  autocmd FileType sql set softtabstop=2
  autocmd FileType sql set shiftwidth=2
  autocmd FileType sql set softtabstop=2
  " autocmd FileType sql :CocEnable " no language server, but basic completion is better than none
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
  autocmd FileType python set colorcolumn=80
  " autocmd FileType scala :CocEnable
  autocmd BufWritePre *.scala,*.sbt %s/\s\+$//e
  autocmd BufWritePre *.scala,*.sbt :SortScalaImports
augroup end

augroup markdown
  autocmd!
  " TODO: Set filetype scala for sbt files
  autocmd FileType markdown set tabstop=4
  autocmd FileType markdown set softtabstop=4
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set softtabstop=4
  " autocmd FileType markdown :CocDisable
  autocmd BufWritePre *.md %s/\s\+$//e
  " autocmd BufWritePre *.md :normal ggVGgq " Format file on save
  autocmd FileType markdown set textwidth=80
augroup end

augroup bash
  autocmd!
  autocmd FileType bash set tabstop=2
  autocmd FileType bash set softtabstop=2
  autocmd FileType bash set shiftwidth=2
  autocmd FileType bash set softtabstop=2
  " autocmd FileType bash :CocEnable " no language server, but basic completion is better than none
  autocmd BufWritePre *.sh %s/\s\+$//e
augroup end

augroup vim
  autocmd!
  autocmd FileType vim set tabstop=2
  autocmd FileType vim set softtabstop=2
  autocmd FileType vim set shiftwidth=2
  autocmd FileType vim set softtabstop=2
  " autocmd FileType vim :CocEnable " no language server, but basic completion is better than none
augroup end

