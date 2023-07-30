" =====================================================================
" 
" Utilities
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! Graphicless#PluginInstall(plugins)

    " l:plugin_list is a dict that contains essential keys for plugins {{{1
    " link: The source of each plugin
    " plughook: The installation hook for vim-plugin
    " Additional installation option can be added for different plugin
    " managers
    let l:plugin_list = {
        \ 'surround'    : { 'link': 'tpope/vim-surround',           },
        \ 'autopair'    : { 'link': 'LunarWatcher/auto-pairs',      },
        \ 'easymotion'  : { 'link': 'easymotion/vim-easymotion',    },
        \ 'nerdcomment' : { 'link': 'scrooloose/nerdcommenter',     },
        \ 'tcomment'    : { 'link': 'tomtom/tcomment_vim',          },
        \ 'commentary'  : { 'link': 'tpope/vim-commentary',         },
        \ 'fzf'         : {
            \ 'link': 'junegunn/fzf',
            \ 'plughook': { 'do': { -> fzf#install() }, },
            \ },
        \ 'leaderf'     : { 
            \ 'link': 'Yggdroot/LeaderF',  
            \ 'plughook': { 'do': ':LeaderfInstallCExtension' },
            \ },
        \ 'ctrlp'       : { 'link': 'ctrlpvim/ctrlp.vim',           },
        \ 'nerdtree'    : { 'link': 'preservim/nerdtree',           },
        \ 'vista'       : { 'link': 'liuchengxu/vista.vim',         },
        \ 'tagbar'      : { 'link': 'preservim/tagbar',             },
        \ 'ale'         : { 'link': 'dense-analysis/ale',           },
        \ 'neomake'     : { 'link': 'neomake/neomake',              },
        \ 'ycm'         : { 
            \ 'link': 'ycm-core/YouCompleteMe',  
            \ 'plughook': {'do': './install.py --clangd-completer'},
            \ },
        \ 'vimsnippets' : { 'link': 'honza/vim-snippets',           },
        \ 'ultisnips'   : { 'link': 'SirVer/ultisnips',             },
        \ 'genutils'    : { 'link': 'vim-scripts/genutils',         },
        \ 'asyncrun'    : { 'link': 'skywind3000/asyncrun.vim'      },
        \ 'vimtex'      : { 'link': 'lervag/vimtex',                },
        \ 'mdview'      : { 
            \ 'link': 'iamcco/markdown-preview.nvim', 
            \ 'plughook': {  'do': { -> mkdp#util#install() }, }
            \ },
        \ 'fugitive'    : { 'link': 'tpope/vim-fugitive',           },
        \ 'gitgutter'   : { 'link': 'airblade/vim-gitgutter',       },
        \ 'airline'     : { 'link': 'vim-airline/vim-airline',      },
        \ 'lightline'   : { 'link': 'itchyny/lightline.vim',        },
        \ 'smoothie'    : { 'link': 'psliwka/vim-smoothie',         },
        \ 'rainbow'     : { 'link': 'luochen1990/rainbow',          },
        \ 'context'     : { 'link': 'wellle/context.vim',           },
        \ 'gruvbox'     : { 'link': 'morhetz/gruvbox',              },
        \ 'colortable'  : { 'link': 'guns/xterm-color-table.vim',   },
        \ }

    " }}}1
    
    " vim-plug is the plugin manager {{{1
    if g:plugin_manager == 'plug'

        " Install vim-plug if not found
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        endif

        " Specify a directory for plugins
        " - Avoid using standard Vim directory names like 'plugin'
        call plug#begin(g:plugin_dir)

        " Register vim-plug as a plugin to get the help doc.
        " Note that vim-plug (the plug.vim file) in this file is not working.
        Plug 'junegunn/vim-plug'

        for plugin in a:plugins
            " Load plugins
            if exists('l:plugin_list.'..plugin..'.plughook')
                let l:plugin_list[plugin].plughook['as'] = plugin
                Plug l:plugin_list[plugin].link, l:plugin_list[plugin].plughook
            else
                Plug l:plugin_list[plugin].link, {'as': plugin}
            endif

        endfor

        " Initialize plugin system
        call plug#end()

    endif
    " }}}1
    
endfunction

function! Graphicless#PluginConfig(plugins)

        " Config loaded plugins
        for plugin in a:plugins
            if isdirectory(expand(g:plugin_dir..plugin))
                call Graphicless#Config#{plugin}()
            endif
        endfor
        call Graphicless#Config#nerdtree()

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
