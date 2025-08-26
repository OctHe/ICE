" =====================================================================
"
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! lint#Vista()

  if empty(globpath(&rtp, '/plugin/vista.vim'))
    return
  endif

  let g:vista_sidebar_width = 90

  " s means symbol
  nnoremap <silent> <Leader>s :Vista!!<CR>

endfunction

function! lint#Neomake()

  if empty(globpath(&rtp, '/plugin/neomake.vim'))
    return
  endif

  " When writing a buffer, and on normal mode changes (after 750ms).
  call neomake#configure#automake('nw', 750)

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
