" =====================================================================
" 
" Navigator
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

" LeaderF: Asynchronous fuzzy finder with popup window
function! navigator#LeaderF()

    if empty(globpath(&rtp, '/plugin/leaderf.vim'))
        return
    endif

    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
        return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    let g:Lf_ShortcutF = '<leader>ff'
    let g:Lf_ShortcutB = '<leader>fb'

endfunction

" Sneak: Jump with 2 chars.
function! navigator#Sneak()

    if empty(globpath(&rtp, '/plugin/sneak.vim'))
        return
    endif

    " Improved f/F/t/T
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
