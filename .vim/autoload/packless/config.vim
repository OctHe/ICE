" =====================================================================
" 
"  Configuration for plugins
"
" =====================================================================

" Navigation 
" {{{1

" starsearch: Enhanced star keymapping. Avoid jumping to next
function! packless#config#starsearch()
endfunction

" fzf:
" TODO: use system-wide fzf
function! packless#config#fzf()
endfunction

" LeaderF: 
function! packless#config#leaderf()
    let g:Lf_WindowPosition = 'popup'

    " Vista.vim:
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    let g:Lf_ShortcutF = '<leader>ff'
    let g:Lf_ShortcutB = '<leader>fb'
endfunction

function! packless#config#ctrlp()
endfunction

" Sneak: Jump with 2 chars.
function! packless#config#sneak()
    " Improved f/F/t/T
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endfunction

" It seams easymotion has not been meantained.
" Easymotion: The official repo is in easymotion/vim-easymotion.
" timsu92's version fix a bug about easymotion-w/W in fold codes.
function! packless#config#easymotion()
    noremap f <Plug>(easymotion-f)
    noremap F <Plug>(easymotion-F)
    noremap t <Plug>(easymotion-t)
    noremap T <Plug>(easymotion-T)
    noremap w <Plug>(easymotion-w)
    noremap W <Plug>(easymotion-W)
    noremap e <Plug>(easymotion-e)
    noremap E <Plug>(easymotion-E)
    noremap b <Plug>(easymotion-b)
    noremap B <Plug>(easymotion-B)
    noremap ge <Plug>(easymotion-ge)
    noremap gE <Plug>(easymotion-gE)
endfunction

" Vim-tmux-navigator: It requires configuration in tmux
" TODO: Use the same file for both vim and tmux
function! packless#config#tmux_navi()
endfunction

" NERDTree: File explorer.  {{{2
function! s:PreventReplacingNERDTree()

endfunction

function! packless#config#nerdtree()
    let NERTTreeCaseSensitiveSort = 1
    let NERDTreeWinSize = 35

    augroup NERDTree
        au!

        " Close vim if the only window left open is a NERDTree
        autocmd BufEnter * 
                    \ if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()
                    \ |   quit
                    \ | endif

        " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        autocmd BufEnter *
                    \ if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
                    \ |   let buf=bufnr('%') 
                    \ |   buffer# 
                    \ |   execute "normal! \<C-W>w"
                    \ |   execute 'buffer'.buf
                    \ | endif
    augroup END

    " e means explore 
    nnoremap <silent> <Leader>e :NERDTreeToggle<CR>  

endfunction
" }}}2

" }}}1

" Lint
" {{{1
" Vista: Vista relies on universal-ctags. Please careful to install the
" correct version. 
" In openSUSE:
"   sudo zypper install universal-ctags 
function! packless#config#vista()
    let g:vista_sidebar_width = 50

    " t means tag
    nnoremap <silent> <Leader>s :Vista!!<CR>  

endfunction

" Tagbar: 
function! packless#config#tagbar()
    " Automatic open Tagbar when open vim
    autocmd VimEnter *.{py,h,c} Tagbar

    " t means tag
    nnoremap <silent> <Leader>s :Tagbar<CR>  

endfunction

" Auto generate tags
function! packless#config#gutentags()
    " Use existing tag file if it exists
    let g:gutentags_ctags_auto_set_tags = 0

endfunction

" CCTree geenrates a call tree based on cscope
function! packless#config#cctree()
endfunction

function! packless#config#neomake()
endfunction

" ALE:
function! packless#config#ale()

    " Most Linux distributions use gcc by default, so use gcc at first
    if !empty('gcc')
        let g:ale_c_cc_executable = 'gcc'
        let g:ale_cpp_cc_executable = 'gcc'
    endif

endfunction

function! packless#config#neomake()
endfunction

function! packless#config#vimtable()
endfunction

function! packless#config#splitjoin()
endfunction
" }}}1

" Completion
" {{{1

" Surround
function! packless#config#surround()
endfunction

" Auto-pair
function! packless#config#autopair()
endfunction

" vim-repeat: Plugin repeat support
function! packless#config#repeat()
endfunction

" Nerdcomment: 
function! packless#config#nerdcomment()
endfunction

" commentary:
function! packless#config#commentary()
    xmap <Leader>c  <Plug>Commentary
    vmap <Leader>c  <Plug>Commentary
    omap <Leader>c  <Plug>Commentary
    nmap <Leader>cc <Plug>CommentaryLine
    nmap <Leader>cu <Plug>Commentary<Plug>Commentary
endfunction

" YCM: a powerful completion plugin based on LSP It relies on cmake, 
" make, g++, python3-dev and LSP. YCM does not use LSP from the system. 
" It downloads them by itself.
" Install the prerequisites in Debian with
"   sudo apt install cmake make g++ python3-dev
" In openSUSE with
"   sudo zypper install cmake make g++ python3-deval
function! packless#config#ycm()

    let g:ycm_confirm_extra_conf = 0
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

    let g:ycm_show_diagnostics_ui = 0

    " Clear the YCM blacklist, so it works for all files
    let g:ycm_filetype_blacklist = {}

endfunction

" vim-snippets: It saves multiple snippets
function! packless#config#vimsnippets()
endfunction

" Ultisnips: snippets engine that uses snippet database
" vim-snippets: snippet database
function! packless#config#ultisnips()

    " Trigger configuration. Change this to something other than <tab> if use one 
    " of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
    let g:UltiSnipsExpandTrigger="<CR>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

endfunction

" }}}1

" Runner
" {{{1

" genutils: It gives general functions that some plugins rely on
function! packless#config#genutils()
endfunction

" floaterm:
function! packless#config#floaterm()
    nmap <Leader>tb :FloatermPrev<CR>
    nmap <Leader>tn :FloatermNext<CR>
    nmap <Leader>tN :FloatermNew<CR>
    nmap <Leader>tk :FloatermKill<CR>
    nmap <Leader>tt :FloatermToggle<CR>
endfunction

" Debugger with DAP
function! packless#config#vimspector()

    let g:vimspector_enable_mappings='HUMAN'

endfunction

" asyncrun
function! packless#config#asyncrun()
endfunction

function! packless#config#dispatch()
endfunction

" vimtex: latex plugin for vim. It relies on texlive
"   sudo apt install texlive-full
" The backward search and forward search requires xdotool according to the
" author
"   sudo apt install xdotool 
function! packless#config#vimtex()

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

" csv.vim:
function! packless#config#csv()
endfunction
" }}}1

" VCS
" {{{1
" fugitive: Provide common git options (diff, status, add, commit, etc)
function! packless#config#fugitive()

    nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
    nnoremap <silent> <Leader>gs :Git status<CR>

endfunction

" gitgutter: Show diff in the column sign (See :help signcolumn)
function! packless#config#gitgutter()
endfunction
" }}}1

" UI: Colorscheme, status line, indent. Let Vim looks better
" {{{1
" airline:
function! packless#config#airline()
    " Enhanced tabline
    let g:airline#extensions#tabline#enabled = 1
    " Show buffer number so I can quickly pick a buffer
    let g:airline#extensions#tabline#buffer_nr_show = 1

endfunction

function! packless#config#lightline()
endfunction

function! packless#config#indentline()
endfunction

function! packless#config#indentguide()
endfunction

function! packless#config#whichkey()
    let g:which_key_map = {}
    let g:which_key_map.g = {
                            \ 'name': '+git',
                            \ 'd': '+diff',
                            \ }
    let g:which_key_map.c = {
                            \ 'name': '+comment',
                            \ }
    let g:which_key_map.f = {
                            \ 'name': '+find',
                            \ }
    let g:which_key_map.s = {
                            \ 'name': '+symbol',
                            \ }
    call which_key#register('<Space>', "g:which_key_map")

    nnoremap <silent> <Leader> :<c-u>WhichKey '<Leader>'<CR>
    vnoremap <silent> <Leader> :<c-u>WhichKeyVisual '<Leader>'<CR>
    nnoremap <silent> <LocalLeader> :<c-u>WhichKey '<LocalLeader>'<CR>
    vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '<LocalLeader>'<CR>

endfunction

" rainbow: Rainbow brackets
function! packless#config#rainbow()
   " Set to 0 to enable it later via :RainbowToggle
   let g:rainbow_active = 1 

endfunction

" Show the function, for-loop and condition.
" It will stuck vim, so don't enable it automatically
function! packless#config#context()
endfunction

function! packless#config#startify()
endfunction

" gruvbox: 
function! packless#config#gruvbox()
endfunction

" colortable:
function! packless#config#colortable()
endfunction

" }}}1

" vim: set sw=4 sts=4 et fdm=marker:
