" 
" Options for non-plugin configurations
" Author: OctHe
" Copyright (C): 2023
" 
" =====================================================================

" Filetype options for text, such as markdown and latex
function! packless#options#text()

    set spell   " Set spell check
    set spelllang+=cjk  " Spell check for chinese

    " Clear the default highlight of the Spell check
    highlight clear SpellBad
    " Set the highlight style as underline
    highlight SpellBad cterm=underline  

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
