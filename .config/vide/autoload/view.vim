" =====================================================================
"
" Colorscheme, status line, indent. Let Vim looks better
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! view#IndentGuides()
  if empty(globpath(&rtp, '/plugin/indent_guides.vim'))
    return
  endif

  let g:indent_guides_enable_on_vim_startup = 1

endfunction

function! view#Airline()
  if empty(globpath(&rtp, '/plugin/airline.vim'))
    return
  endif

  " Enhanced tabline
  let g:airline#extensions#tabline#enabled = 1
  " Show buffer number so the buffer can be quickly picked
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
  let g:which_key_map.e = {
        \ 'name': 'Explorer',
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
        \ 'name': 'Symbol',
        \ }
  call which_key#register('<Space>', "g:which_key_map")

  nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
  vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Leader>'<CR>
  nnoremap <silent> <LocalLeader> :<c-u>WhichKey '<LocalLeader>'<CR>
  vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '<LocalLeader>'<CR>

endfunction
" vim: set sw=2 sts=2 et fdm=marker:
