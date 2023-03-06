" =====================================================================
" 
" Edit adapter of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! adapter#edit#init()

    " Nerdtree:
    " auto-pairs: Operate brackets in pair
    " vim-surround: A plugin about surroundings
    let g:adapter#edit = [
        \ ['preservim/nerdtree',        {}],
        \ ['LunarWatcher/auto-pairs',   {}],
        \ ['tpope/vim-surround',        {}],
        \ ]

    if exists( 'g:adapter#edit#tag' ) && 
            \g:adapter#edit#tag ==# 'vista'
        " Vista: View and search tags in vim/Neovim. It supports LSP
        call add(g:adapter#edit, ['liuchengxu/vista.vim',   {}])
    else
        " tagbar: A symbol viewer for vim
        " tagbar is based on Universal Ctags.
        "   sudo apt install universal-ctags
        call add(g:adapter#edit, ['preservim/tagbar',   {}])
    endif

    if exists( 'g:adapter#edit#comment' ) && 
            \g:adapter#edit#comment ==# 'tcomment'
        " tcomment: A easy-to-use commenter
        call add(g:adapter#edit, ['tomtom/tcomment_vim',   {}])
    elseif exists( 'g:adapter#edit#comment' ) && 
            \g:adapter#edit#comment ==# 'nerdcommenter'
        " nerdcommenter:
        call add(g:adapter#edit, ['scrooloose/nerdcommenter',   {}])
    else
        " commentary: commentary is similar to tcomment_vim and is extremely lightweight within 200 lines code.
        call add(g:adapter#edit, ['tpope/vim-commentary',   {}])
    endif

    if exists( 'g:adapter#edit#find' ) && 
            \g:adapter#edit#find ==# 'Ctrlp'
        " CtrlP: CtrlP is a fuzzy finder in pure vimscript
        call add(g:adapter#edit, ['ctrlpvim/ctrlp.vim',   {}])
    elseif exists( 'g:adapter#edit#find' ) && 
            \g:adapter#edit ==# 'LeaderF'
        " LeaderF: An efficient fuzzy finder based on python
        call add(g:adapter#edit, 
                \['Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }]
                \)
    else
        " fzf: fzf is the most well-known fuzzy finder command line written in go.
        " fzf has a built-in vim configuration file.
        " The installation program will download the newest version without building.
        call add(g:adapter#edit, 
                \['junegunn/fzf',   { 'do': { -> fzf#install() } }]
                \)
    endif

endfunction

function! adapter#edit#options()

    " NERDTree: 
    noremap <C-n> :NERDTreeToggle<CR>  

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

    " LeaderF: 
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    " By default vista.vim never run if you don't call it explicitly.
    " If you want to show the nearest function in your statusline automatically,
    " you can add the following line to your vimrc
    if exists('g:loaded_vista')
      autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    endif

    let g:vista_sidebar_width = 50
    
    " Nerdcommenter: 
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1
    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
    " Enable NERDCommenterToggle to check all selected lines is commented or not
endfunction
