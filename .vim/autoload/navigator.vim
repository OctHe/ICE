" =====================================================================
" 
" Navigator
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! navigator#Grepper()

  if empty(globpath(&rtp, '/plugin/grepper.vim'))
    return
  endif

  noremap <Leader>fg :Grepper<CR>

endfunction

function! navigator#Sneak()

  if empty(globpath(&rtp, '/plugin/sneak.vim'))
    return
  endif

  " 1-charactor sneak for enhanced f/F/t/T
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F
  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  xmap t <Plug>Sneak_t
  xmap T <Plug>Sneak_T
  omap t <Plug>Sneak_t
  omap T <Plug>Sneak_T

endfunction

function! navigator#NerdTree()

    if empty(globpath(&rtp, '/plugin/NERD_tree.vim'))
        return
    endif

    let NERTTreeCaseSensitiveSort = 1
    let NERDTreeWinSize = 35

    augroup NERDTree
        au!

        " Close vim if the only window left open is a NERDTree
        autocmd BufEnter * 
                    \ if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
                    \ |   quit
                    \ | endif

        " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        autocmd BufEnter *
                    \ if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
                    \ |   let buf=bufnr('%') 
                    \ |   buffer# 
                    \ |   execute "normal! \<C-W>w"
                    \ |   execute 'buffer'.buf
                    \ | endif
    augroup END

    " e means explore 
    nnoremap <silent> <Leader>e :NERDTreeToggle<CR>  

endfunction

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

  let g:Lf_WildIgnore = {
        \ 'dir': ['.git', '.svn', '.hg'],
        \ 'file': ['*~']
        \}

  let g:Lf_ShortcutF = '<leader>ff'
  let g:Lf_ShortcutB = '<leader>fb'
  noremap <Leader>fr :Leaderf rg<CR>

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
