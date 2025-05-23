" =====================================================================
" 
" Version control system
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

" fugitive: Provide common git options (diff, status, add, commit, etc)
function! vcs#Fugitive()

    if empty(globpath(&rtp, '/plugin/fugitive.vim'))
        return
    endif

    nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
    nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
