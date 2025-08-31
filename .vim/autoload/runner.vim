" =====================================================================
"
" Debugger and runner
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! runner#Floaterm(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vim-floaterm/plugin/floaterm.vim'))
    return
  endif

  nmap <Leader>tb :FloatermPrev<CR>
  nmap <Leader>tn :FloatermNext<CR>
  nmap <Leader>tN :FloatermNew<CR>
  nmap <Leader>tk :FloatermKill<CR>
  nmap <Leader>tt :FloatermToggle<CR>

endfunction

" Debugger with DAP
function! runner#Vimspector(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vimspector/plugin/vimspector.vim'))
    return
  endif

  let g:vimspector_enable_mappings='HUMAN'

endfunction

" vimtex: latex plugin for vim. It relies on texlive
"   sudo apt install texlive-full
" The backward search and forward search requires xdotool according to the
" author
"   sudo apt install xdotool
function! runner#vimtex(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vimtex/plugin/vimtex.vim'))
    return
  endif

  " Plugin indent on follows is necessary for VimTeX to load properly. The "indent" is optional.
  " Note that most plugin managers will do this automatically.

  " Viewer is required  i.e., evince in Ubuntu, okular, or zathura
  " vimtex internally supports forward and backward search
  " Forward search works when type <LocalLeader>lv
  " Backward/Inverse search only works for gvim since it relies on the
  " clientserver feature.
  "   For example, if the viewer is zathura, just open the latex file with
  "   gvim, and compile it with <LocalLeader>ll.
  "   Then, type <CTRL>+<LeftMouse> to use backward search.
  if executable('zathura')
    let g:vimtex_view_method = 'zathura'
  elseif executable('evince')
    let g:vimtex_view_method = 'evince'
  elseif executable('okular')
    let g:vimtex_view_method = 'okular'
  endif

  " VimTeX uses latexmk as the default compiler backend.
  " If you use it, you probably don't need to configure anything.
  " If you want another compiler backend, you can change it as follows.
  " The list of supported backends and further explanation is provided in the documentation, see ':help vimtex-compiler'.
  let g:vimtex_compiler_method = 'latexmk'

  " Project with multiple files.
  "   To support multiple files (with '\input') in a project, user must open the
  "   main file (e.g., main.tex) at first. For more details, please see the help
  "   document with ':h vimtex-multi-file'

  " Most VimTeX mappings rely on localleader and this can be changed with the
  " following line. The default is usually fine and is the symbol "\".
  let maplocalleader = " "


endfunction

" vim: set sw=2 sts=2 et fdm=marker:
