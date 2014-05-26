" Turn on hard mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Relative line numbers
autocmd BufNewFile,VimEnter * silent! :set relativenumber

" Auto JSHint on write
autocmd BufWritePost *.js silent! :JSHint<CR>
