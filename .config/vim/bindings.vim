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

" Select previously pasted text
nnoremap gv `[v`]

" Yank to the end of line
nnoremap Y y$

" Jump to start and end of line using the home row keys
nnoremap H 0
nnoremap L $

" Swap jumping, ' is closer, so use it to jump to line and column
nnoremap ' `
nnoremap ` '

" Easier redo
nnoremap U <C-r>

" Autocomplete on Tab
imap <Tab> <C-p>

" No highlight search
"nnoremap <silent> <Leader><Leader> :nohlsearch<CR>:let @/ = ''<CR>
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" Search files
nnoremap <Leader>a :lgrep<Space>

" Find files
nnoremap <Leader>f :find<Space>

" Only use X clipboard when required
nnoremap <Leader>p :set paste<CR>:read !xclip -o<CR>:set nopaste<CR>

" Toggle spell check
nmap <Leader>s :set spell!<CR>

" Send to tmux
vmap <silent> <Leader>c <Plug>SendSelectionToTmux
nmap <silent> <Leader>c <Plug>NormalModeSendToTmux

" Disable some annoying keys
nnoremap Q <NOP>
nnoremap K <NOP>
map 0 <NOP>
map _ <NOP>
map $ <NOP>

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
