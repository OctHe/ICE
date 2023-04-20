" ===================================================================== " 
" Configuration of basic edit plugins 
" 
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

" Vista: 
if index(g:enable_text_plugins, 'vista') != -1
    let g:vista_sidebar_width = 50

endif

" Nerdcomment: 
if index(g:enable_text_plugins, 'nerdcomment') != -1
endif

" commentary:
if index(g:enable_text_plugins, 'commentary') != -1
  xmap <Leader>c  <Plug>Commentary
  nmap <Leader>c  <Plug>Commentary
  omap <Leader>c  <Plug>Commentary
  nmap <Leader>cc <Plug>CommentaryLine
  nmap <Leader>cu <Plug>Commentary<Plug>Commentary
endif

" NERDTree: 
if index(g:enable_text_plugins, 'nerdtree') != -1
    let NERTTreeCaseSensitiveSort = 1
    let NERDTreeWinSize = 35

    " Automatic open NERDTree when open vim and go to the previous window
    autocmd VimEnter *.{py,h,c} NERDTree | wincmd p
    " Close vim if the only window left open is a NERDTree
    autocmd BufEnter * :call s:CloseNERDTree()
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * :call s:PreventReplacingNERDTree()

    function! s:CloseNERDTree()
        if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
            quit
        endif

    endfunction

    function! s:PreventReplacingNERDTree()
        if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
            let buf=bufnr('%') 
            buffer# 
            execute "normal! \<C-W>w"
            execute 'buffer'.buf
        endif

    endfunction

    " e means explore 
    nnoremap <Leader>e :NERDTreeToggle<CR>  

endif

