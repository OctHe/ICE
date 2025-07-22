" =====================================================================
"
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! lint#Tagbar()

  if empty(globpath(&rtp, '/plugin/tagbar.vim'))
    return
  endif

  " s means symbol
  nnoremap <silent> <Leader>s :Tagbar<CR>

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
