" =====================================================================
"
" Navigator
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! navigator#Grepper()

  if empty(globpath(&rtp, '/plugin/grepper.vim'))
    return
  endif

  noremap <Leader>fg :Grepper<CR>

endfunction

function! navigator#Sneak()

  if empty(globpath(&rtp, '/plugin/sneak.vim'))
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

function! navigator#LeaderF()

  if empty(globpath(&rtp, '/plugin/leaderf.vim'))
    return
  endif

  let g:Lf_WindowPosition = 'popup'

  " Vista.vim:
  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction

  set statusline+=%{NearestMethodOrFunction()}

  let g:Lf_WildIgnore = {
        \ 'dir': ['.git', '.svn', '.hg'],
        \ 'file': ['*~']
        \}

  let g:Lf_ShortcutF = '<leader>ff'
  let g:Lf_ShortcutB = '<leader>fb'
  noremap <Leader>fr :Leaderf rg<CR>

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
