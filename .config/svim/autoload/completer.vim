" =====================================================================
" 
" Autocompletion
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! completer#Config()

    " Nerdcomment: 
    if !empty(globpath(&rtp, '/plugin/nerdcommenter.vim'))

        let g:NERDSpaceDelims = 1
        let g:NERDRemoveExtraSpaces = 1

    endif

    " Commentary
    if !empty(globpath(&rtp, '/plugin/commentary.vim'))

       nmap <Leader>cc <Plug>CommentaryLine 
       vmap <Leader>c <Plug>Commentary 
       nmap <Leader>c <Plug>Commentary 
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

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
