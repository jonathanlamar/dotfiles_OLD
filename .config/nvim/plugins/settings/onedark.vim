hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" Make vertical splits more visible
" WARNING: These colors are chosen for gruvbox
autocmd ColorScheme * highlight! VertSplit guifg=#ABB2BF

" checks if your terminal has 24-bit color support
" I don't remember why I added this.
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
