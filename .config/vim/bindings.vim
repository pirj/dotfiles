" ----------------------------------------
" Bindings
" ----------------------------------------

" Remap leader
let mapleader = " "

" No need to switch between layouts to use normal mode https://gist.github.com/sigsergv/5329459
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl:'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL\\;\\"ZXCVBNM<>

" Switch to normal
inoremap kj <Esc>
vnoremap kj <Esc>
cnoremap kj <C-f>

" Navigate buffers
nnoremap <silent> <Leader>j :bp<CR>
nnoremap <silent> <Leader>k :bn<CR>
nnoremap <silent> <Leader>l :ls<CR>
nnoremap <silent> <Leader>d :bd<CR>

" Find with :find (haha Ctrl-P) (also in splits)
nnoremap <Leader>f :find<Space>

" Select previously pasted text
nnoremap gv `[v`]

" Yank to the end of line
nnoremap Y y$

" Only use X clipboard when required
nnoremap <Leader>p :set paste<CR>:read !xclip -o<CR>:set nopaste<CR>

" Jump to start and end of line using the home row keys
nnoremap H 0
nnoremap L $

" Disable some annoying keys
nnoremap Q <NOP>
nnoremap K <NOP>
map 0 <NOP>
map _ <NOP>
map $ <NOP>

" Swap jumping, ' is closer, so use it to jump to line and column
nnoremap ' `
nnoremap ` '

" Easier redo
nnoremap U <C-r>

" Send to tmux
vmap <silent> <Leader>c <Plug>SendSelectionToTmux
nmap <silent> <Leader>c <Plug>NormalModeSendToTmux

" Autocomplete on Tab
imap <Tab> <C-p>

" Soft hardmode
nmap <Left>  <NOP>
nmap <Down>  <NOP>
nmap <Up>    <NOP>
nmap <Right> <NOP>
imap <Left>  <NOP>
imap <Down>  <NOP>
imap <Up>    <NOP>
imap <Right> <NOP>

" Use ^N/^P/^F
cmap <Up>    <NOP>
cmap <Down>  <NOP>
cmap <Right> <NOP>
cmap <Left>  <NOP>

" No highlight search
"nnoremap <silent> <Leader><Leader> :nohlsearch<CR>:let @/ = ''<CR>
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" Expand region bindings
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Open search
nnoremap <Leader>a :lgrep<Space>

" Toggle spell check
nmap <Leader>s :set spell!<CR>

let g:EasyMotion_do_mapping=1

" Navigate panes
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" Move panes
" nnoremap <C-J> <C-w>J
" nnoremap <C-K> <C-w>K
" nnoremap <C-H> <C-w>H
" nnoremap <C-L> <C-w>L

" Split panes
" nnoremap <C-o> <C-w>s
" nnoremap <C-v> <C-w>v
" nnoremap <C-n> <C-w>n

" Resize panes
" nnoremap <C-_> <C-w>_
" nnoremap <C-\> <C-w><Bar>
" nnoremap <Leader>= <C-w>=

" Tab navigation
" nmap <Leader>n :tabnew<CR>
" nmap <Leader>t :tabNext<CR>
