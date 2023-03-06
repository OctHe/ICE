" =====================================================================
" 
" Theme adapter of CIM
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! adapter#theme#init()

    " Color table: Display the color table in terminal with command
    let g:adapter#theme = [
        \ ['guns/xterm-color-table.vim',    {}],
        \ ]

    if exists( 'g:adapter#theme#statusline' ) && 
            \g:adapter#theme#statusline ==# 'lightline'
        " lightline: A light and configurable statusline/tabline plugin for Vim 
        call add(g:adapter#theme, ['itchyny/lightline.vim',     {}])
    else
        " vim-airline: Lean and mean status bar
        call add(g:adapter#theme, ['vim-airline/vim-airline',   {}])
    endif

    if exists( 'g:adapter#theme#window' ) && 
            \g:adapter#theme#window ==# 'vimux'
        " vimux: Interact with tmux from vim
        call add(g:adapter#theme, ['preservim/vimux',   {}])
    endif

endfunction

function! adapter#theme#options()

    " Color schemes: desert, peachpuff, quiet, slate
    colorscheme desert

    " Dialog
    highlight PMenu ctermfg=56 ctermbg=white guifg=darkblue guibg=darkgrey
    highlight PMenuSel ctermfg=white ctermbg=56 guifg=darkgreen guibg=lightblue

    " Spell check
    set spell
    " Clear the default highlight of the Spell check
    highlight clear SpellBad
    " Set the highlight style as underline
    highlight SpellBad cterm=underline  

    " airline:
    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1

endfunction
