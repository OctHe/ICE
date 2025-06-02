" =====================================================================
" 
" Lint and LSP
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! lint#Gutentags()

    if empty(globpath(&rtp, '/plugin/gutentags.vim'))
        return
    endif

    " Use existing tag file if it exists
    let g:gutentags_ctags_auto_set_tags = 0


endfunction

function! lint#Config()

    " Lint
    " Vista: Vista relies on universal-ctags. Please careful to install the
    " correct version. 
    " In openSUSE:
    "   sudo zypper install universal-ctags 
    if !empty(globpath(&rtp, '/plugin/vista.vim'))
        let g:vista_sidebar_width = 50

        " t means tag
        nnoremap <silent> <Leader>s :Vista!!<CR>  

    endif

    " Tagbar: 
    if !empty(globpath(&rtp, '/plugin/tagbar.vim'))
        " Automatic open Tagbar when open vim
        " autocmd VimEnter *.{py,h,c} Tagbar

        " s means symbol
        nnoremap <silent> <Leader>s :Tagbar<CR>  
    endif

    " Auto generate tags
    if !empty(globpath(&rtp, '/plugin/gutentags.vim'))
        " Use existing tag file if it exists
        let g:gutentags_ctags_auto_set_tags = 0

    endif

    " ALE:
    if !empty(globpath(&rtp, '/plugin/ale.vim'))

        if executable('clangd')
            let g:ale_c_cc_executable = 'clangd'
            let g:ale_cpp_cc_executable = 'clangd'
        endif

    endif

    " neomake

    if !empty(globpath(&rtp, '/plugin/neomake.vim'))

        " Run neomake when writing
        " call neomake#configure#automake('w')
    endif

    " splitjoin

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
