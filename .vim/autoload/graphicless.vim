" =====================================================================
" 
" Plugin management
"
" Author: OctHe
" Copyright (C): 2023
" 
" =====================================================================

function! graphicless#plugininstall(plugins)

    " l:plugin_list is a dict that contains essential keys for plugins {{{1
    "   link: The source of each plugin
    "   plug_hook: The installation hook for vim-plugin
    " Additional installation option can be added for different plugin managers
    let l:plugin_list = {
        \ 'surround'    : { 'link': 'tpope/vim-surround',           },
        \ 'repeat'      : { 'link': 'tpope/vim-repeat',             },
        \ 'autopair'    : { 'link': 'LunarWatcher/auto-pairs',      },
        \ 'nerdcomment' : { 'link': 'preservim/nerdcommenter',      },
        \ 'tcomment'    : { 'link': 'tomtom/tcomment_vim',          },
        \ 'commentary'  : { 'link': 'tpope/vim-commentary',         },
        \ 'starsearch'  : { 'link': 'vim-scripts/star-search',      },
        \ 'fzf'         : {
            \ 'link': 'junegunn/fzf',
            \ 'plug_hook': { 'do': { -> fzf#install() }, },
            \ },
        \ 'leaderf'     : { 
            \ 'link': 'Yggdroot/LeaderF',  
            \ 'plug_hook': { 'do': ':LeaderfInstallCExtension' },
            \ },
        \ 'ctrlp'       : { 'link': 'ctrlpvim/ctrlp.vim',           },
        \ 'easymotion'  : { 'link': 'timsu92/vim-easymotion',       },
        \ 'sneak'       : { 'link': 'justinmk/vim-sneak',           },
        \ 'nerdtree'    : { 'link': 'preservim/nerdtree',           },
        \ 'vista'       : { 'link': 'liuchengxu/vista.vim',         },
        \ 'tagbar'      : { 'link': 'preservim/tagbar',             },
        \ 'ctags'       : { 'link': 'vim-scripts/ctags.vim'         },
        \ 'ale'         : { 'link': 'dense-analysis/ale',           },
        \ 'neomake'     : { 'link': 'neomake/neomake',              },
        \ 'vimtable'    : { 'link': 'dhruvasagar/vim-table-mode',   },
        \ 'splitjoin'   : { 'link': 'AndrewRadev/splitjoin.vim',    },
        \ 'ycm'         : { 
            \ 'link': 'ycm-core/YouCompleteMe',  
            \ 'plug_hook': {'do': './install.py --clangd-completer'},
            \ },
        \ 'vimsnippets' : { 'link': 'honza/vim-snippets',           },
        \ 'ultisnips'   : { 'link': 'SirVer/ultisnips',             },
        \ 'genutils'    : { 'link': 'vim-scripts/genutils',         },
        \ 'floaterm'    : { 'link': 'voldikss/vim-floaterm',        },
        \ 'dispatch'    : { 'link': 'tpope/vim-dispatch'            },
        \ 'asyncrun'    : { 'link': 'skywind3000/asyncrun.vim'      },
        \ 'vimtex'      : { 'link': 'lervag/vimtex',                },
        \ 'mdhl'        : { 'link': 'preservim/vim-markdown',       },
        \ 'mdp'         : { 
            \ 'link': 'iamcco/markdown-preview.nvim', 
            \ 'plug_hook': {  'do': { -> mkdp#util#install() }, }
            \ },
        \ 'csv'         : { 'link': 'chrisbra/csv.vim',             },
        \ 'fugitive'    : { 'link': 'tpope/vim-fugitive',           },
        \ 'gitgutter'   : { 'link': 'airblade/vim-gitgutter',       },
        \ 'airline'     : { 'link': 'vim-airline/vim-airline',      },
        \ 'lightline'   : { 'link': 'itchyny/lightline.vim',        },
        \ 'tmux_navi'   : { 
            \ 'link': 'christoomey/vim-tmux-navigator', 
            \ },
        \ 'indentline'  : { 'link': 'Yggdroot/indentLine',          },
        \ 'indentguide' : { 'link': 'preservim/vim-indent-guides',  },
        \ 'whichkey'    : { 'link': 'liuchengxu/vim-which-key',     },
        \ 'smoothie'    : { 'link': 'psliwka/vim-smoothie',         },
        \ 'rainbow'     : { 'link': 'luochen1990/rainbow',          },
        \ 'context'     : { 'link': 'wellle/context.vim',           },
        \ 'gruvbox'     : { 'link': 'morhetz/gruvbox',              },
        \ 'colortable'  : { 'link': 'guns/xterm-color-table.vim',   },
        \ }

    " }}}1
    
    " vim-plug is the plugin manager {{{1
    if g:plugin_manager == 'plug'

        " Try to install vim-plug if not found
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

          if empty(glob('~/.vim/autoload/plug.vim'))
            echo "curl plug.vim from raw.githubusercontent.com failed. Try git clone.\n"

            silent !git clone https://github.com/junegunn/vim-plug /tmp/vim-plug
            silent !cp /tmp/vim-plug/plug.vim ~/.vim/autoload/
            silent !rm -rf /tmp/vim-plug
          endif

          echo "Download plug.vim. Please restart vim to enable plugins"
          return
        endif

        " Specify a directory for plugins
        " - Avoid using standard Vim directory names like 'plugin'
        call plug#begin(g:plugin_dir)

        " Register vim-plug as a plugin to get the help doc.
        " Note that vim-plug (the plug.vim file) in this file is not working.
        Plug 'junegunn/vim-plug'

        for plugin in a:plugins
            " Load plugins
            if exists('l:plugin_list.'..plugin..'.plug_hook')
                " Markdown-preview has issue if the name of its directory is
                " changed, so its directory is not renaed until I know how to
                " fix the bug in the plugin, if possiable
                if plugin != 'mkdp'
                    let l:plugin_list[plugin].plug_hook['as'] = plugin
                endif
                Plug l:plugin_list[plugin].link, l:plugin_list[plugin].plug_hook
            else
                Plug l:plugin_list[plugin].link, {'as': plugin}
            endif

        endfor

        " Initialize plugin system
        call plug#end()

    endif
    " }}}1
    
endfunction

function! graphicless#pluginconfig(plugins)

        " Config loaded plugins
        for plugin in a:plugins
            if isdirectory(expand(g:plugin_dir..plugin))
                call graphicless#config#{plugin}()
            endif
        endfor
        call graphicless#config#nerdtree()

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
