" ============================
" 
" This is the configuration file of Project CIM
" Author: Shiyue He
" Copyright (C): 2020-2023
" 
" ============================
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" Enable file type detection.
filetype plugin on
" Enable automatic indentation as you type.
filetype indent on

" ============================
" Install vim-plug if not found
" Update: 2022.10.30
" ============================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" ============================
" -- vim-plug --
"  Update: 2023.02.04
" ============================
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ========== Reading =========

" NERDTree:
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }

" tagbar: A class outline viewer for vim
" tagbar is based on Universal Ctags, install it by
"   sudo apt install universal-ctags
Plug 'preservim/tagbar'
" Vista: View and search tags in vim/Neovim
" Plug 'liuchengxu/vista.vim'

" vim-airline: Lean and mean status bar
Plug 'vim-airline/vim-airline'
" lightline: A light and configurable statusline/tabline plugin for Vim 
" Plug 'itchyny/lightline.vim'

" fzf: fzf is the most well-known fuzzy finder command line written in go.
" fzf has a built-in vim configuration file.
" The installation program will download the newest version without building.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" CtriP: CtrlP is a fuzzy finder in pure vimscript
" Plug 'ctrlpvim/ctrlp.vim' 
" LeaderF: An efficient fuzzy finder based on python
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" ========== Writing =========

" auto-pairs: Operate brackets in pair
Plug 'LunarWatcher/auto-pairs'

" tcomment: A easy-to-use commenter
" Plug 'tomtom/tcomment_vim'
" commentary: commentary is similar to tcomment_vim and is extremely lightweight within 200 lines code.
Plug 'tpope/vim-commentary'
" nerdcommenter:
" Plug 'scrooloose/nerdcommenter'

" surround: A plugin about surroundings
Plug 'tpope/vim-surround'

" ALE: Asynchronous Lint Engine
" ALE works as an LSP client, so the OS must install the corresponding language
" servers.
" Recommendation: 
"     pyright: pip3/pip install pyright
"     clangd: 'sudo apt install clangd' in ubuntu
" clangd lSP requires bear to generate compile_commands.json for make-based
" projects
"     sudo apt install bear 
Plug 'dense-analysis/ale'

" YouCompleteMe
" Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer'}

" Snip plugin
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ========== Compilation ====== 

" vim-dispatch: Asynchronous build and test dispatcher
" Plug 'tpope/vim-dispatch' 

" vimux: Interact with tmux from vim
" Plug 'preservim/vimux'

" Markdown-preview:
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" vimtex:
Plug 'lervag/vimtex'

" ========== Others =========== 

" Color table: Display the color table in terminal with command
Plug 'guns/xterm-color-table.vim'

" Initialize plugin system
call plug#end()


" ============================
" NERDTree settings
" Update: 2023.02.04
" ============================

noremap <C-n> :NERDTreeToggle<CR>  

let NERTTreeCaseSensitiveSort = 1
let NERDTreeWinSize = 35

" Automatic open NERDTree when open vim and go to the previous window
autocmd VimEnter *.{py,h,c} NERDTree | wincmd p
" Close vim if the only window left open is a NERDTree
autocmd BufEnter * :call CloseNERDTree()
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * :call PreventReplacingNERDTree()

function! CloseNERDTree()
    if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        quit
    endif

endfunction

function! PreventReplacingNERDTree()
    if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
        let buf=bufnr('%') 
        buffer# 
        execute "normal! \<C-W>w"
        execute 'buffer'.buf
    endif

endfunction


" ============================
" vim-airline settings
" Update: 2023.02.05
" ============================

let g:airline#extensions#tabline#enabled = 1


" ============================
" Vista.vim settings
" Update: 2023.01.05
" ============================
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" set statusline+=%{NearestMethodOrFunction()}

" " By default vista.vim never run if you don't call it explicitly.
" " If you want to show the nearest function in your statusline automatically,
" " you can add the following line to your vimrc
" if exists('g:loaded_vista')
"   autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" endif

" let g:vista_sidebar_width = 50


" ============================
" LeaderF settings
" Update: 2023.01.05
" ============================
" let g:Lf_WindowPosition = 'popup'


" ============================
" YCM settings
" Update: 2021.11.28
" ============================
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_show_diagnostics_ui = 0

" map <leader>g :YcmCompleter GoTo<CR>


" ============================
" Nerdcommenter settings
" Update: 2021.11.28
" ============================
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1


" ============================
" Markdown-preview.nvim settings
" Update: 2021.11.28
" ============================
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']


" ============================
" ale settings
" Update: 2021.11.28
" ============================
let g:ale_linters = {
\   'python': ['pyright'],
\   'c': ['clangd'],
\   'c++': ['clangd'],
\}


" ============================
" Ultrisnips settings
" Update: 2021.11.28
" ============================
" Trigger configuration. Change this to something other than <tab> if use one 
" of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ============================
" vimtex settings
" Update: 2022.01.19
" ============================
" The follows is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
" filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options
let g:vimtex_view_method = 'zathura'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = "\\"

" Project with multiple files.
"   To support multiple files (with '\input') in a project, user must open the 
"   main file (e.g., main.tex) at first. For more details, please see the help
"   document with ':h vimtex-multi-file'

" ============================
" Put non-Plugin stuff after this line
" Update: 2023.02.11
" ============================

set history=200		" keep 200 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set wildmenu		" display completion matches in a status line
set number          " Show line number
set shiftwidth=4    " The width of '<' and '>'
set expandtab       " Expand tag to space
set tabstop=4       " One tab includes four spaces
set splitbelow      " New buffer splits below by default
set splitright      " New buffer splits right by default
set hlsearch        " Highlight the search results
set mouse=a         " Enable mouse in all mode
set smartindent     " Do smart autoindenting
set scrolloff=5     " Show a few lines around the cursor

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Show @@@ in the last line if it is truncated.
set display=truncate


" GUI options
set guioptions=aegrLt

" Spell check
set spell
" Clear the default highlight of the Spell check
highlight clear SpellBad
" Set the highlight style as underline
highlight SpellBad cterm=underline  

" Buffer background
highlight Normal ctermbg=234
" Dialog
highlight PMenu ctermfg=56 ctermbg=white guifg=darkblue guibg=darkgrey
highlight PMenuSel ctermfg=white ctermbg=56 guifg=darkgreen guibg=lightblue
" Vertical split: 
highlight VertSplit ctermfg=234 ctermbg=darkgreen

" Highlight column
" set colorcolumn=80
" highlight ColorColumn ctermbg=6

augroup CimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

    autocmd CmdwinEnter *
        \ echohl Todo | 
        \ echo 'You discovered the command-line window! You can close it with ":q".' |
        \ echohl None
augroup END

" Command to see the difference between the current buffer and the file loaded from.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" By default, CIM wants to open the help file at the right side
command! -nargs=?  CimHelp :help <args> | if &filetype == 'help' | wincmd L | vertical resize 90 | set number | endif
