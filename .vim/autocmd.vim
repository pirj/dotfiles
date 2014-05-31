" Turn on hard mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Auto JSHint on write
autocmd BufWritePost *.js silent! :JSHint<CR>
