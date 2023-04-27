" =====================================================================
" 
" Configuration of version control plugins
"
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

" fugitive: provide common git options (diff, status, add, commit, etc)
if index(g:enable_plugins, 'fugitive') != -1

    " g means git
    nnoremap <Leader>gdi :Git diff<CR><C-W>L
    nnoremap <Leader>gs :Git status<CR>

endif


" gitgutter: shows diff sign on the left
if index(g:enable_plugins, 'fugitive') != -1

    " g means git
    nnoremap <Leader>gd :GitGutterDiffOrig<CR>

endif
