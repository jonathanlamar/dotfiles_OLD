" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala/spark
" development without missing Intellij or PyCharm too much, or being a bloated
" and generally worse version of those programs.  Generally stay out of the
" way for  way for all other filetypes.
"
" Outstanding TODOs:
" 1. Incorporate make scripts for scala and markdown (pandoc)


" ## 1: Plugins and their settings
execute pathogen#infect()

set nocompatible
filetype plugin on

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')


" Colorschemes
" Bundle 'altercation/vim-colors-solarized' " Gross
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'tomasr/molokai'
" Plug 'joshdick/onedark.vim'
" Gruvbox settings need to be enabled before the colorscheme is set..?
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_white = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_number_column = 'bg1'


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
let g:airline_theme = 'gruvbox'


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


" Code auto-completion.
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" IDE-like features for scala
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()} }
" ------------------- COC config -----------------------
"  This was copied from https://github.com/gvolpe/vim-setup/blob/master/init.vim
"  I haven't yet taken the time to configure things the way I like them or
"  really even understand what these settings do.

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
"nmap <silent> F <Plug>(coc-action-format) "does not work
nnoremap <silent> F :call CocAction('format')<CR>

" Show signature help
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" close preview (shown for hover / signature help)
nnoremap <leader> <Esc> :pclose<CR>

" nnoremap <silent> <M-B> :call CocRequest('metals-vim', 'workspace/executeCommand', { 'command': 'build-import' })<CR>
"nnoremap <silent> <M-Z> :ccl<CR>

" COC Snippets

" Use <M-o> for trigger snippet expand.
imap <M-o> <Plug>(coc-snippets-expand)

" Use <M-u> for select text for visual placeholder of snippet.
vmap <M-u> <Plug>(coc-snippets-select)

" Use <M-u> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<M-u>'

" Use <M-i> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<M-i>'

" Use <M-u> for both expand and jump (make expand higher priority.)
imap <M-u> <Plug>(coc-snippets-expand-jump)

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
  " set rtp+=/usr/local/opt/fzf
  set rtp+=/home/jon/Applications/fzf
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
autocmd ColorScheme * highlight! Normal guibg=NONE ctermbg=NONE
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
  autocmd BufRead,BufNewFile  *.ipynb set syntax=python " TODO Set filetype=python for these files
  autocmd FileType python :CocEnable
  autocmd filetype python set foldmethod=indent
  autocmd BufWritePre *.py %s/\s\+$//e " Remove all trailing whitespace
augroup end

augroup sql
  autocmd!
  autocmd BufRead,BufNewFile *.hql set filetype=sql
  autocmd FileType sql set tabstop=2
  autocmd FileType sql set softtabstop=2
  autocmd FileType sql set shiftwidth=2
  autocmd FileType sql set softtabstop=2
  autocmd FileType sql :CocEnable " no language server, but basic completion is better than none
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
  autocmd FileType scala :CocEnable
  autocmd BufWritePre *.scala,*.sbt %s/\s\+$//e
augroup end

augroup markdown
  autocmd!
  " TODO: Set filetype scala for sbt files
  autocmd FileType markdown set tabstop=4
  autocmd FileType markdown set softtabstop=4
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set softtabstop=4
  autocmd FileType markdown :CocDisable
  autocmd BufWritePre *.md %s/\s\+$//e
augroup end

augroup bash
  autocmd!
  autocmd FileType bash set tabstop=2
  autocmd FileType bash set softtabstop=2
  autocmd FileType bash set shiftwidth=2
  autocmd FileType bash set softtabstop=2
  autocmd FileType bash :CocEnable " no language server, but basic completion is better than none
  autocmd BufWritePre *.sh %s/\s\+$//e
augroup end

augroup vim
  autocmd!
  autocmd FileType vim set tabstop=2
  autocmd FileType vim set softtabstop=2
  autocmd FileType vim set shiftwidth=2
  autocmd FileType vim set softtabstop=2
  autocmd FileType vim :CocEnable " no language server, but basic completion is better than none
  autocmd BufWritePre *.vim %s/\s\+$//e
augroup end

