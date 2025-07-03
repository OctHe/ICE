" =====================================================================
"
" Autocompletion
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! completer#TComment()

  if empty(globpath(&rtp, '/plugin/tcomment.vim'))
    return
  endif

  let g:tcomment_opleader1 = '<Leader>c'

endfunction

" Ultisnips: snippets engine that uses snippet database
" vim-snippets: snippet database
function! completer#Ultisnips()

  if empty(globpath(&rtp, '/plugin/UltiSnips.vim'))
    return
  endif

  " Trigger configuration. Change this to something other than <tab> if use one
  " of the following:
  " - https://github.com/Valloric/YouCompleteMe
  " - https://github.com/nvim-lua/completion-nvim
  let g:UltiSnipsExpandTrigger="<CR>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
