" =====================================================================
" 
" Autocompletion
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! completer#Config()

    " Surround

    " Auto-pair

    " vim-repeat: Plugin repeat support

    " Nerdcomment: 
    if !empty(globpath(&rtp, '/plugin/nerdcommenter.vim'))

        let g:NERDSpaceDelims = 1
        let g:NERDRemoveExtraSpaces = 1

    endif


    " YCM: a powerful completion plugin based on LSP. It relies on cmake, 
    " make, g++, python3-dev and LSP. YCM does not use system-wide LSP.
    " Install the prerequisites in Debian with
    "   sudo apt install cmake make g++ python3-dev
    " In openSUSE with
    "   sudo zypper install cmake make g++ python3-deval
    if !empty(globpath(&rtp, '/plugin/youcompleteme.vim'))

        let g:ycm_confirm_extra_conf = 0
        let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

        let g:ycm_show_diagnostics_ui = 0

        " Clear the YCM blacklist, so it works for all files
        let g:ycm_filetype_blacklist = {}

    endif

    " vim-snippets: It saves multiple snippets

    " Ultisnips: snippets engine that uses snippet database
    " vim-snippets: snippet database
    if !empty(globpath(&rtp, '/plugin/UltiSnips.vim'))

        " Trigger configuration. Change this to something other than <tab> if use one 
        " of the following:
        " - https://github.com/Valloric/YouCompleteMe
        " - https://github.com/nvim-lua/completion-nvim
        let g:UltiSnipsExpandTrigger="<CR>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"

    endif

    " vim-auto-popemenu
    if !empty(globpath(&rtp, '/plugin/apc.vim'))
        " enable this plugin for filetypes, '*' for all files.
        "let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
        let g:apc_enable_ft = {'*':1}

        " source for dictionary, current or other loaded buffers, see ':help cpt'
        set cpt=.,k,w,b

        " don't select the first item.
        set completeopt=menu,menuone,noselect

        " suppress annoy messages.
        set shortmess+=c
    endif

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
