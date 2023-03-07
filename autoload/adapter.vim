" =====================================================================
" 
" Adapters initialization
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! adapter#init(plugin_alias)

let l:edit_plugin_list = {
    \ 'surround': ['tpope/vim-surround',        {}],
    \ 'nerdtree': ['preservim/nerdtree',        {}],
    \ 'autopair': ['LunarWatcher/auto-pairs',   {}],
    \ 'vista'   : ['liuchengxu/vista.vim',      {}],
    \ 'tagbar'  : ['preservim/tagbar',   {}],
    \ 'tcomment': ['tomtom/tcomment_vim',   {}],
    \ 'nerdcomment'   : ['scrooloose/nerdcommenter',   {}],
    \ 'commentary'   : ['tpope/vim-commentary',   {}],
    \ 'fzf'   : ['junegunn/fzf',   { 'do': { -> fzf#install() } }],
    \ 'leaderf'   : ['Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }],
    \ 'ctrlp'   : ['ctrlpvim/ctrlp.vim',   {}],
    \}

    " Install vim-plug if not found
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Specify a directory for plugins
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')
    
    " Register vim-plug as a plugin to get the help doc.
    " Note that vim-plug (the plug.vim file) in this file is not working.
    Plug 'junegunn/vim-plug'

    " Init adapters
    call adapter#theme#init()
    call adapter#lint#init()
    call adapter#completion#init()
    call adapter#compile#init()

    " Install adapters
    for plugins in g:adapter#theme
        Plug plugins[0], plugins[1]
    endfor

    for plugins in a:plugin_alias 
        Plug l:edit_plugin_list[plugins][0], l:edit_plugin_list[plugins][1]
    endfor

    for plugins in g:adapter#lint
        Plug plugins[0], plugins[1]
    endfor

    for plugins in g:adapter#completion
        Plug plugins[0], plugins[1]
    endfor

    for plugins in g:adapter#compile
        Plug plugins[0], plugins[1]
    endfor

    " Initialize plugin system
    call plug#end()


endfunction
