" =====================================================================
" 
" UI options and plugins
" CIM puts UI options after plugin installation since UI requires
" plugins
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

" Spell check
set spell
" Clear the default highlight of the Spell check
highlight clear SpellBad
" Set the highlight style as underline
highlight SpellBad cterm=underline  

" airline:
if index(g:enable_ui_plugins, 'airline') != -1
    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1
    " Show buffer number so I can quickly pick a buffer
    let g:airline#extensions#tabline#buffer_nr_show = 1
endif

" Builtin colorschemes: desert, peachpuff, quiet, slate
" Colorschemes plugin: gruvbox
colorscheme desert

