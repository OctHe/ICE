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

function! lint#ALE()

  if empty(globpath(&rtp, '/plugin/ale.vim'))
    return
  endif

  if executable('clangd')
    let g:ale_c_cc_executable = 'clangd'
    let g:ale_cpp_cc_executable = 'clangd'
  endif

    let g:ale_fixers = {
          \ 'python': ['isort', 'yapf', 'remove_trailing_lines']
          \}

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
