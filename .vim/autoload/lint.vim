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

function! lint#ALE()

  if empty(globpath(&rtp, '/plugin/ale.vim'))
    return
  endif

  if executable('clangd')
    let g:ale_c_cc_executable = 'clangd'
    let g:ale_cpp_cc_executable = 'clangd'
  endif

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
