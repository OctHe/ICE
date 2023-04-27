" =====================================================================
" 
" Configuration of search-related plugins 
" Plugins to search files, directories, buffers, etc.
" 
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

" LeaderF: 
if index(g:enable_plugins, 'leaderf') != -1
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

endif

