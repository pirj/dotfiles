setlocal cursorline
highlight CursorLine ctermbg=23

nnoremap <buffer> gj ddp
nnoremap <buffer> gk ddkP

xnoremap <buffer> gj dpgvo
xnoremap <buffer> gk dkPgvo

" Nvim's own ftplugin/gitrebase.vim defines :Pick, :Reword, :Edit, :Squash,
" :Fixup and :Drop. They take a range and keep the cursor where it is.
" Map git's single-letter command names to them, in normal and visual mode.
" p, pick = use commit
nnoremap <buffer> <silent> p :Pick<CR>
xnoremap <buffer> <silent> p :Pick<CR>
" r, reword = use commit, but edit the commit message
nnoremap <buffer> <silent> r :Reword<CR>
xnoremap <buffer> <silent> r :Reword<CR>
" e, edit = use commit, but stop for amending
nnoremap <buffer> <silent> e :Edit<CR>
xnoremap <buffer> <silent> e :Edit<CR>
" s, squash = use commit, but meld into previous commit
nnoremap <buffer> <silent> s :Squash<CR>
xnoremap <buffer> <silent> s :Squash<CR>
" f, fixup = like "squash", but discard this commit's log message
nnoremap <buffer> <silent> f :Fixup<CR>
xnoremap <buffer> <silent> f :Fixup<CR>
" d, drop = remove commit
nnoremap <buffer> <silent> d :Drop<CR>
xnoremap <buffer> <silent> d :Drop<CR>
