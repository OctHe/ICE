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

" vim: set sw=4 sts=4 et fdm=marker:
