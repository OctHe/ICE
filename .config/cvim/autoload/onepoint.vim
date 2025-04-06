" =====================================================================
" 
" Plugin management
"
" Author: OctHe
" Copyright (C): 2023-2024
" 
" =====================================================================

function! onepoint#PluginConfig()
    " Load plugins' config
    " Navigation 
    " {{{1

    " starsearch: Enhanced star keymapping. Avoid jumping to next

    " fzf:

    " LeaderF: Asynchronous fuzzy finder with popup window
    if !empty(globpath(&rtp, '/plugin/leaderf.vim'))
        let g:Lf_WindowPosition = 'popup'

        " Vista.vim:
        function! NearestMethodOrFunction() abort
          return get(b:, 'vista_nearest_method_or_function', '')
        endfunction

        set statusline+=%{NearestMethodOrFunction()}

        let g:Lf_ShortcutF = '<leader>ff'
        let g:Lf_ShortcutB = '<leader>fb'
    endif

    " CtrlP:

    " Sneak: Jump with 2 chars.
    if !empty(globpath(&rtp, '/plugin/sneak.vim'))
        " Improved f/F/t/T
        map f <Plug>Sneak_f
        map F <Plug>Sneak_F
        map t <Plug>Sneak_t
        map T <Plug>Sneak_T
    endif

    " easymotion:

    " Vim-tmux-navigator: It requires configuration in tmux
    " TODO: Use the same file for both vim and tmux

    " NERDTree: File explorer. 
    if !empty(globpath(&rtp, '/plugin/NERD_tree.vim'))
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
    endif

    " }}}1

    " Lint
    " {{{1
    " Vista: Vista relies on universal-ctags. Please careful to install the
    " correct version. 
    " In openSUSE:
    "   sudo zypper install universal-ctags 
    if !empty(globpath(&rtp, '/plugin/vista.vim'))
        let g:vista_sidebar_width = 50

        " t means tag
        nnoremap <silent> <Leader>s :Vista!!<CR>  

    endif

    " Tagbar: 
    if !empty(globpath(&rtp, '/plugin/tagbar.vim'))
        " Automatic open Tagbar when open vim
        autocmd VimEnter *.{py,h,c} Tagbar

        " t means tag
        nnoremap <silent> <Leader>s :Tagbar<CR>  
    endif

    " Auto generate tags
    if !empty(globpath(&rtp, '/plugin/gutentags.vim'))
        " Use existing tag file if it exists
        let g:gutentags_ctags_auto_set_tags = 0

    endif

    " CCTree geenrates a call tree based on cscope

    " ALE:
    if !empty(globpath(&rtp, '/plugin/ale.vim'))

        " Most Linux distributions use gcc by default, so use gcc at first
        if !empty('gcc')
            let g:ale_c_cc_executable = 'gcc'
            let g:ale_cpp_cc_executable = 'gcc'
        endif

    endif

    " neomake

    " splitjoin

    " }}}1

    " Completion
    " {{{1

    " Surround

    " Auto-pair

    " vim-repeat: Plugin repeat support

    " Nerdcomment: 

    " commentary:
    if !empty(globpath(&rtp, '/plugin/commentary.vim'))
        xmap <Leader>c  <Plug>Commentary
        vmap <Leader>c  <Plug>Commentary
        omap <Leader>c  <Plug>Commentary
        nmap <Leader>cc <Plug>CommentaryLine
        nmap <Leader>cu <Plug>Commentary<Plug>Commentary
    endif

    " YCM: a powerful completion plugin based on LSP. It relies on cmake, 
    " make, g++, python3-dev and LSP. YCM does not use system-wide LSP.
    " Install the prerequisites in Debian with
    "   sudo apt install cmake make g++ python3-dev
    " In openSUSE with
    "   sudo zypper install cmake make g++ python3-deval
    if !empty(globpath(&rtp, '/plugin/youcompleteme.vim'))

        let g:ycm_confirm_extra_conf = 0
        let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

        let g:ycm_show_diagnostics_ui = 0

        " Clear the YCM blacklist, so it works for all files
        let g:ycm_filetype_blacklist = {}

    endif

    " vim-snippets: It saves multiple snippets

    " Ultisnips: snippets engine that uses snippet database
    " vim-snippets: snippet database
    if !empty(globpath(&rtp, '/plugin/UltiSnips.vim'))

        " Trigger configuration. Change this to something other than <tab> if use one 
        " of the following:
        " - https://github.com/Valloric/YouCompleteMe
        " - https://github.com/nvim-lua/completion-nvim
        let g:UltiSnipsExpandTrigger="<CR>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"

    endif

    " vim-auto-popemenu
    if !empty(globpath(&rtp, '/plugin/apc.vim'))
        " enable this plugin for filetypes, '*' for all files.
        let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

        " source for dictionary, current or other loaded buffers, see ':help cpt'
        set cpt=.,k,w,b

        " don't select the first item.
        set completeopt=menu,menuone,noselect

        " suppress annoy messages.
        set shortmess+=c
    endif

    " }}}1

    " Runner
    " {{{1

    " genutils: It gives general functions that some plugins rely on

    " floaterm:
    if !empty(globpath(&rtp, '/plugin/floaterm.vim'))
        nmap <Leader>tb :FloatermPrev<CR>
        nmap <Leader>tn :FloatermNext<CR>
        nmap <Leader>tN :FloatermNew<CR>
        nmap <Leader>tk :FloatermKill<CR>
        nmap <Leader>tt :FloatermToggle<CR>
    endif

    " Debugger with DAP
    if !empty(globpath(&rtp, '/plugin/vimspector.vim'))

        let g:vimspector_enable_mappings='HUMAN'

    endif

    " asyncrun

    " dispatch

    " vimtex: latex plugin for vim. It relies on texlive
    "   sudo apt install texlive-full
    " The backward search and forward search requires xdotool according to the
    " author
    "   sudo apt install xdotool 
    if !empty(globpath(&rtp, '/plugin/vimtex.vim'))

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

    " csv.vim:

    " }}}1

    " VCS
    " {{{1
    " fugitive: Provide common git options (diff, status, add, commit, etc)
    if !empty(globpath(&rtp, '/plugin/fugitive.vim'))

        nnoremap <silent> <Leader>gd :Git diff<CR><C-W>L
        nnoremap <silent> <Leader>gs :Git status<CR>

    endif

    " gitgutter: Show diff in the column sign (See :help signcolumn)

    " }}}1

    " UI: Colorscheme, status line, indent. Let Vim looks better
    " {{{1
    " airline:
    if !empty(globpath(&rtp, '/plugin/airline.vim'))
        " Enhanced tabline
        let g:airline#extensions#tabline#enabled = 1
        " Show buffer number so I can quickly pick a buffer
        let g:airline#extensions#tabline#buffer_nr_show = 1

    endif

    " Lightline

    " indentline

    " indentguide

    " Whichkey: 
    if !empty(globpath(&rtp, '/plugin/which_key.vim'))
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

    endif

    " rainbow: Rainbow brackets
    if !empty(globpath(&rtp, '/plugin/rainbow_main.vim'))
        " This variable must be defined to use rainbow. 
        " Set to 0 to enable it later via :RainbowToggle
        let g:rainbow_active = 1 
    endif


    " Context: Show the function, for-loop and condition.
    " It will stuck vim, so don't enable it automatically

    " Startify

    " gruvbox: 

    " }}}1

endfunction

" vim: set sw=4 sts=4 et fdm=marker:
