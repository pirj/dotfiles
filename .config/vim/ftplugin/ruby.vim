" Simple endwise replacement
inoremap <expr> <CR> match(getline('.'), 'if\\|def\\|case\\|do') >= 0 ? '<CR><CR>end<Esc>-cc' : '<CR>'
" inoremap <expr> <CR> match(getline('.'), '{') >= 0 ? '<CR><CR>}<Esc>-cc' : '<CR>'
