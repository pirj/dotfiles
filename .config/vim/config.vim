set nocompatible          " be iMproved

let &runtimepath=expand('~/.config/vim').','.&runtimepath

filetype plugin indent on " Automatically detect file types. (must turn on after Vundle)

" Color
set t_Co=256
let g:jellybeans_background_color_256=234
let g:seoul256_background=234
colorscheme jellybeans
" colorscheme seoul256

packadd cfilter           " Allow filtering in location and quickfix lists

set writebackup           " Backup file before overwriting
set backupdir=~/.local/vim/backup
set swapfile              " Keep all recent changes even without saving
set directory=~/.local/vim/temp
set undofile              " Persistent Undo
set undodir=~/.local/vim/undo

set path=.,**             " Paths to find files in

" UI
set ruler                 " Ruler on
set norelativenumber      " No relative line numbers
set nonumber              " And not even current line number under cursor too
set nowrap                " Line wrapping off
set showbreak=..          " Show broken lines
set showmatch             " Show matching brackets
set matchtime=2           " How many tenths of a second to blink

set list                  " Show invisible whitespace
set listchars=""          " Reset the list chars
set listchars=tab:>-      " Indicate tabs
set listchars+=trail:-    " Indicate trailing whitespace as dots
set listchars+=extends:>  " Indicate that text continues beyond the right of the screen
set listchars+=precedes:< " Indicate that text continues beyond the left of the screen

set encoding=utf-8
set noshowmode            " Don't show the mode since lightline shows it
set title                 " Set the title of the window in the terminal to the file
set laststatus=2
set nocursorline

set lazyredraw            " Run macros lightning fast
set ttyfast               " Indicates a fast terminal connection... characters will be sent to the screen for redrawing, instead of using insert/delete line commands. Improves smoothness of redrawing when there are multiple windows and the terminal does not support a scrolling region.

set synmaxcol=512         " Syntax coloring lines that are too long just slows down the world

set shortmess+=I          " No startup message
let g:netrw_banner = 0    " No Netrw banner

" No vertical split bar
highlight VertSplit cterm=NONE
set fillchars=vert:\ 

" Behaviors
syntax enable             " Enable syntax processing
set autoread              " Automatically reload changes if detected
set wildmenu              " Display command completion options
set wildmode=longest:full,full " Complete till longest common string, display matches
set hidden                " Change buffer - without saving
set history=768           " Number of things to remember in history.
set iskeyword+=$,@        " Add extra characters that are valid parts of variables
set nostartofline         " Don't go to the start of the line after some commands
set scrolloff=3           " Keep three lines below the last line when scrolling
set gdefault              " have :s///g flag by default on

" Text Format
set tabstop=2             " Number of visual spaces per TAB
set backspace=2           " Delete everything with backspace
set shiftwidth=2          " Tabs under smart indent
set autoindent            " Copy indent from current line when starting a new line
set expandtab             " Tabs are spaces
set formatoptions=t       " Do not insert new line of comments
set formatoptions+=j      " Remove extra comment when joining lines

" Searching
set ignorecase            " Case insensitive search
set smartcase             " Non-case sensitive search
set incsearch             " Show matches while typing
set hlsearch              " Highlight search
set wildignore+=.git
set wildignore+=log,tmp,node_modules,public

" Sounds
set noerrorbells
set novisualbell
set t_vb=

set complete=.,w,b,u,U    " Better complete options to speed it up
set completeopt+=longest  " Insert the longest common text of the matches
set shortmess+=c          " No match index indication

set timeoutlen=500        " Don't wait too long for key sequences
set ttimeoutlen=50        " Avoid annoying mode switch lag

" Lightline
function! RelativeFilename()
  return '' == expand('%') ? 'NO NAME' : expand('%')
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relative-filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔑":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_function': {
      \   'relative-filename': 'RelativeFilename'
      \ }
      \}

" Splits
set splitbelow
set splitright

" Spell checking
set spelllang=en,ru

" Grep with rg
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden

" Mouse integration is for all modes by default on some installs
" Switch back to normal only
set mouse=

" Disable improved mouse integration
let g:TerminusMouse=0

" Disable cursor shape change on mode change
let g:TerminusCursorShape=0

" Use folding
set foldmethod=manual

let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

" No .netrwhist please
let g:netrw_dirhistmax = 0

" Ruby inline HEREDOC syntax highlighting
let g:ruby_heredoc_syntax_defaults = {
  \ "javascript" : {
  \   "start" : "JS",
  \},
  \ "html" : {
  \   "start" : "HTML",
  \},
  \ "ruby" : {
  \   "start" : "RUBY",
  \},
  \ "xml" : {
  \   "start" : "XML",
  \},
\}

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Work around Vim bug useing background color erase even if the terminfo file does not contain the bce capability
let &t_ut=''

" Diff opts for git mergetool
" set diffopt=internal,algorithm:patience
