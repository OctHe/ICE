" =====================================================================
" 
" Autocompletion
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! completer#Nerdcommenter()

    if empty(globpath(&rtp, '/plugin/nerdcommenter.vim'))
        return
    endif

    let g:NERDSpaceDelims = 1
    let g:NERDRemoveExtraSpaces = 1

endfunction

function! completer#UltiSnips()

    if empty(globpath(&rtp, '/plugin/UltiSnips.vim'))
        return
    endif

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endfunction

function! completer#VimAutoPopemenu()

    if empty(globpath(&rtp, '/plugin/apc.vim'))
        return
    endif

    " enable this plugin for filetypes, '*' for all files.
    "let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
    let g:apc_enable_ft = {'*':1}

    " source for dictionary, current or other loaded buffers, see ':help cpt'
    set cpt=.,k,w,b

    " don't select the first item.
    set completeopt=menu,menuone,noselect

    " suppress annoy messages.
    set shortmess+=c

endfunction


" vim: set sw=4 sts=4 et fdm=marker:
