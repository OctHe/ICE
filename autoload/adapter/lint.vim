" =====================================================================
" 
" Lint adapter of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" This adapter contains goto, lint, fix, etc.
"
" =====================================================================

function! adapter#lint#init()

    " ALE: Asynchronous Lint Engine
    " ALE works as an LSP client, so the OS must install the corresponding language
    " servers.
    " Recommendation: 
    "     pyflakes: pip3/pip install pyflakes
    "     clangd: 'sudo apt install clangd' in ubuntu
    " clangd lSP requires bear to generate compile_commands.json for make-based
    " projects
    "     sudo apt install bear 
    let g:adapter#lint = [
        \ ['dense-analysis/ale',    {}],
        \ ]

endfunction

function! adapter#lint#options()

    " Ale:
    " :ALEInfo can find the linters that are successfully enabled
    let g:ale_linters = {
    \   'python': ['pyflakes'],
    \}

endfunction
