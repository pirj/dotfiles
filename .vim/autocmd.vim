" Turn on hard mode
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Relative line numbers
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber
