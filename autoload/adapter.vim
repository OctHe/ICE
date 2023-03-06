" =====================================================================
" 
" Adapters initialization
" Author: Shiyue He (hsy1995313@gmail.com)
" Copyright (C): 2023
" 
" =====================================================================

function! adapter#init()

    " Init adapters
    call adapter#theme#init()
    call adapter#edit#init()
    call adapter#completion#init()

    " Install vim-plug if not found
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Specify a directory for plugins
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')
    
    " Register vim-plug as a plugin to get the help doc.
    " Note that vim-plug (the plug.vim file) in this file is not working.
    Plug 'junegunn/vim-plug'

    " =========== Theme ==========
    
    for plugins in g:adapter#theme
        Plug plugins[0], plugins[1]
    endfor

    " ============ Edit ==========

    for plugins in g:adapter#edit
        Plug plugins[0], plugins[1]
    endfor

    " ========== Lint =========== 

    " ALE: Asynchronous Lint Engine
    " ALE works as an LSP client, so the OS must install the corresponding language
    " servers.
    " Recommendation: 
    "     pyflakes: pip3/pip install pyflakes
    "     clangd: 'sudo apt install clangd' in ubuntu
    " clangd lSP requires bear to generate compile_commands.json for make-based
    " projects
    "     sudo apt install bear 
    Plug 'dense-analysis/ale'

    " ========== Completion ========== 
    
    for plugins in g:adapter#completion
        Plug plugins[0], plugins[1]
    endfor

    " ========== Compile ====== 

    " vim-dispatch: Asynchronous build and test dispatcher
    " Plug 'tpope/vim-dispatch' 

    " vimtex:
    " Requirement: PDF reader
    "   i.e., zatlura
    Plug 'lervag/vimtex', {'for': ['tex', 'bib']}

    " ========== Debug  =========== 
    
    " Markdown-preview:
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}

    " Initialize plugin system
    call plug#end()


    " ============================
    " Markdown-preview.nvim settings
    " Update: 2021.11.28
    " ============================
    " set to 1, nvim will open the preview window after entering the markdown buffer
    " default: 0
    let g:mkdp_auto_start = 0

    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    " default: 1
    let g:mkdp_auto_close = 1

    " set to 1, the vim will refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    " default: 0
    let g:mkdp_refresh_slow = 0

    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it can be use in markdown file
    " default: 0
    let g:mkdp_command_for_global = 0

    " set to 1, preview server available to others in your network
    " by default, the server listens on localhost (127.0.0.1)
    " default: 0
    let g:mkdp_open_to_the_world = 0

    " use custom IP to open preview page
    " useful when you work in remote vim and preview on local browser
    " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
    " default empty
    let g:mkdp_open_ip = ''

    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = ''

    " set to 1, echo preview page url in command line when open preview page
    " default is 0
    let g:mkdp_echo_preview_url = 0

    " a custom vim function name to open preview page
    " this function will receive url as param
    " default is empty
    let g:mkdp_browserfunc = ''

    " options for markdown render
    " mkit: markdown-it options for render
    " katex: katex options for math
    " uml: markdown-it-plantuml options
    " maid: mermaid options
    " disable_sync_scroll: if disable sync scroll, default 0
    " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    "   middle: mean the cursor position alway show at the middle of the preview page
    "   top: mean the vim top viewport alway show at the top of the preview page
    "   relative: mean the cursor position alway show at the relative positon of the preview page
    " hide_yaml_meta: if hide yaml metadata, default is 1
    " sequence_diagrams: js-sequence-diagrams options
    " content_editable: if enable content editable for preview page, default: v:false
    " disable_filename: if disable filename header for preview page, default: 0
    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0
        \ }

    " use a custom markdown style must be absolute path
    " like '/Users/username/markdown.css' or expand('~/markdown.css')
    let g:mkdp_markdown_css = ''

    " use a custom highlight style must absolute path
    " like '/Users/username/highlight.css' or expand('~/highlight.css')
    let g:mkdp_highlight_css = ''

    " use a custom port to start server or random for empty
    let g:mkdp_port = ''

    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'

    " recognized filetypes
    " these filetypes will have MarkdownPreview... commands
    let g:mkdp_filetypes = ['markdown']


    " ============================
    " ale settings
    " Update: 2023.03.04
    " ============================
    " :ALEInfo can find the linters that are successfully enabled
    let g:ale_linters = {
    \   'python': ['pyflakes'],
    \}


    " ============================
    " vimtex settings
    " Update: 2022.01.19
    " ============================
    " The follows is necessary for VimTeX to load properly. The "indent" is optional.
    " Note that most plugin managers will do this automatically.
    " filetype plugin indent on

    " This enables Vim's and neovim's syntax-related features. Without this, some
    " VimTeX features will not work (see ":help vimtex-requirements" for more
    " info).
    syntax enable

    " Viewer options
    let g:vimtex_view_method = 'zathura'

    " VimTeX uses latexmk as the default compiler backend. If you use it, which is
    " strongly recommended, you probably don't need to configure anything. If you
    " want another compiler backend, you can change it as follows. The list of
    " supported backends and further explanation is provided in the documentation,
    " see ":help vimtex-compiler".
    let g:vimtex_compiler_method = 'latexmk'

    " Most VimTeX mappings rely on localleader and this can be changed with the
    " following line. The default is usually fine and is the symbol "\".
    let maplocalleader = "\\"

    " Project with multiple files.
    "   To support multiple files (with '\input') in a project, user must open the 
    "   main file (e.g., main.tex) at first. For more details, please see the help
    "   document with ':h vimtex-multi-file'

endfunction
