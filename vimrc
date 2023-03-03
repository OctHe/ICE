" =====================================================================
" 
" VIM run command file of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
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

call option#options()
call ui#ui()
call adapter#init()
