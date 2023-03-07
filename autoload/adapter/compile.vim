" =====================================================================
" 
" Compile adapter of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" This adapter includes plugins to easily compile code and display the 
" result.
"
" =====================================================================

function! adapter#compile#init()

    " vimtex:
    " Requirement: PDF reader
    "   i.e., zatlura
    let g:adapter#compile = [
        \ ['lervag/vimtex', {'for': ['tex', 'bib']}],
        \ ['iamcco/markdown-preview.nvim', 
            \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}
            \ ],
        \ ]

endfunction

function! adapter#compile#options()

    " vimtex:
    " The follows is necessary for VimTeX to load properly. The "indent" is optional.
    " Note that most plugin managers will do this automatically.
    " filetype plugin indent on

    " This enables Vim's and neovim's syntax-related features. Without this, some
    " VimTeX features will not work (see ":help vimtex-requirements" for more
    " info).
    syntax enable

    " Viewer options
    let g:vimtex_view_method = 'zathura'

    " VimTeX uses latexmk as the default compiler backend. If you use it, which is
    " strongly recommended, you probably don't need to configure anything. If you
    " want another compiler backend, you can change it as follows. The list of
    " supported backends and further explanation is provided in the documentation,
    " see ":help vimtex-compiler".
    let g:vimtex_compiler_method = 'latexmk'

    " Most VimTeX mappings rely on localleader and this can be changed with the
    " following line. The default is usually fine and is the symbol "\".
    let maplocalleader = "\\"

    " Project with multiple files.
    "   To support multiple files (with '\input') in a project, user must open the 
    "   main file (e.g., main.tex) at first. For more details, please see the help
    "   document with ':h vimtex-multi-file'

endfunction
