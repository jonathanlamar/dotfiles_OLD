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

" NERDTree stuff
augroup nerd
  autocmd!
  nnoremap <Leader>n :NERDTreeFocus <CR>
  autocmd FileType nerdtree nnoremap <buffer> <Esc> :NERDTreeClose <CR>
augroup end

