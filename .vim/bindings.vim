" ----------------------------------------
" Bindings
" ----------------------------------------

" Remap leader
let mapleader = " "

" No need to switch between layouts to use normal mode https://gist.github.com/sigsergv/5329459
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl:'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL\\;\\"ZXCVBNM<>

" Navigate panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Split panes
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v

" Find with :find (haha Ctrl-P) (also in splits)
nnoremap <leader>f :find<Space>

" Resize panes
nnoremap <leader>- <c-w>_
nnoremap <leader>\ <c-w><Bar>
nnoremap <leader>= <c-w>=

" Navigate buffers
nnoremap <leader>z :bp<CR>
nnoremap <leader>x :bn<CR>

" Select previously pasted text
nnoremap gv `[v`]

" Yank to the end of line
nnoremap Y y$

" Only use X clipboard when required
nnoremap <Leader>p :set paste<CR>"*p:set nopaste<CR>
nnoremap <Leader>y "*y

" Jump to start and end of line using the home row keys
noremap H 0
noremap L $
map 0 <NOP>
map _ <NOP>
map $ <NOP>

" Disable Ex mode, run last macro instead
nnoremap Q @@

" Swap jumping, ' is closer, so use it to jump to line and column
nnoremap ' `
nnoremap ` '

" Easier redo
nnoremap U <C-r>

" Send to tmux
vmap <leader>c <Plug>SendSelectionToTmux
nmap <leader>c <Plug>NormalModeSendToTmux

" Tab navigation
nmap <leader>n :tabnew<CR>
nmap <leader>t :tabNext<CR>

" Save, edit and quit
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>e :e<Space>

" Autocomplete on Tab
imap <tab> <c-p>

" Temporarily disable hard mode. Sign of weakness!
" nnoremap <leader>h <Esc>:call ToggleHardMode()<cr>

" Soft hardmode
nnoremap <Left> <NOP>
nnoremap <Down> <NOP>
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>

" No highlight search
nnoremap <leader><Space> :nohlsearch<CR>

" Expand region bindings
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Open search
nnoremap <leader>a :Ag<Space>

" Toggle spell check
nmap <leader>k :set spell!<CR>
