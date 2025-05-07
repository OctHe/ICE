" =====================================================================
" 
" UI: Colorscheme, status line, indent. Let Vim looks better
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! view#Config()

    " Whichkey: 
    if !empty(globpath(&rtp, '/plugin/which_key.vim'))
        let g:which_key_map = {}
        let g:which_key_map.g = {
                                \ 'name': '+git',
                                \ 'd': '+diff',
                                \ }
        let g:which_key_map.c = {
                                \ 'name': '+comment',
                                \ }
        let g:which_key_map.f = {
                                \ 'name': '+find',
                                \ }
        let g:which_key_map.s = {
                                \ 'name': '+symbol',
                                \ }
        call which_key#register('<Space>', "g:which_key_map")

        nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
        vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Leader>'<CR>
        nnoremap <silent> <LocalLeader> :<c-u>WhichKey '<LocalLeader>'<CR>
        vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '<LocalLeader>'<CR>

    endif

    " rainbow: Rainbow brackets
    if !empty(globpath(&rtp, '/plugin/rainbow_main.vim'))
        " This variable must be defined to use rainbow. 
        " Set to 0 to enable it later via :RainbowToggle
        let g:rainbow_active = 1 
    endif

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
