" =====================================================================
" 
" Non-plugin configurations
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! CIM#options()
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

    " Color schemes: desert, peachpuff, quiet, slate
    colorscheme desert

    " GUI options
    set guioptions=aegrLt

    " Dialog
    highlight PMenu guifg=darkblue guibg=darkgrey
    highlight PMenuSel guifg=darkgreen guibg=lightblue

    " Spell check
    set spell
    " Clear the default highlight of the Spell check
    highlight clear SpellBad
    " Set the highlight style as underline
    highlight SpellBad cterm=underline  

    " Dialog
    highlight PMenu ctermfg=56 ctermbg=white
    highlight PMenuSel ctermfg=white ctermbg=56
    " Vertical split: 
    " highlight VertSplit ctermfg=234 ctermbg=darkgrey

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

    " CIMHelp open the help file at the right side
    command! -nargs=?  CimHelp :help <args> | if &filetype == 'help' | wincmd L | vertical resize 90 | set number | endif
endfunction

function! CIM#command()
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

    " CIMHelp open the help file at the right side
    command! -nargs=?  CimHelp :help <args> | if &filetype == 'help' | wincmd L | vertical resize 90 | set number | endif
endfunction

function! CIM#theme()
    " Dialog
    highlight PMenu guifg=darkblue guibg=darkgrey
    highlight PMenuSel guifg=darkgreen guibg=lightblue

    " Spell check
    set spell
    " Clear the default highlight of the Spell check
    highlight clear SpellBad
    " Set the highlight style as underline
    highlight SpellBad cterm=underline  

    " Dialog
    highlight PMenu ctermfg=56 ctermbg=white
    highlight PMenuSel ctermfg=white ctermbg=56

endfunction
