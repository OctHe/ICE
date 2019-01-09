set nocompatible              " be iMproved, required
filetype off                  " required

" basic setting
set nu			" display line numbers
set tabstop=4  
set shiftwidth=4  
set expandtab		" expand tab to space 
set mouse=          " default close mouse
" set foldmethod=indent " indentation represents fold
set tags=tags       " set the tags in the work directory

"""""""""""
" Quickly Run
"""""""""""
map <F5> :call QuickRunGcc()<CR>
func! QuickRunGcc()
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
        exec "!time python2.7 %"
    endif
endfunc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouComleteMe
Plugin 'valloric/YouCompleteMe'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" taglist 
Plugin 'taglist.vim'

" vim-latex
Plugin 'vim-latex/vim-latex'

" vim-markdown
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" import from $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/vimrc_example.vim

" NERDTree setting
" automatic open NERDTree when open vim with a file
autocmd vimenter * NERDTree 
autocmd vimenter * wincmd w
" set hot key for NERDTree
map <C-n> :NERDTreeToggle<CR>  
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" YCM setting
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Nerdcommenter setting
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


" Taglist setting
let Tlist_Auto_Open = 0 "auto open Tlist
let Tlist_Exit_OnlyWindow = 1 "exit Tlist if taglist is the only file
let Tlist_Show_One_File = 1 "only show current file's Tlist
let Tlist_Use_Right_Window = 1
" hotkey for Taglist
map <C-l> :TlistToggle<CR>  

"-- vim latex-suite setting --
"" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" vim-markdown-preview setting
let g:mkdp_path_to_chrome = ""
" path to the chrome or the command to open chrome(or other modern browsers)
" if set, g:mkdp_browserfunc would be ignored

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" callback vim function to open browser, the only param is the url to open

let g:mkdp_auto_start = 0
" set to 1, the vim will open the preview window once enter the markdown buffer

let g:mkdp_auto_open = 0
" set to 1, the vim will auto open preview window when you edit the markdown file

let g:mkdp_auto_close = 1
" set to 1, the vim will auto close current preview window when change from markdown buffer to another buffer

let g:mkdp_refresh_slow = 0
" set to 1, the vim will just refresh markdown when save the buffer or leave from insert mode, default 0 is auto refresh markdown as you edit or move the cursor

let g:mkdp_command_for_global = 0
" set to 1, the MarkdownPreview command can be use for all files, by default it just can be use in markdown file

let g:mkdp_open_to_the_world = 0
" set to 1, preview server available to others in your network by default, the server only listens on localhost (127.0.0.1)

nmap <F8> <Plug>MarkdownPreview    " start markdwon preveiw in normal mode
