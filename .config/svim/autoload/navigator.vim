" =====================================================================
" 
" Navigator
"
" Author: OctHe
" Copyright (C): 2025
" 
" =====================================================================

function! navigator#Config()

    " starsearch: Enhanced star keymapping. Avoid jumping to next

    " fzf:

    " LeaderF: Asynchronous fuzzy finder with popup window
    if !empty(globpath(&rtp, '/plugin/leaderf.vim'))
        let g:Lf_WindowPosition = 'popup'

        " Vista.vim:
        function! NearestMethodOrFunction() abort
          return get(b:, 'vista_nearest_method_or_function', '')
        endfunction

        set statusline+=%{NearestMethodOrFunction()}

        let g:Lf_ShortcutF = '<leader>ff'
        let g:Lf_ShortcutB = '<leader>fb'
    endif

    " CtrlP:

    " Sneak: Jump with 2 chars.
    if !empty(globpath(&rtp, '/plugin/sneak.vim'))
        " Improved f/F/t/T
        map f <Plug>Sneak_f
        map F <Plug>Sneak_F
        map t <Plug>Sneak_t
        map T <Plug>Sneak_T
    endif

    " easymotion:

    " Vim-tmux-navigator: It requires configuration in tmux
    " TODO: Use the same file for both vim and tmux

    " NERDTree: File explorer. 
    if !empty(globpath(&rtp, '/plugin/NERD_tree.vim'))
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
    endif

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
