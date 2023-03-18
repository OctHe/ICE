" =====================================================================
" 
" Theme options and plugins
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================


" Color schemes: desert, peachpuff, quiet, slate
colorscheme desert

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
endif

