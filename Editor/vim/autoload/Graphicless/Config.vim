" =====================================================================
" 
"  Configuration for all plugins
"
" =====================================================================

" Text: These plugins are related to the basic edit for text files {{{1

" Surround
function! Graphicless#Config#surround()
endfunction

" Auto-pair
function! Graphicless#Config#autopair()
endfunction

" Nerdcomment: 
function! Graphicless#Config#nerdcomment()
endfunction

function! Graphicless#Config#tcomment()
endfunction

" commentary:
function! Graphicless#Config#commentary()
    xmap <Leader>c  <Plug>Commentary
    nmap <Leader>c  <Plug>Commentary
    omap <Leader>c  <Plug>Commentary
    nmap <Leader>cc <Plug>CommentaryLine
    nmap <Leader>cu <Plug>Commentary<Plug>Commentary
endfunction

" }}}1

" Search: Plugins to search in projects {{{1

" fzf:
function! Graphicless#Config#fzf()
endfunction

" LeaderF: 
function! Graphicless#Config#leaderf()
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

endfunction

function! Graphicless#Config#ctrlp()
endfunction

" Easymotion:
function! Graphicless#Config#easymotion()
    map f <Plug>(easymotion-f)
    map F <Plug>(easymotion-F)
    map t <Plug>(easymotion-t)
    map T <Plug>(easymotion-T)
endfunction

" NERDTree: File explorer.  {{{2
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

function! Graphicless#Config#nerdtree()
    let NERTTreeCaseSensitiveSort = 1
    let NERDTreeWinSize = 35

    " Automatic open NERDTree when open vim and go to the previous window
    autocmd VimEnter *.{py,h,c} NERDTree | wincmd p
    " Close vim if the only window left open is a NERDTree
    autocmd BufEnter * :call s:CloseNERDTree()
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * :call s:PreventReplacingNERDTree()

    " e means explore 
    nnoremap <Leader>e :NERDTreeToggle<CR>  

endfunction
" }}}2

" }}}1

" Lint: Static analysis plugins {{{1
" Vista: 
function! Graphicless#Config#vista()
    let g:vista_sidebar_width = 50

    " t means tag
    nnoremap <Leader>t :Vista!!<CR>  

endfunction

" Tagbar: 
function! Graphicless#Config#tagbar()
    " Automatic open Tagbar when open vim
    autocmd VimEnter *.{py,h,c} Tagbar

    " t means tag
    nnoremap <Leader>t :Tagbar<CR>  

endfunction

" ALE:
function! Graphicless#Config#ale()

    " :ALEInfo can find the linters that are successfully enabled
    let g:aleers = {
    \   'python': ['pyflakes'],
    \}

endfunction

function! Graphicless#Config#neomake()
endfunction

function! Graphicless#Config#vimtable()
endfunction
" }}}1

" Completion: Completion and snippet plugins {{{1
" YCM: a powerful completion plugin based on LSP
function! Graphicless#Config#ycm()

    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0

    " Clear the YCM blacklist, so it works for all files
    let g:ycm_filetype_blacklist = {}

endfunction

" vim-snippets: It saves multiple snippets
function! Graphicless#Config#vimsnippets()
endfunction

" Ultisnips: snippets engine that uses snippet database
" vim-snippets: snippet database
function! Graphicless#Config#ultisnips()

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endfunction

" }}}1

" Runner: These plugins can easily compile and run the code {{{1

" genutils: It gives general functions that some plugins rely on
function! Graphicless#Config#genutils()
endfunction

" asyncrun
function! Graphicless#Config#asyncrun()
endfunction

" vimtex: latex plugin for vim. It relies on texlive
"   sudo apt install texlive-full
" The backward search and forward search requires xdotool according to the
" author
"   sudo apt install xdotool 
function! Graphicless#Config#vimtex()

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

endfunction

" Vim-markdown: It provides better markdown highlight
function! Graphicless#Config#vimmkd()

    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_conceal_code_blocks = 0

endfunction

" Markdown-preview
" If it does not work well, please use :messages in vim to see the output
function! Graphicless#Config#mkdp()
endfunction
" }}}1

" VCS: Version control system {{{1
" fugitive: Provide common git options (diff, status, add, commit, etc)
function! Graphicless#Config#fugitive()

    " g means git
    nnoremap <Leader>gdi :Git diff<CR><C-W>L
    nnoremap <Leader>gs :Git status<CR>

endfunction

" gitgutter: Show diff sign on the left
function! Graphicless#Config#gitgutter()
endfunction
" }}}1

" UI: Colorscheme, status line, indent, and UI-related plugins {{{1
" airline:
function! Graphicless#Config#airline()
    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1
    " Show buffer number so I can quickly pick a buffer
    let g:airline#extensions#tabline#buffer_nr_show = 1

endfunction

function! Graphicless#Config#lightline()
endfunction

function! Graphicless#Config#indentline()
endfunction

function! Graphicless#Config#indentguide()
endfunction

function! Graphicless#Config#whichkey()
    nnoremap <silent> <Leader>      :<c-u>WhichKey '<Leader>'<CR>
endfunction

" rainbow: Rainbow brackets
function! Graphicless#Config#rainbow()
   " Set to 0 if you want to enable it later via :RainbowToggle
   let g:rainbow_active = 1 

endfunction

function! Graphicless#Config#context()
endfunction


" gruvbox: 
function! Graphicless#Config#gruvbox()
endfunction

" colortable:
function! Graphicless#Config#colortable()
endfunction

" }}}1

" vim: set sw=4 sts=4 et fdm=marker:
