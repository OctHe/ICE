" =====================================================================
" 
" Vim run command file of CIM
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

let g:plugin_manager = 'plug'

let g:enable_text_plugins = [
    \ 'surround',
    \ 'autopair',
    \ 'nerdtree',
    \ 'easymotion',
    \ 'commentary',
    \ 'tagbar', 
    \ 'fzf',
    \ ]

let g:enable_ui_plugins = [
    \ 'airline',
    \ ]

let g:enable_lint_plugins = [
    \ 'ale', 
    \ ]

let g:enable_completion_plugins = [
    \ 'ycm',
    \ 'vimsnippets',
    \ 'ultisnips',
    \ ]

let g:enable_compilation_plugins = [
    \ 'genutils',
    \ 'breakpts',
    \ 'mdview',
    \ ]


let g:enable_vcs_plugins = [
    \ 'fugitive',
    \ 'gitgutter',
    \ ]

call CIM#PluginInstall(
            \ g:enable_text_plugins + 
            \ g:enable_ui_plugins + 
            \ g:enable_lint_plugins + 
            \ g:enable_completion_plugins +
            \ g:enable_compilation_plugins +
            \ g:enable_vcs_plugins
            \ )

" Options {{{1

set ruler		    " show the cursor position 
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

" GUI options
set guioptions=aegrLt

" Use <Space> as the <Leader>
" This command must be before all keymappings
let mapleader = ' '

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" }}}1

" Commends {{{1

" Command to see the difference between the current buffer and the file loaded from.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" CimHelp open the help file at the right side
if !exists(":CimHelp")
    command! -nargs=? -complete=help  CimHelp 
        \ :help <args> | if &filetype == 'help' | wincmd L 
        \ | vertical resize 90 | set number | endif

endif

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

" }}}1

" Keymappings {{{1

" Remap windows keymapping
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" }}}1

" Plugins {{{1

source ~/.vim/config/ui.vimrc
source ~/.vim/config/text.vimrc
source ~/.vim/config/lint.vimrc
source ~/.vim/config/completion.vimrc
source ~/.vim/config/compilation.vimrc

" }}}1

" vim: set sw=4 sts=4 et fdm=marker:
