" =====================================================================
"
" Go to everywhere easily
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! navigator#Sneak(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vim-sneak/plugin/sneak.vim'))
    return
  endif

  " 1-charactor sneak for enhanced f/F/t/T
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F
  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  xmap t <Plug>Sneak_t
  xmap T <Plug>Sneak_T
  omap t <Plug>Sneak_t
  omap T <Plug>Sneak_T

endfunction

function! navigator#Undotree(plugin_dir)
  if empty(globpath(a:plugin_dir, 'undotree/plugin/undotree.vim'))
    return
  endif

  nnoremap <Leader>u :UndotreeToggle<CR>

endfunction

function! navigator#LeaderF(plugin_dir)

  if empty(globpath(a:plugin_dir, 'LeaderF/plugin/leaderf.vim'))
    return
  endif

  let g:Lf_WindowPosition = 'popup'
  let g:Lf_WildIgnore = {'dir': ['.git', '.svn', '.hg'], 'file': ['*~']}
  let g:Lf_ShortcutF = '<leader>ff'
  let g:Lf_ShortcutB = '<leader>fb'

  noremap <Leader>fr :Leaderf rg<CR>

endfunction

function! navigator#Grepper(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vim-grepper/plugin/grepper.vim'))
    return
  endif

  noremap <Leader>fg :Grepper<CR>

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
