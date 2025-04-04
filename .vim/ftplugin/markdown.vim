" =====================================================================
" 
" Filetype configuration for markdown
" Author: OctHe
" Copyright (C): 2023-2024
" 
" =====================================================================

set spell   " Set spell check
set spelllang+=cjk  " Spell check for chinese

" Clear the default highlight of the Spell check
highlight clear SpellBad
" Set the highlight style as underline
highlight SpellBad cterm=underline  

