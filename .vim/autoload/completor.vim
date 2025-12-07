" =====================================================================
"
" Autocompletion
"
" Author: OctHe
" Copyright (C)
"
" =====================================================================

function! completor#NerdCommenter(plugin_dir)

  if empty(globpath(a:plugin_dir, 'nerdtree/plugin/nerdcommenter.vim'))
    return
  endif

  let g:NERDSpaceDelims = 1
  let g:NERDRemoveExtraSpaces = 1

endfunction

function! completor#Sandwich(plugin_dir)

  if empty(globpath(a:plugin_dir, 'vim-sandwich/plugin/sandwich.vim'))
    return
  endif

  " Use the vim-surround mapping, since the default mapping conflicts with
  " vim-sneak.
  runtime macros/sandwich/keymap/surround.vim
  let g:sandwich#recipes += [
  \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
  \
  \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
  \
  \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
  \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
  \
  \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['{']},
  \
  \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['[']},
  \
  \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
  \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
  \    'action': ['delete'], 'input': ['(']},
  \ ]

  " Textobjects to select a text surrounded by braket or same characters user input.
  xmap is <Plug>(textobj-sandwich-query-i)
  xmap as <Plug>(textobj-sandwich-query-a)
  omap is <Plug>(textobj-sandwich-query-i)
  omap as <Plug>(textobj-sandwich-query-a)

  " Textobjects to select the nearest surrounded text automatically.
  xmap iss <Plug>(textobj-sandwich-auto-i)
  xmap ass <Plug>(textobj-sandwich-auto-a)
  omap iss <Plug>(textobj-sandwich-auto-i)
  omap ass <Plug>(textobj-sandwich-auto-a)

  " Textobjects to select a text surrounded by same characters user
  xmap im <Plug>(textobj-sandwich-literal-query-i)
  xmap am <Plug>(textobj-sandwich-literal-query-a)
  omap im <Plug>(textobj-sandwich-literal-query-i)
  omap am <Plug>(textobj-sandwich-literal-query-a)

endfunction

function! completor#UltiSnips(plugin_dir)

  if empty(globpath(a:plugin_dir, 'ultisnips/plugin/UltiSnips.vim'))
    return
  endif

  " Trigger configuration. Change this to something other than <tab> if use one
  " of the following:
  " - https://github.com/Valloric/YouCompleteMe
  " - https://github.com/nvim-lua/completion-nvim
  let g:UltiSnipsExpandTrigger="<CR>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

endfunction

function! completor#YCM(plugin_dir)

  if empty(globpath(a:plugin_dir, 'YouCompleteMe/plugin/youcompleteme.vim'))
    return
  endif

  let g:ycm_show_diagnostics_ui = 0

  " Clear the YCM blacklist, so it works for all files
  let g:ycm_filetype_blacklist = {}

endfunction

" vim: set sw=2 sts=2 et fdm=marker:
