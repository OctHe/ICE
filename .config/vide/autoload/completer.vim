" =====================================================================
"
" Autocompletion
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! completer#NerdCommenter()

  if empty(globpath(&rtp, '/plugin/nerdcommenter.vim'))
    return
  endif

  let g:NERDSpaceDelims = 1
  let g:NERDRemoveExtraSpaces = 1

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
