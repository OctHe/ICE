" =====================================================================
"
" Version control system
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! vcs#Fugitive()
  if empty(globpath(&rtp, '/plugin/fugitive.vim'))
    return
  endif

  nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
  nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

function! vcs#Signify()

  if empty(globpath(&rtp, '/plugin/signify.vim'))
    return
  endif

  " default updatetime 4000ms is not good for async update
  set updatetime=100

endfunction
" vim: set sw=2 sts=2 et fdm=marker:
