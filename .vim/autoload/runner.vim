" =====================================================================
" 
" Debugger and runner
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! runner#Floaterm()

    if !empty(globpath(&rtp, '/plugin/floaterm.vim'))
        return
    endif

    nmap <Leader>tb :FloatermPrev<CR>
    nmap <Leader>tn :FloatermNext<CR>
    nmap <Leader>tN :FloatermNew<CR>
    nmap <Leader>tk :FloatermKill<CR>
    nmap <Leader>tt :FloatermToggle<CR>

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
