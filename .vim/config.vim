" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

set nocompatible " be iMproved

" ---------------
" Color
" ---------------
set t_Co=256
colorscheme jellybeans
"colorscheme desert256

" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set backup
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp

" Persistent Undo
set undodir=~/.vim/.undo

" ---------------
" UI
" ---------------
"set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
set laststatus=2

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
"set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set clipboard=unnamedplus " Yanks go on clipboard instead.
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=.git

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" Reset the listchars
set listchars=""
" a tab should display as "  ", trailing whitespace as "."
set listchars=tab:\ \  " Indentended trailing whitespace
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" Better complete options to speed it up
set complete=.,w,b,u,U

" Layout assistant
"let g:XkbSwitchEnabled = 1 
"let g:XkbSwitchIMappings = ['ru']
