" Simple endwise replacement
inoremap <buffer> <expr> <CR> match(getline('.'), 'class\\|if\\|def\\|case\\|do') >= 0 ? '<CR><CR>end<Esc>-cc' : '<CR>'
" inoremap <buffer> <expr> <CR> match(getline('.'), '{') >= 0 ? '<CR><CR>}<Esc>-cc' : '<CR>'
