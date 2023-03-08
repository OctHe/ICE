" =====================================================================
" 
" Configuration file of linters
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" This adapter contains lint, fix, etc.
"
" =====================================================================


if index(g:enable_text_plugins, 'ale') != -1

    " Ale:
    " :ALEInfo can find the linters that are successfully enabled
    let g:ale_linters = {
    \   'python': ['pyflakes'],
    \}

endif
