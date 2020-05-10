let NERDTreeDirArrows = 1

augroup nerd
  autocmd!
  nnoremap <Leader>n :NERDTreeFocus <CR>
  autocmd FileType nerdtree nnoremap <buffer> <Esc> :NERDTreeClose <CR>
augroup end

