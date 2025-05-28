" =====================================================================
" 
" Lint and LSP
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! lint#Tagbar()

    if empty(globpath(&rtp, '/plugin/tagbar.vim'))
        return
    endif

    " Automatic open Tagbar when open vim
    " autocmd VimEnter *.{py,h,c} Tagbar

    " s means symbol
    nnoremap <silent> <Leader>s :Tagbar<CR>  

endfunction

function! lint#Gutentags()

    if empty(globpath(&rtp, '/plugin/gutentags.vim'))
        return
    endif

    " Use existing tag file if it exists
    let g:gutentags_ctags_auto_set_tags = 0


endfunction

function! lint#ALE()

    if empty(globpath(&rtp, '/plugin/ale.vim'))
        return
    endif

    if executable('clangd')
        let g:ale_c_cc_executable = 'clangd'
        let g:ale_cpp_cc_executable = 'clangd'
    endif

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
