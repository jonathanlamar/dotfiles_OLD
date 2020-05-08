" init.vim
" Author: Jon Lamar
" Goal: Just enough IDE functionality to do serious python and scala/spark
" development without missing Intellij or PyCharm too much, or being a bloated
" and generally worse version of those programs.  Generally stay out of the
" way for  way for all other filetypes.
"
" Outstanding TODOs:
" 1. Break into smaller files.
" 2. Integrate with vim plugins for intellij and vscode
" 3. Figure out option for Alt+* keybindings in Mac (use option instead)

" Virtual environment for running required neovim modules
let g:python3_host_prog = $HOME . '/.config/nvim/venv/bin/python'

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
let g:airline_powerline_fonts = 1
" let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD
"TABLINE:
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
" let g:airline#extensions#tabline#formatter = 'unique_tail' " How to format long paths in tabs
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
" let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
" let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
" let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

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


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Support comments within json syntax.  Useful for editing coc config
autocmd FileType json syntax match Comment +\/\/.\+$+

" Global extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-markdownlint',
  \ 'coc-metals',
  \ 'coc-r-lsp',
  \ 'coc-json',
  \ ]


" New plugins to experiment with
" Have the file system follow you around
Plug 'airblade/vim-rooter'

" Colored parens
Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses
" Cool icons
Plug 'ryanoasis/vim-devicons'
" Making stuff
Plug 'neomake/neomake'
" Better Comments
Plug 'jbgutierrez/vim-better-comments'

" Commenting and other nice code stuff
" Comment-in-movement:
Plug 'tpope/vim-commentary'

" Commentary settings
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" Surround-movement-with-X:
Plug 'tpope/vim-surround'
" Repleat-plugin-with-.:
Plug 'tpope/vim-repeat'


" Fzf
Plug 'junegunn/fzf.vim'
set rtp+=$HOME/bin/fzf

" Use FZF for files and tags if available, otherwise fall back onto CtrlP
let g:fzf_command_prefix = 'Fzf' " namespacing commands

nnoremap <leader>v :FzfFiles<cr>
nnoremap <leader>u :FzfTags<cr>
nnoremap <leader>a :FzfBuffers<CR>
nnoremap <leader>A :FzfWindows<CR>
" <leader>j will search for tag using word under cursor
nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
" Grepping codebase
nnoremap <leader>g :FzfRg<CR>
" Not sure what this does
nnoremap <leader>m :FzfMarks<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'

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

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)



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
colorscheme gruvbox

" Match tildes at end of buffer to number column color...
" TODO: These are gruvbox colors.  Generalize.
autocmd ColorScheme * highlight! EndOfBuffer ctermfg=243 guifg=#7c6f64

" Allow terminal default transparent background
" WARNING: Only do this if the terminal and vim colorschemes are the same
autocmd ColorScheme * highlight! Normal guibg=NONE ctermbg=NONE

" Make vertical splits more visible
" WARNING: These colors are chosen for gruvbox
autocmd ColorScheme * highlight! VertSplit ctermfg=223 guifg=#EBDBB2
set fillchars+=vert:\|

filetype plugin indent on    " required
set number
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
  nnoremap <Leader>n :NERDTreeFocus <CR>
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

" ## 5. Terimal Stuff
"
"
"

" Terminal stuff for neovim
" These are for more permanent shells.  They will not persist on close
command! T new term://$SHELL | setlocal nonumber nocursorline
command! VT vnew term://$SHELL | setlocal nonumber nocursorline
command! TT tabnew term://$SHELL | setlocal nonumber nocursorline

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
  " Height input should be a float between 0 and 1, to represent portion of
  " height to use for pop-up term.
  let s:term_toggle_height = float2nr(&lines * a:height)
  if win_gotoid(s:term_win)
    hide
  else
    botright new terminal
    exec "resize ".s:term_toggle_height
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

nnoremap <silent><leader>t :call TermToggle(0.3)<CR>
" FIXME: This activates in insert mode. Not good!
" inoremap <silent><leader>t <Esc>:call TermToggle(20)<CR>
" FIXME: This still activates in insert mode while in a terminal buffer.
" Also not good!
tnoremap <silent><leader>t <C-\><C-n>:call TermToggle(0.3)<CR>


" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction




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
  autocmd FileType scala set colorcolumn=120
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

