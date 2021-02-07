" Options
" g:AutoPairs

" Default: {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" b:AutoPairs

" Default: g:AutoPairs

" Buffer level pairs set.
" g:AutoPairsShortcutToggle

" Default: '<M-p>'

" The shortcut to toggle autopairs.
" g:AutoPairsShortcutFastWrap

" Default: '<M-e>'

" Fast wrap the word. all pairs will be consider as a block (include <>).
" (|)'hello' after fast wrap at |, the word will be ('hello')
" (|)<hello> after fast wrap at |, the word will be (<hello>)
" g:AutoPairsShortcutJump

" Default: '<M-n>'

" Jump to the next closed pair
" g:AutoPairsMapBS

" Default : 1

" Map <BS> to delete brackets, quotes in pair
" execute 'inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>'
" g:AutoPairsMapCh

" Default : 1

" Map <C-h> to delete brackets, quotes in pair
" g:AutoPairsMapCR

" Default : 1

" Map <CR> to insert a new indented line if cursor in (|), {|} [|], '|', "|"
" execute 'inoremap <buffer> <silent> <CR> <C-R>=AutoPairsReturn()<CR>'
" g:AutoPairsCenterLine

" Default : 1

" When g:AutoairsMapCR is on, center current line after return if the line is at the bottom 1/3 of the window.
" g:AutoPairsMapSpace

" Default : 1

" Map <space> to insert a space after the opening character and before the closing one.
" execute 'inoremap <buffer> <silent> <CR> <C-R>=AutoPairsSpace()<CR>'
" g:AutoPairsFlyMode

" Default : 0

" set it to 1 to enable FlyMode.
" see FlyMode section for details.
" g:AutoPairsMultilineClose

" Default : 1

" When you press the key for the closing pair (e.g. `)`) it jumps past it.
" If set to 1, then it'll jump to the next line, if there is only whitespace.
" If set to 0, then it'll only jump to a closing pair on the same line.
" g:AutoPairsShortcutBackInsert

" Default : <M-b>

" Work with FlyMode, insert the key at the Fly Mode jumped postion
" g:AutoPairsMoveCharacter

" Default: "()[]{}\"'"

" Map <M-(> <M-)> <M-[> <M-]> <M-{> <M-}> <M-"> <M-'> to
" move character under the cursor to the pair.P
