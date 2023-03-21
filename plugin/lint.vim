" =====================================================================
" 
" Not only linter
" Configuration of static analysis plugins
"
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
"
" =====================================================================


if index(g:enable_text_plugins, 'ale') != -1

    " Ale:
    " :ALEInfo can find the linters that are successfully enabled
    let g:ale_linters = {
    \   'python': ['pyflakes'],
    \}

endif
