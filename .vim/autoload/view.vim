" =====================================================================
" 
" Colorscheme, status line, indent. Let Vim looks better
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! view#Airline()
    if empty(globpath(&rtp, '/plugin/airline.vim'))
        return
    endif

    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1
    " Show buffer number so I can quickly pick a buffer
    let g:airline#extensions#tabline#buffer_nr_show = 1

endfunction

function! view#Whichkey()

    if empty(globpath(&rtp, '/plugin/which_key.vim'))
        return
    endif

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

    nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
    vnoremap <silent> g :<c-u>WhichKeyVisual 'g'<CR>
    nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
    vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Leader>'<CR>
    nnoremap <silent> <LocalLeader> :<c-u>WhichKey '<LocalLeader>'<CR>
    vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '<LocalLeader>'<CR>

endfunction
function! view#Rainbow()

    if empty(globpath(&rtp, '/plugin/rainbow_main.vim'))
        return
    endif
    " This variable must be defined to use rainbow. 
    " Set to 0 to enable it later via :RainbowToggle
    let g:rainbow_active = 1 

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
