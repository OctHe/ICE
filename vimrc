" =====================================================================
" 
" VIM run command file of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" It includes options, commands, keymappings.
" 
" =====================================================================
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

let g:enable_text_plugins = [
    \ 'surround',
    \ 'autopair',
    \ 'nerdtree',
    \ 'commentary',
    \ 'tagbar', 
    \ 'fzf',
    \ ]

let g:enable_theme_plugins = [
    \ 'airline',
    \ 'vimux',
    \ 'colortable',
    \ ]

let g:enable_lint_plugins = [
    \ 'ale', 
    \ ]

let g:enable_completion_plugins = [
    \ 'vimsnippets', 
    \ 'ultisnips', 
    \ ]

let g:enable_compilation_plugins = [
    \ 'mdview',
    \ ]


call CIM#PluginInstall(
            \ g:enable_text_plugins + 
            \ g:enable_theme_plugins + 
            \ g:enable_lint_plugins + 
            \ g:enable_completion_plugins +
            \ g:enable_compilation_plugins
            \ )

" ---------------------------------------------------------------------
"
" Options
"
" ---------------------------------------------------------------------
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
set incsearch       " Show the pattern while typing
set mouse=a         " Enable mouse in all mode
set smartindent     " Do smart autoindenting
set scrolloff=5     " Show a few lines around the cursor

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Show @@@ in the last line if it is truncated.
set display=truncate

" GUI options
set guioptions=aegrLt

" Vertical split: 
" highlight VertSplit ctermfg=234 ctermbg=darkgrey

" Highlight column
" set colorcolumn=80
" highlight ColorColumn ctermbg=6

" plugins options
source ~/.vim/config/theme.vimrc
source ~/.vim/config/text.vimrc
source ~/.vim/config/lint.vimrc
source ~/.vim/config/completion.vimrc
source ~/.vim/config/compilation.vimrc

" ---------------------------------------------------------------------
"
" Commands
"
" ---------------------------------------------------------------------

" Command to see the difference between the current buffer and the file loaded from.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" CimHelp open the help file at the right side
command! -nargs=?  CimHelp :help <args> | if &filetype == 'help' | wincmd L | vertical resize 90 | set number | endif

augroup Cim
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

" ---------------------------------------------------------------------
"
" Keymappings
"
" ---------------------------------------------------------------------
" Remap windows keymapping
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

