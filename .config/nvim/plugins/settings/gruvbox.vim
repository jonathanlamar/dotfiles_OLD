" Match tildes at end of buffer to number column color...
" TODO: These are gruvbox colors.  Generalize.
autocmd ColorScheme * highlight! EndOfBuffer ctermfg=243 guifg=#7c6f64

" Make vertical splits more visible
" WARNING: These colors are chosen for gruvbox
autocmd ColorScheme * highlight! VertSplit ctermfg=223 guifg=#EBDBB2

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_white = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_number_column = 'bg1'
