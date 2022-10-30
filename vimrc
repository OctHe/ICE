"""""""""""""""""""""""""""""""""
" 
" This is Shiyue's vim configuration file.
" The first thing for the file is to install vim-plug.
" It will install all plugins by vim-plug with “:PlugInstall"
" It provides some customized configurations at final.
" 
"""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required


"""""""""""""""""""""""""""""""""
" Install vim-plug if not found
" Update: 2022.10.30
"""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


"""""""""""""""""""""""""""""""""
" -- vim-plug --
"""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugin for list the tags
Plug 'yegappan/taglist', {'for': ['python', 'c', 'cpp', 'vim']}

" Lint plugin
Plug 'dense-analysis/ale', {'for': ['python', 'c', 'cpp']}

" NERDTree plugin and others
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'scrooloose/nerdcommenter'

" Markdown plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Snip plugin
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer'}

" vimtex plugin
Plug 'lervag/vimtex'

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""
" Customized functions
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""

function! QuickRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time sh %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

"""""""""""""""""""""""""""""""""
" NERDTree setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
" automatic open NERDTree when open vim with a file
autocmd vimenter *.{py,cc,h,c} NERDTree | wincmd p

" set hot key for NERDTree
noremap <C-n> :NERDTreeToggle<CR>  

" close vim if the only window left open is a NERDTree
autocmd BufEnter * :call CloseNERDTree()
function! CloseNERDTree()
    if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
        quit
    endif
endfunction

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * :call PreventReplacingNERDTree()
function! PreventReplacingNERDTree()
    if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
        let buf=bufnr('%') 
        buffer# 
        execute "normal! \<C-W>w"
        execute 'buffer'.buf
    endif

endfunction


"""""""""""""""""""""""""""""""""
" Nerdcommenter setting 
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
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
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""
" Taglist setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
let Tlist_Auto_Open = 0         "auto open Tlist
let Tlist_Exit_OnlyWindow = 1   "exit Tlist if taglist is the only file
let Tlist_Show_One_File = 1     "only show current file's Tlist
let Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50

"""""""""""""""""""""""""""""""""
" Markdown-preview.nvim setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""
" ale setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
\   'python': ['pylint'],
\   'c': ['clang'],
\   'c++': ['clang'],
\}

"""""""""""""""""""""""""""""""""
" Ultrisnips and 
" vim-snippets setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
" Trigger configuration. You need to change this to something other than <tab> 
" if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""
" vimtex setting
" Update: 2022.01.19
"""""""""""""""""""""""""""""""""
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

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

" IMPORTANT: Project with multiple files.
" To support multiple files (with '\input') in a project, you must open the 
" main file (e.g., main.tex) at first. For more details, please see the help
" document with ':h vimtex-multi-file'


"""""""""""""""""""""""""""""""""
" YCM setting
" Update: 2021.11.28
"""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

map <leader>g :YcmCompleter GoTo<CR>


"""""""""""""""""""""""""""""""""
" Put your non-Plugin stuff after this line
" Update: 2022.01.18
"""""""""""""""""""""""""""""""""
source $VIMRUNTIME/vimrc_example.vim

set nu  			        " display line numbers
set tabstop=4  
set shiftwidth=4  
set expandtab		        " expand tab to space 
set mouse=a                 " default close mouse
set tags=tags               " set the tags in the work directory
set spell                   " spell check
set splitbelow              " split the window at below
set guioptions=aegrLt       " set the gui option
set lines=999 columns=999   " maximize the display when open vim

colorscheme desert          " color scheme

" Color of the dialog
highlight PMenu ctermfg=56 ctermbg=255 guifg=darkblue guibg=darkgrey
highlight PMenuSel ctermfg=255 ctermbg=56 guifg=darkgreen guibg=lightblue

filetype indent on          " This enables automatic indentation as you type.
set autoindent
