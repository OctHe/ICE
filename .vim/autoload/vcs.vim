" =====================================================================
" 
" Version control system
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! vcs#Fugitive()
    if empty(globpath(&rtp, '/plugin/fugitive.vim'))
        return
    endif

    nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
    nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
