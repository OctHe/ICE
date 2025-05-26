" =====================================================================
" 
" UI
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! view#Config()
    " UI: Colorscheme, status line, indent. Let Vim looks better
    " airline:
    if !empty(globpath(&rtp, '/plugin/airline.vim'))
        " Enhanced tabline
        let g:airline#extensions#tabline#enabled = 1
        " Show buffer number so I can quickly pick a buffer
        let g:airline#extensions#tabline#buffer_nr_show = 1

    endif

    " Lightline

    " indentline

    " indentguide

    " Whichkey: 
    if !empty(globpath(&rtp, '/plugin/which_key.vim'))
        let g:which_key_map = {}
        let g:which_key_map.c = {
                                \ 'name': '+Comment',
                                \ 'c': 'Comment line',
                                \ }
        let g:which_key_map.f = {
                                \ 'name': '+Find',
                                \ }
        let g:which_key_map.g = {
                                \ 'name': '+Git',
                                \ 'd': 'Diff',
                                \ }
        let g:which_key_map.h = {
                                \ 'name': '+Hunk',
                                \ 'p': 'Preview the hunk',
                                \ 's': 'Stage the hunk',
                                \ 'u': 'Undo the hunk',
                                \ }
        let g:which_key_map.s = {
                                \ 'name': '+Symbol',
                                \ }
        let g:which_key_map.t = {
                                \ 'name': '+Terminal',
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
