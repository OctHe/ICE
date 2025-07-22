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

" vim: set sw=2 sts=2 et fdm=marker:
