" =====================================================================
" 
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! lint#Config()

    if empty(globpath(&rtp, '/plugin/gutentags.vim'))
        return
    endif

    " Use existing tag file if it exists
    let g:gutentags_ctags_auto_set_tags = 0

    " Vista: Vista relies on universal-ctags. Please careful to install the
    " correct version. 
    " In openSUSE:
    "   sudo zypper install universal-ctags 
    if !empty(globpath(&rtp, '/plugin/vista.vim'))
        let g:vista_sidebar_width = 50

        " t means tag
        nnoremap <silent> <Leader>s :Vista!!<CR>  

    endif

    " Auto generate tags
    if !empty(globpath(&rtp, '/plugin/gutentags.vim'))
        " Use existing tag file if it exists
        let g:gutentags_ctags_auto_set_tags = 0

    endif

    " neomake
    if !empty(globpath(&rtp, '/plugin/neomake.vim'))

        " Run neomake when writing
        " call neomake#configure#automake('w')
    endif

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
