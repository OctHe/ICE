" =====================================================================
"
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! lint#Tagbar(plugin_dir)

  if empty(globpath(a:plugin_dir, 'tagbar/plugin/tagbar.vim'))
    return
  endif

  " s means symbol
  nnoremap <silent> <Leader>s :Tagbar<CR>

endfunction

function! lint#ALE(plugin_dir)

  if empty(globpath(a:plugin_dir, 'ale/plugin/ale.vim'))
    return
  endif

  let g:ale_linters = {
        \   'python': ['mypy', 'pylint'],
        \ }

  let g:ale_fixers = {
        \ 'python': ['isort', 'yapf', 'remove_trailing_lines']
        \}

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
