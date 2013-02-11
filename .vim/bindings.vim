" ----------------------------------------
" Bindings
" ----------------------------------------

" Remap leader
let mapleader = ","

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Let's make escape better, together.
inoremap jj <Esc>

" Navigate panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>n <c-w>v<c-w>n

" Resize panes
nnoremap <leader>- <c-w>_
nnoremap <leader>\ <c-w><Bar>
nnoremap <leader>= <c-w>=

" Select previously pasted text
nnoremap gv `[v`]
