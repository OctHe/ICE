" =====================================================================
" 
" Completion and snippet adapter of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! adapter#completion#init()

    " vim-snippet: Snippet database
    " Ultisnip: Ultimate snippet engine
    let g:adapter#completion = [
        \ ['honza/vim-snippets',  {}],
        \ ['SirVer/ultisnips',    {}],
        \ ]

    if exists( 'g:adapter#completion#completer' )
        \ && g:adapter#completion#completer ==# 'youcompleteme'
        "YouCompleteMe: 
        call add(g:adapter#completion, 
            \ ['ycm-core/YouCompleteMe', 
                \{'do': './install.py --clangd-completer'}}],
        )
    endif

endfunction

function! adapter#completion#options()

    " Ultisnip
    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " YCM
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0

    map <leader>g :YcmCompleter GoTo<CR>

endfunction
