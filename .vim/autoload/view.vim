" =====================================================================
"
" Colorscheme, status line, indent. Let Vim looks better
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! view#Undotree()
  if empty(globpath(&rtp, '/plugin/undotree.vim'))
    return
  endif

  nnoremap <Leader>u :UndotreeToggle<CR>

endfunction

function! view#Goyo()
  if empty(globpath(&rtp, '/plugin/goyo.vim'))
    return
  endif

  nnoremap <Leader>wg :Goyo<CR>

endfunction

function! view#Limelight()
  if empty(globpath(&rtp, '/plugin/limelight.vim'))
    return
  endif

  nnoremap <Leader>wl :Limelight!!<CR>

endfunction

function! view#Whichkey()

  if empty(globpath(&rtp, '/plugin/which_key.vim'))
    return
  endif

  let g:which_key_map = {}
  let g:which_key_map.c = {
        \ 'name': '+comment',
        \ 'c': 'comment line',
        \ 'u': 'uncomment',
        \ }
  let g:which_key_map.f = {
        \ 'name': '+find',
        \ }
  let g:which_key_map.g = {
        \ 'name': '+git',
        \ 'd': 'diff',
        \ }
  let g:which_key_map.h = {
        \ 'name': '+hunk',
        \ 'p': 'preview the hunk',
        \ 's': 'stage the hunk',
        \ 'u': 'undo the hunk',
        \ }
  let g:which_key_map.s = {
        \ 'name': '+symbol',
        \ }
  let g:which_key_map.t = {
        \ 'name': '+terminal',
        \ }
  let g:which_key_map.u = {
        \ 'name': 'undo tree',
        \ }
  let g:which_key_map.w = {
        \ 'name': '+writing',
        \ 'g': 'goyo',
        \ 'l': 'limelight',
        \ }
  call which_key#register('<Space>', "g:which_key_map")

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

" vim: set sw=2 sts=2 et fdm=marker:
