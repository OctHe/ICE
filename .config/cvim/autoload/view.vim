" =====================================================================
" 
" UI: Colorscheme, status line, indent. Let Vim looks better
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! view#Whichkey()

    if empty(globpath(&rtp, '/plugin/which_key.vim'))
        return
    endif

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
    let g:which_key_map.p = {
                \ 'name': '+Plugin',
                \ 'i': 'Install',
                \ 'u': 'Update',
                \ }
    let g:which_key_map.p.r = {
                \ 'name': '+Remove',
                \ 'c': 'Recache',
                \ 'd': 'Delete',
                \ }
    call which_key#register('<Space>', "g:which_key_map")

    nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
    vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Leader>'<CR>
    nnoremap <silent> <LocalLeader> :<c-u>WhichKey '<LocalLeader>'<CR>
    vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '<LocalLeader>'<CR>

endfunction

" rainbow: Rainbow brackets
function! view#Rainbow()

    if empty(globpath(&rtp, '/plugin/rainbow_main.vim'))
        return
    endif

    " This variable must be defined to use rainbow. 
    " Set to 0 to enable it later via :RainbowToggle
    let g:rainbow_active = 1 

endfunction

function! view#AwesomeColorschemes()

    if filereadable(globpath(&rtp, '/colors/iceberg.vim'))
        colorscheme iceberg
    endif


endfunction
" vim: set sw=4 sts=4 et fdm=marker:
