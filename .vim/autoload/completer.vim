" =====================================================================
"
" Autocompletion
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! completer#delimitMate()

  if empty(globpath(&rtp, '/plugin/delimitMate.vim'))
    return
  endif

  let g:delimitMate_balance_matchpairs = 1

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
