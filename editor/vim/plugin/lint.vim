" =====================================================================
" 
" Not only linter
" Configuration of static analysis plugins
"
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
"
" =====================================================================

" Vista: 
if index(g:enable_plugins, 'vista') != -1
    let g:vista_sidebar_width = 50

    " t means tag
    nnoremap <Leader>t :Vista!!<CR>  

endif

" Tagbar: 
if index(g:enable_plugins, 'tagbar') != -1
    " Automatic open Tagbar when open vim
    autocmd VimEnter *.{py,h,c} Tagbar

    " t means tag
    nnoremap <Leader>t :Tagbar<CR>  

endif

" Ale:
if index(g:enable_plugins, 'ale') != -1

    " :ALEInfo can find the linters that are successfully enabled
    let g:aleers = {
    \   'python': ['pyflakes'],
    \}

endif
