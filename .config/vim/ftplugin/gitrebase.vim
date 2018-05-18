setlocal cursorline
highlight CursorLine ctermbg=23

nmap gj ddp
nmap gk ddkP

vmap gj dpgvo
vmap gk dkPgvo

" p, pick = use commit
" Pick is the default command
" r, reword = use commit, but edit the commit message
nmap r cwreword<Esc>b
" e, edit = use commit, but stop for amending
nmap e cwedit<Esc>b
" s, squash = use commit, but meld into previous commit
nmap s cwsquash<Esc>b
" f, fixup = like "squash", but discard this commit's log message
nmap f cwfixup<Esc>b
" d, drop = remove commit
" Don't really need it, dd line remove does the same
