" =====================================================================
"
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! lint#Vista(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vista.vim/plugin/vista.vim'))
    return
  endif

  let g:vista_sidebar_width = 50

  " s means symbol
  nnoremap <silent> <Leader>s :Vista!!<CR>

endfunction

function! lint#ALE(plugin_dir)

  if empty(globpath(a:plugin_dir, 'ale/plugin/ale.vim'))
    return
  endif

  let g:ale_linters = {
        \   'python': ['mypy', 'pylint'],
        \ }

  " Options for mypy
  let l:venv_dir = system('which python')
  let g:ale_python_mypy_options = trim('--python-executable ' .. l:venv_dir)

  let g:ale_fixers = {
        \ 'python': ['isort', 'yapf', 'remove_trailing_lines']
        \}

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
