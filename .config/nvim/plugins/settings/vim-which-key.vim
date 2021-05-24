
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '\'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '\'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
" let g:which_key_map['e'] = [ ':CocCommand explorer'                , 'file explorer']
let g:which_key_map['e'] = [ ':NERDTreeToggle'                , 'file explorer']
let g:which_key_map['f'] = [ ':FzfGFiles'                          , 'search files' ]
let g:which_key_map['h'] = [ ':split'                              , 'split below']
let g:which_key_map['r'] = [ ':RangerCurrentFileExistingOrNewTab'  , 'ranger' ]
let g:which_key_map['S'] = [ ':tabnew | Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                                 , 'search text' ]
let g:which_key_map['v'] = [ ':vsp'                                , 'split right']


" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'b' : [':FzfBLines'    , 'current buffer'],
      \ 'B' : [':FzfBuffers'   , 'open buffers'],
      \ 'c' : [':FzfCommits'   , 'commits'],
      \ 'C' : [':FzfBCommits'  , 'buffer commits'],
      \ 'f' : [':FzfFiles'     , 'files'],
      \ 'g' : [':FzfGFiles'    , 'git files'],
      \ 'G' : [':FzfGFiles?'   , 'modified git files'],
      \ 'h' : [':FzfHistory'   , 'file history'],
      \ 'H' : [':FzfHistory:'  , 'command history'],
      \ 'l' : [':FzfLines'     , 'lines'] ,
      \ 'm' : [':FzfMarks'     , 'marks'] ,
      \ 'M' : [':FzfMaps'      , 'normal maps'] ,
      \ 'p' : [':FzfHelptags'  , 'help tags'] ,
      \ 'P' : [':FzfTags'      , 'project tags'],
      \ 's' : [':FzfSnippets'  , 'snippets'],
      \ 'S' : [':FzfColors'    , 'color schemes'],
      \ 't' : [':FzfRg'        , 'text Rg'],
      \ 'T' : [':FzfBTags'     , 'buffer tags'],
      \ 'w' : [':FzfWindows'   , 'search windows'],
      \ 'y' : [':FzfFiletypes' , 'file types'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'A' : [':Git add .'                        , 'add all'],
      \ 'a' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" TODO: Why doesn't this work?
" " l is for language server protocol
" let g:which_key_map.l = {
"       \ 'name' : '+lsp' ,
"       \ 'a' : [':lua vim.lsp.buf.code_action()'      , 'code action'],
"       \ 'd' : [':lua vim.lsp.buf.definition()'       , 'definition'],
"       \ 'D' : [':lua vim.lsp.buf.declaration()'      , 'declaration'],
"       \ 'f' : [':lua vim.lsp.buf.formatting()'       , 'format'],
"       \ 'F' : [':lua vim.lsp.buf.range_formatting()' , 'format selection'],
"       \ 'i' : [':lua vim.lsp.buf.implementation()'   , 'implementation'],
"       \ 'I' : [':lua vim.lsp.diagnostic.get_all()'   , 'diagnostics'],
"       \ 'n' : [':lua vim.lsp.diagnostic.goto_next()' , 'next diagnostic'],
"       \ 'p' : [':lua vim.lsp.diagnostic.goto_prev()' , 'prev diagnostic'],
"       \ 'r' : [':lua vim.lsp.buf.rename()'           , 'rename'],
"       \ 'R' : [':lua vim.lsp.buf.references()'       , 'references'],
"       \ 't' : [':lua vim.lsp.buf.type_definition()'  , 'type definition'],
"       \ }

" t is for toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle' ,
      \ 'c' : ['TagbarToggle'            , 'tagbar'],
      \ 'g' : [':call GoyoNoLines()'     , 'goyo'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 't' : [':call TermToggle(0.3)'   , 'terminal'],
      \ 'w' : [':set nowrap!'            , 'wrap text']
      \ }


" Register which key map
call which_key#register('\', "g:which_key_map")
