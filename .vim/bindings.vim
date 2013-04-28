" ----------------------------------------
" Bindings
" ----------------------------------------

" Remap leader
let mapleader = ","

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Escape in home row
inoremap jj <Esc>
vnoremap ll <Esc>

" Navigate panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>v <c-w>v<c-w>l

" Resize panes
nnoremap <leader>- <c-w>_
nnoremap <leader>\ <c-w><Bar>
nnoremap <leader>= <c-w>=

" Select previously pasted text
nnoremap gv `[v`]

" Select all
nnoremap <Leader>a ggVG

" Yank to the end of line
nnoremap Y y$

" Stopkeys
map <Left> :echo 'damnit!'<cr>
map <Right> :echo 'you suck!'<cr>
map <Up> :echo 'this is why you fail'<cr>
map <Down> :echo 'nooooo!'<cr>
map <BS> :echo 'loser!'<cr>
imap <Left> use-normal-mode-luke
imap <Right> use-normal-mode-luke
imap <Up> use-normal-mode-luke
imap <Down> use-normal-mode-luke
imap <BS> use-normal-mode-luke

" Jump to start and end of line using the home row keys
noremap H ^
noremap L $

" Easier redo
nnoremap U <C-r>

" Send to tmux
vmap <leader>c <Plug>SendSelectionToTmux
nmap <leader>c <Plug>NormalModeSendToTmux
