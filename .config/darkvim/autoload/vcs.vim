" =====================================================================
"
" Version control system
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! vcs#Signify()

  if empty(globpath(&rtp, '/plugin/signify.vim'))
    return
  endif

  " default updatetime 4000ms is not good for async update
  set updatetime=100

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
