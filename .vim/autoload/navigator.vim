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

" vim: set sw=2 sts=2 et fdm=marker:
