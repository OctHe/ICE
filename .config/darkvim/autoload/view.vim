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

function! view#Undotree()
  if empty(globpath(&rtp, '/plugin/undotree.vim'))
    return
  endif

  nnoremap <Leader>u :UndotreeToggle<CR>

endfunction

function! view#Whichkey()

  if empty(globpath(&rtp, '/plugin/which_key.vim'))
    return
  endif

  let g:which_key_map = {}
  let g:which_key_map.g = {
        \ 'name': '+git',
        \ 'd': 'diff',
        \ 's': 'status',
        \ }
  let g:which_key_map.c = {
        \ 'name': '+comment',
        \ }
  let g:which_key_map.f = {
        \ 'name': '+find',
        \ 'b': 'buffer',
        \ 'f': 'file',
        \ 'g': 'grep',
        \ 'r': 'ripgrep',
        \ }
  let g:which_key_map.t = {
        \ 'name': '+terminal',
        \ 'k': 'kill',
        \ 'N': 'new',
        \ 'n': 'next',
        \ 'p': 'previous',
        \ 't': 'toggle',
        \ }
  let g:which_key_map.s = {
        \ 'name': 'symbol',
        \ }
  let g:which_key_map.u = {
        \ 'name': 'undo tree',
        \ }
  let g:which_key_map.p = {
        \ 'name': '+plugin',
        \ 'i': 'install',
        \ 'u': 'update',
        \ 'd': 'delete',
        \ }
  let g:which_key_map.p.r = {
        \ 'name': '+Recache',
        \ 'c': 'Recache',
        \ }
  call which_key#register('Leader>', "g:which_key_map")

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
" vim: set sw=2 sts=2 et fdm=marker:
