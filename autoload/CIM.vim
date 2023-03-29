" =====================================================================
" 
" Utilities of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function s:PluginList()

    " CIM give each plugin an alias
    " link is the github link for each plugin
    " plughook is the installation hook for vim-plugin
    " additional installation option can be added for different plugin
    " managers
    " {{{1
    let l:plugin_installation = {
        \ 'surround'    : { 'link': 'tpope/vim-surround',           },
        \ 'nerdtree'    : { 'link': 'preservim/nerdtree',           },
        \ 'autopair'    : { 'link': 'LunarWatcher/auto-pairs',      },
        \ 'vista'       : { 'link': 'liuchengxu/vista.vim',         },
        \ 'tagbar'      : { 'link': 'preservim/tagbar',             },
        \ 'tcomment'    : { 'link': 'tomtom/tcomment_vim',          },
        \ 'nerdcomment' : { 'link': 'scrooloose/nerdcommenter',     },
        \ 'commentary'  : { 'link': 'tpope/vim-commentary',         },
        \ 'easymotion'  : { 'link': 'easymotion/vim-easymotion',    },
        \ 'fzf'         : { 'link': 'junegunn/fzf',                 },
        \ 'leaderf'     : { 'link': 'Yggdroot/LeaderF',  
            \ 'plughook': { 'do': ':LeaderfInstallCExtension' },
            \ },
        \ 'ctrlp'       : { 'link': 'ctrlpvim/ctrlp.vim',           },
        \ 'ale'         : { 'link': 'dense-analysis/ale',           },
        \ 'vimsnippets' : { 'link': 'honza/vim-snippets',           },
        \ 'ultisnips'   : { 'link': 'SirVer/ultisnips',             },
        \ 'ycm'         : { 'link': 'ycm-core/YouCompleteMe',  
            \ 'plughook': {'do': './install.py --clangd-completer'},
            \ },
        \ 'genutils'    : { 'link': 'vim-scripts/genutils',         },
        \ 'asyncrun'    : { 'link': 'skywind3000/asyncrun.vim'      },
        \ 'breakpts'    : { 'link': 'albfan/vim-breakpts',          },
        \ 'vimtex'      : {'link' : 'lervag/vimtex',
            \ 'plughook': { 'for': ['tex', 'bib'] }
            \ },
        \ 'mdview'      : {'link': 'iamcco/markdown-preview.nvim', 
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
        \ 'vimux'       : { 'link': 'preservim/vimux',              },
        \ }

    " }}}1
    
    return l:plugin_installation

endfunction

function! CIM#PluginInstall(plugins)

    let l:plugin_list = s:PluginList()

    " vim-plug is the plugin manager {{{1
    if g:plugin_manager == 'plug'

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
