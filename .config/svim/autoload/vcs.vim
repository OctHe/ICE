" =====================================================================
" 
" Version control system
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! vcs#Config()
    " VCS
    " fugitive: Provide common git options (diff, status, add, commit, etc)
    if !empty(globpath(&rtp, '/plugin/fugitive.vim'))

        nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
        nnoremap <silent> <Leader>gs :Git status<CR>

    endif

    " gitgutter: Show diff in the column sign (See :help signcolumn)


endfunction

" vim: set sw=4 sts=4 et fdm=marker:
