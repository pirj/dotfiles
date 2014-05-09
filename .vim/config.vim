" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

set nocompatible " be iMproved

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Color
set t_Co=256
colorscheme jellybeans
"colorscheme desert256

" Tempfiles
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
set nobackup
set nowritebackup
set noswapfile

" Persistent Undo
set undodir=~/.vim/.undo

" UI
"set ruler          " Ruler on
set number         " Line numbers on
set wrap           " Line wrapping on
set encoding=utf-8
set noshowmode     " Don't show the mode since Airline shows it
set title          " Set the title of the window in the terminal to the file
set laststatus=2
"set cursorline

set lazyredraw     " Make plugins smoother
set ttyfast        " Indicates a fast terminal connection... characters will be sent to the screen for redrawing, instead of using insert/delete line commands. Improves smoothness of redrawing when there are multiple windows and the terminal does not support a scrolling region.

set synmaxcol=512  " Syntax coloring lines that are too long just slows down the world

" vim-eighties
let g:eighties_extra_width = 10 " Increase this if you want some extra room
let g:eighties_compute = 1      " Disable this if you just want the minimum + extra

" Behaviors
syntax enable             " Enable syntax processing
set autoread              " Automatically reload changes if detected
"set wildmenu              " Turn on WiLd menu
set hidden                " Change buffer - without saving
set history=768           " Number of things to remember in history.
set clipboard=unnamedplus " Yanks go on clipboard instead.
set iskeyword+=$,@        " Add extra characters that are valid parts of variables
set nostartofline         " Don't go to the start of the line after some commands
set scrolloff=3           " Keep three lines below the last line when scrolling
set gdefault              " have :s///g flag by default on

" Text Format
set tabstop=2    " Number of visual spaces per TAB
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set autoindent   " Copy indent from current line when starting a new line
set expandtab    " Tabs are spaces

" Searching
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Show matches while typing
set hlsearch   " Highlight search
set wildignore+=.git

" Visual
set showmatch   " Show matching brackets
set matchtime=2 " How many tenths of a second to blink

set list                    " Show invisible whitespace
set listchars=""            " Reset the list chars
set listchars=tab:>-        " Indicate trailing whitespace as dots
set listchars+=trail:.      " The character to show in the last column when wrap is off and the line
set listchars+=extends:>    " Indicate that text continues beyond the right of the screen
set listchars+=precedes:<   " Indicate that text continues beyond the left of the screen

" Sounds
set noerrorbells
set novisualbell
set t_vb=

" Better complete options to speed it up
set complete=.,w,b,u,U

" Avoid annoying mode switch lag
set timeoutlen=1000 ttimeoutlen=50

" Airline
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
let g:airline_branch_prefix = '¬ '
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" Splits
set splitbelow
set splitright

" Spell checking
set spelllang=en,ru
