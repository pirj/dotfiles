" Turn on hard mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Auto JSHint on write
autocmd BufWritePost *.js silent! :JSHint<CR>

" Re-set format options as plugins may set it on thier own
autocmd FileType * setlocal formatoptions=t
