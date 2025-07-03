" =====================================================================
" 
" Autocompletion
"
" Author: OctHe
" Copyright (C)
" 
" =====================================================================

function! completer#Nerdcommenter()

    if empty(globpath(&rtp, '/plugin/nerdcommenter.vim'))
        return
    endif

    let g:NERDSpaceDelims = 1
    let g:NERDRemoveExtraSpaces = 1

endfunction

function! completer#UltiSnips()

    if empty(globpath(&rtp, '/plugin/UltiSnips.vim'))
        return
    endif

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endfunction

function! completer#YCM()

  if empty(globpath(&rtp, '/plugin/youcompleteme.vim'))
    return
  endif

  let g:ycm_confirm_extra_conf = 0
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

  let g:ycm_show_diagnostics_ui = 0

  " Clear the YCM blacklist, so it works for all files
  let g:ycm_filetype_blacklist = {}

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
