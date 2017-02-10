" Auto JSHint on write
autocmd BufWritePost *.js silent! :JSHint<CR>

" Re-set format options as plugins may set it on thier own
autocmd FileType * setlocal formatoptions=tj

" Go to last position of opened files. Taken from :help last-position-jump.
autocmd BufReadPost * execute "normal! g`\""

" But not for Git commits, go to beginning of the file.
autocmd BufReadPost COMMIT_EDITMSG normal! gg

" Open QuickFix/Location lists on search
autocmd QuickFixCmdPost l* lwindow
autocmd QuickFixCmdPost [^l]* cwindow

" Automatically fold comments on Ruby file open
autocmd FileType ruby set foldmethod=expr | set foldexpr=getline(v:lnum)=~'^\\s*#'

" Redraw after grep
autocmd ShellCmdPost * redraw!
