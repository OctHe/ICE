" =====================================================================
" 
" Not only linter
" Configuration of static analysis plugins
"
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
"
" =====================================================================

" Search: Plugins to search in projects {{{1

" fzf:
function! ICE#Config#fzf()
endfunction

" LeaderF: 
function! ICE#Config#leaderf()
if index(g:enable_plugins, 'leaderf') != -1
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

endif
endfunction

" NERDTree: File explore (or call it file searcher)
function! ICE#Config#nerdtree()
    if index(g:enable_plugins, 'nerdtree') != -1
        let NERTTreeCaseSensitiveSort = 1
        let NERDTreeWinSize = 35

        " Automatic open NERDTree when open vim and go to the previous window
        autocmd VimEnter *.{py,h,c} NERDTree | wincmd p
        " Close vim if the only window left open is a NERDTree
        autocmd BufEnter * :call s:CloseNERDTree()
        " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        autocmd BufEnter * :call s:PreventReplacingNERDTree()

        function! s:CloseNERDTree()
            if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
                quit
            endif

        endfunction

        function! s:PreventReplacingNERDTree()
            if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
                let buf=bufnr('%') 
                buffer# 
                execute "normal! \<C-W>w"
                execute 'buffer'.buf
            endif

        endfunction

        " e means explore 
        nnoremap <Leader>e :NERDTreeToggle<CR>  

    endif
endfunction


" }}}1

" Text: These plugins are related to the basic edit for text files {{{1

" Nerdcomment: 
function! ICE#Config#nerdcomment()
endfunction

" commentary:
function! ICE#Config#commentary()
    if index(g:enable_plugins, 'commentary') != -1
      xmap <Leader>c  <Plug>Commentary
      nmap <Leader>c  <Plug>Commentary
      omap <Leader>c  <Plug>Commentary
      nmap <Leader>cc <Plug>CommentaryLine
      nmap <Leader>cu <Plug>Commentary<Plug>Commentary
    endif
endfunction

" Surround
function! ICE#Config#surround()
endfunction

" Auto-pair
function! ICE#Config#autopair()
endfunction

" Easymotion:
function! ICE#Config#easymotion()
    if index(g:enable_plugins, 'easymotion') != -1
        map f <Plug>(easymotion-f)
        map F <Plug>(easymotion-F)
        map t <Plug>(easymotion-t)
        map T <Plug>(easymotion-T)
    endif
endfunction
" }}}1

" Lint: Static analysis plugins {{{1
" Vista: 
function! ICE#Config#vista()
    if isdirectory(g:plugin_dir..'vista')
        let g:vista_sidebar_width = 50

        " t means tag
        nnoremap <Leader>t :Vista!!<CR>  

    endif

endfunction

" Tagbar: 
function! ICE#Config#tagbar()
    if index(g:enable_plugins, 'tagbar') != -1
        " Automatic open Tagbar when open vim
        autocmd VimEnter *.{py,h,c} Tagbar

        " t means tag
        nnoremap <Leader>t :Tagbar<CR>  

    endif

endfunction

" ALE:
function! ICE#Config#ale()
    if index(g:enable_plugins, 'ale') != -1

        " :ALEInfo can find the linters that are successfully enabled
        let g:aleers = {
        \   'python': ['pyflakes'],
        \}

    endif
endfunction

" }}}1

" Completion: Completion and snippet plugins {{{1
" YCM: a powerful completion plugin based on LSP
function! ICE#Config#ycm()
if index(g:enable_plugins, 'ycm') != -1

    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0

    " Clear the YCM blacklist, so it works for all files
    let g:ycm_filetype_blacklist = {}

endif
endfunction

" Ultisnips: snippets engine that uses snippet database
" vim-snippets: snippet database
function! ICE#Config#ultisnips()
if index(g:enable_plugins, 'ultisnips') != -1

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endif
endfunction

" vim-snippets: It saves multiple snippets
function! ICE#Config#vimsnippets()
endfunction
" }}}1

" Compiler: These plugins can easily compile, debug, compile, and run the code {{{1

" asyncrun
function! ICE#Config#asyncrun()
endfunction

" vimtex: latex plugin for vim. It relies on texlive
"   sudo apt install texlive-full
" The backward search and forward search requires xdotool according to the
" author
"   sudo apt install xdotool 
function! ICE#Config#vimtex()

    if index(g:enable_plugins, 'vimtex') != -1

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
        let g:vimtex_view_method = 'zathura'

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

    endif
endfunction

function! ICE#Config#mdview()
endfunction
" }}}1

" VCS: Version control system {{{1
" fugitive: provide common git options (diff, status, add, commit, etc)
function! ICE#Config#fugitive()
if index(g:enable_plugins, 'fugitive') != -1

    " g means git
    nnoremap <Leader>gdi :Git diff<CR><C-W>L
    nnoremap <Leader>gs :Git status<CR>

endif

endfunction

" gitgutter: shows diff sign on the left
function! ICE#Config#gitgutter()
if index(g:enable_plugins, 'fugitive') != -1

    " g means git
    nnoremap <Leader>gd :GitGutterDiffOrig<CR>

endif

endfunction
" }}}1

" UI: Colorscheme, status line, and UI-related plugins {{{1
" airline:
function! ICE#Config#airline()
    if index(g:enable_plugins, 'airline') != -1
        " Enhanced tabline
        let g:airline#extensions#tabline#enabled = 1
        " Show buffer number so I can quickly pick a buffer
        let g:airline#extensions#tabline#buffer_nr_show = 1
    endif
endfunction

function! ICE#Config#lightline()
endfunction

function! ICE#Config#context()
endfunction

" rawnbow:
function! ICE#Config#rainbow()
    if index(g:enable_plugins, 'rainbow') != -1
       " set to 0 if you want to enable it later via :RainbowToggle
       let g:rainbow_active = 1 
    endif
endfunction

" gruvbox: 
function! ICE#Config#gruvbox()

endfunction

" }}}1
