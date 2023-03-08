
function! CIM#PluginInstall(plugins)

    let l:plugin_list = {
        \ 'surround'    : ['tpope/vim-surround',        {}],
        \ 'nerdtree'    : ['preservim/nerdtree',        {}],
        \ 'autopair'    : ['LunarWatcher/auto-pairs',   {}],
        \ 'vista'       : ['liuchengxu/vista.vim',      {}],
        \ 'tagbar'      : ['preservim/tagbar',          {}],
        \ 'tcomment'    : ['tomtom/tcomment_vim',       {}],
        \ 'nerdcomment' : ['scrooloose/nerdcommenter',  {}],
        \ 'commentary'  : ['tpope/vim-commentary',      {}],
        \ 'fzf'         : ['junegunn/fzf',      { 'do': { -> fzf#install() } }],
        \ 'leaderf'     : ['Yggdroot/LeaderF',  { 'do': ':LeaderfInstallCExtension' }],
        \ 'ctrlp'       : ['ctrlpvim/ctrlp.vim',        {}],
        \ 'colortable'  : ['guns/xterm-color-table.vim',{}],
        \ 'airline'     : ['vim-airline/vim-airline',   {}],
        \ 'lightline'   : ['itchyny/lightline.vim',     {}],
        \ 'vimux'       : ['preservim/vimux',           {}],
        \ 'ale'         : ['dense-analysis/ale',        {}],
        \ 'vimsnippets' : ['honza/vim-snippets',        {}],
        \ 'ultisnips'   : ['SirVer/ultisnips',          {}],
        \ 'ycm'         : ['ycm-core/YouCompleteMe', 
                            \ {'do': './install.py --clangd-completer'}
                            \ ],
        \ 'vimtex'      : ['lervag/vimtex',     { 'for': ['tex', 'bib'] }],
        \ 'mdview'      : ['iamcco/markdown-preview.nvim', 
                            \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown'] }
                            \ ],
        \ }


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

    " Install plugins
    for plugins in a:plugins
        Plug l:plugin_list[plugins][0], l:plugin_list[plugins][1]
    endfor

    " Initialize plugin system
    call plug#end()
endfunction
