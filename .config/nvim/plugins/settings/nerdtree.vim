let NERDTreeDirArrows = 1

augroup nerd
  nnoremap <Leader>n :NERDTreeFocus <CR>
  autocmd FileType nerdtree nnoremap <buffer> <Esc> :NERDTreeClose <CR>
augroup end

