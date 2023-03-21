" =====================================================================
" 
" Configuration of dynamic analysis plugins
"
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" The plugins that can easily compile code and display the result
" are included.
"
" =====================================================================


if index(g:enable_debug_plugins, 'vimtex') != -1

    " vimtex:
    " Requirement: PDF reader
    "   i.e., zatlura
    " plugin indent on follows is necessary for VimTeX to load properly. The "indent" is optional.
    " Note that most plugin managers will do this automatically.

    " Viewer options
    let g:vimtex_view_method = 'zathura'

    " VimTeX uses latexmk as the default compiler backend. If you use it, which is
    " strongly recommended, you probably don't need to configure anything. If you
    " want another compiler backend, you can change it as follows. The list of
    " supported backends and further explanation is provided in the documentation,
    " see ":help vimtex-compiler".
    let g:vimtex_compiler_method = 'latexmk'

    " Project with multiple files.
    "   To support multiple files (with '\input') in a project, user must open the 
    "   main file (e.g., main.tex) at first. For more details, please see the help
    "   document with ':h vimtex-multi-file'

endif
