" =====================================================================
"
" Version control system
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! vcs#Fugitive(plugin_dir)
  if empty(globpath(a:plugin_dir, 'vim-fugitive/plugin/fugitive.vim'))
    return
  endif

  nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
  nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
