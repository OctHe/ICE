" =====================================================================
" 
" Configuration of basic edit plugins 
" 
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

" Vista: 
if index(g:enable_text_plugins, 'vista') != -1
    let g:vista_sidebar_width = 50

endif

" Nerdcomment: 
if index(g:enable_text_plugins, 'nerdcomment') != -1
endif

" commentary:
if index(g:enable_text_plugins, 'commentary') != -1
  xmap <Leader>c  <Plug>Commentary
  nmap <Leader>c  <Plug>Commentary
  omap <Leader>c  <Plug>Commentary
  nmap <Leader>cc <Plug>CommentaryLine
  nmap <Leader>cu <Plug>Commentary<Plug>Commentary
endif
