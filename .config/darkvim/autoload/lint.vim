" =====================================================================
"
" Lint and LSP
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

" Vista: Vista relies on universal-ctags. Please careful to install the
" correct version.
" In openSUSE:
"   sudo zypper install universal-ctags
function! lint#Vista()

  if empty(globpath(&rtp, '/plugin/vista.vim'))
    return
  endif

  let g:vista_sidebar_width = 50

  " s means symbol
  nnoremap <silent> <Leader>s :Vista!!<CR>

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
