" Remap leader
let mapleader = " "

" No need to switch between layouts to use normal mode https://gist.github.com/sigsergv/5329459
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl:'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL\\;\\"ZXCVBNM<>

" Switch to normal
inoremap kj <Esc>
" inoremap ло <Esc>
" vnoremap kj <Esc>
cnoremap kj <C-f>

" Navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> <Leader>b :ls<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> \b :bd<CR>

" Navigate Location list (lgrep)
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>
nnoremap <silent> [F :lpfile<CR>
nnoremap <silent> ]F :lnfile<CR>
nnoremap <silent> \f :lclose<CR>

" Navigate Quickfix list
nnoremap <silent> [e :cprevious<CR>
nnoremap <silent> ]e :cnext<CR>
nnoremap <silent> \e :cclose<CR>

" Tabs
nnoremap <silent> <Leader>t :tabnew<CR>

" Navigate panes
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Create a new window in a vertical split
nnoremap <silent> <C-w>N :vnew<CR>

" Zoom pane with C-w z
nnoremap <C-w>z <C-w><bar><C-w>_

" Since C-v is used to paste from system buffer, use vv
nnoremap vv <C-v>
vnoremap vv <C-v>

" Disable some annoying keys
nnoremap Q <NOP>
nnoremap K <NOP>
map 0 <NOP>
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
vmap <Left>  <NOP>
vmap <Down>  <NOP>
vmap <Up>    <NOP>
vmap <Right> <NOP>

" Use ^N/^P/^F
cmap <Up>    <NOP>
cmap <Down>  <NOP>
cmap <Right> <NOP>
cmap <Left>  <NOP>

" Reserve some redundant keys for better use
nnoremap S :echo 'Use `cc`!'<CR>

" Smart command history completion
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Select previously pasted or selected lines
nnoremap gv `[V`]

" Edit previous file
nnoremap gb <C-^>

" Edit alternate file (vim-projectionist, vim-rails)
nnoremap ga :A<CR>

" Go to definition
" gs

" Yank to the end of line
nnoremap Y y$

" Jump to start and end of line using the home row keys
nnoremap H 0
nnoremap L $

" Jumplist
nnoremap ` <C-o>
nnoremap ~ <C-i>

" Marks
" Go to 'm' mark set by mm, and center screen
nnoremap M 'mzz

" Easier redo
nnoremap U <C-r>

" No highlight search
"nnoremap <silent> <Leader><Leader> :nohlsearch<CR>:let @/ = ''<CR>
nnoremap <silent> <Space><Space> :nohlsearch<CR>

" Search files
nnoremap <Leader>g :silent lgrep<Space>
nnoremap K :silent lgrep <C-r><C-w><CR>

" nnoremap <Leader>f :find<Space>
noremap <leader>b :<C-U><C-R>=printf("Leaderf --reverse buffer %s", "")<CR><CR>
noremap <leader>f :<C-U><C-R>=printf("Leaderf --reverse file %s", "")<CR><CR>

" Use system clipboard
if (system('uname') =~ "darwin")
  nnoremap <silent> <Leader>y :.write !pbcopy<CR><CR>
  vnoremap <silent> <Leader>y :.write !pbcopy<CR><CR>
else
endif

" Toggle spell check
nmap <silent> <Leader>s :set spell!<CR>

" Send to tmux
vmap <silent> <Leader>c <Plug>SendSelectionToTmux
nmap <silent> <Leader>c <Plug>NormalModeSendToTmux

" iTerm has (had before iTerm3?) this weird mapping, and doesn't send <S-CR>
if has("mac")
  imap ✠ <S-CR>
endif

nnoremap - :Explore<CR>

map <Leader>r :call RunNearestSpec()<CR>
map <Leader>rr :call RunCurrentSpecFile()<CR>
