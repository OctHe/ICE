" 
" Graphicless option file
" Author: OctHe
" Copyright (C): 2023
" It includes options, commands, keymappings as well as plugins
" 
" =====================================================================

" Filetype options for text, such as markdown and latex
function! graphicless#options#text()

    set spell   " Set spell check
    set spelllang+=cjk  " Spell check for chinese

    " Clear the default highlight of the Spell check
    highlight clear SpellBad
    " Set the highlight style as underline
    highlight SpellBad cterm=underline  

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
