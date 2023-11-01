" =====================================================================
" 
" Filetype configuration for markdown
" Author: OctHe
" Copyright (C): 2023
" 
" =====================================================================
" Set spell check
set spell
" Spell check for chinese
set spelllang+=cjk

" Clear the default highlight of the Spell check
highlight clear SpellBad
" Set the highlight style as underline
highlight SpellBad cterm=underline  

