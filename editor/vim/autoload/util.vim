" =====================================================================
" 
" Utilities
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! util#PluginInstall(plugins)

    " l:plugin_list is a dict that contains essential keys for plugins {{{1
    " link: The source of each plugin
    " plughook: The installation hook for vim-plugin
    " Additional installation option can be added for different plugin
    " managers
    let l:plugin_list = {
        \ 'surround'    : { 'link': 'tpope/vim-surround',           },
        \ 'nerdtree'    : { 'link': 'preservim/nerdtree',           },
        \ 'autopair'    : { 'link': 'LunarWatcher/auto-pairs',      },
        \ 'vista'       : { 'link': 'liuchengxu/vista.vim',         },
        \ 'tagbar'      : { 'link': 'preservim/tagbar',             },
        \ 'tcomment'    : { 'link': 'tomtom/tcomment_vim',          },
        \ 'nerdcomment' : { 'link': 'scrooloose/nerdcommenter',     },
        \ 'commentary'  : { 'link': 'tpope/vim-commentary',         },
        \ 'easymotion'  : { 'link': 'easymotion/vim-easymotion',    },
        \ 'fzf'         : {
            \ 'link': 'junegunn/fzf',
            \ 'plughook': { 'do': { -> fzf#install() }, },
            \ },
        \ 'leaderf'     : { 
            \ 'link': 'Yggdroot/LeaderF',  
            \ 'plughook': { 'do': ':LeaderfInstallCExtension' },
            \ },
        \ 'ctrlp'       : { 'link': 'ctrlpvim/ctrlp.vim',           },
        \ 'ale'         : { 'link': 'dense-analysis/ale',           },
        \ 'neomake'     : { 'link': 'neomake/neomake',              },
        \ 'vimsnippets' : { 'link': 'honza/vim-snippets',           },
        \ 'ultisnips'   : { 'link': 'SirVer/ultisnips',             },
        \ 'ycm'         : { 
            \ 'link': 'ycm-core/YouCompleteMe',  
            \ 'plughook': {'do': './install.py --clangd-completer'},
            \ },
        \ 'genutils'    : { 'link': 'vim-scripts/genutils',         },
        \ 'asyncrun'    : { 'link': 'skywind3000/asyncrun.vim'      },
        \ 'vimtex'      : { 'link': 'lervag/vimtex',                },
        \ 'mdview'      : { 
            \ 'link': 'iamcco/markdown-preview.nvim', 
            \ 'plughook': { 
                \ 'do': { -> mkdp#util#install() }, 
                \ 'for': ['markdown'] 
                \ }
            \ },
        \ 'fugitive'    : { 'link': 'tpope/vim-fugitive',           },
        \ 'gitgutter'   : { 'link': 'airblade/vim-gitgutter',       },
        \ 'gruvbox'     : { 'link': 'morhetz/gruvbox',              },
        \ 'colortable'  : { 'link': 'guns/xterm-color-table.vim',   },
        \ 'airline'     : { 'link': 'vim-airline/vim-airline',      },
        \ 'lightline'   : { 'link': 'itchyny/lightline.vim',        },
        \ 'vim-smoothie': { 'link': 'psliwka/vim-smoothie',         },
        \ 'rainbow'     : { 'link': 'luochen1990/rainbow',          },
        \ 'context'     : { 'link': 'wellle/context.vim',            },
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
        call plug#begin('~/.local/share/vim/plugins')

        " Register vim-plug as a plugin to get the help doc.
        " Note that vim-plug (the plug.vim file) in this file is not working.
        Plug 'junegunn/vim-plug'

        " Install plugins
        for plugin in a:plugins
            if exists('l:plugin_list.'..plugin..'.plughook')
                Plug l:plugin_list[plugin].link, l:plugin_list[plugin].plughook
            else
                Plug l:plugin_list[plugin].link
            endif
        endfor

        " Initialize plugin system
        call plug#end()

    endif
    " }}}1
    
endfunction

" vim: set sw=4 sts=4 et fdm=marker:
