" ----------------------------------------
" Vundle
" ----------------------------------------

filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
" Shougo/neobundle.vim

" NAVIGATION
" ---------------

"Bundle 'ZoomWin'
" This fork is required due to remapping ; to :
"Bundle 'christoomey/vim-space'
"Bundle 'Lokaltog/vim-easymotion'
" christoomey/vim-tmux-navigator

" Fuzzy search
" Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'

" No char-wise navigation, please
" Bundle 'wikitopian/hardmode'

" UI ADDITIONS
" ---------------

" Neat replacement for powerline
Bundle 'bling/vim-airline'

" Favourite colorscheme
Bundle 'nanotech/jellybeans.vim'

" Automatically resizes splits on switch
Bundle 'justincampbell/vim-eighties'

" Startup screen
"mhinz/vim-startify

" Undo tree
"mbbill/undotree

"Bundle 'Rykka/colorv.vim'
"Bundle 'mutewinter/vim-indent-guides'

" COMMANDS
" ---------------

Bundle 'tpope/vim-surround'
"Bundle 'godlygeek/tabular'

Bundle 'rking/ag.vim'

"Bundle 'milkypostman/vim-togglelist'
"Bundle 'AndrewRadev/sideways.vim'
"Bundle 'keepcase.vim'
"Bundle 'scratch.vim'
"Bundle 'mutewinter/GIFL'
"Bundle 'swaroopch/vim-markdown-preview'
"Bundle 'AndrewRadev/switch.vim'
"Bundle 'tpope/vim-eunuch'
"Bundle 'itspriddle/vim-marked'
"Bundle 'mutewinter/UnconditionalPaste'
"Bundle 'skalnik/vim-vroom'
" sickill/vim-pasta
"tpope/vim-abolish

" Comment and uncomment
Bundle "tpope/vim-commentary"

" AUTOMATIC HELPERS
" ---------------

"Bundle 'IndexedSearch'
"Bundle 'xolox/vim-session'
"Bundle 'Raimondi/delimitMate'
"Bundle 'scrooloose/syntastic'
"Bundle 'ervandew/supertab'
"Bundle 'gregsexton/MatchTag'

"Bundle 'Shougo/neocomplete.vim'
"valloric/YouCompleteMe


" VERSION CONTROL
" ---------------
" Bundle 'tpope/vim-fugitive'
" Bundle 'mhinz/vim-signify'

" SYNTAX SUPPORT
" ---------------

"scrooloose/syntastic

"   Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'slim-template/vim-slim'
" Documentation browser
" Bundle 'danchoi/ri.vim'

"t9md/vim-ruby-xmpfilter
"https://github.com/t9md/vim-ruby_eval
"astashov/vim-ruby-debugger

"Bundle 'tpope/vim-haml'
"Bundle 'tpope/vim-rake'

" CSS color previews
Bundle 'ap/vim-css-color'

"   Other
" Bundle 'perl-support.vim'
"Bundle 'pangloss/vim-javascript'

" LIBRARIES
" ---------------

Bundle 'L9'
Bundle 'tpope/vim-repeat'

" OTHER
" ---------------

" tmux support
Bundle 'teranex/tslime.vim'

" Live editing of HTML, CSS, JS
"jaxbot/brolink

"vimwiki

"Shougo/vimproc
"thinca/vim-quickrun
"http://www.vim.org/scripts/script.php?script_id=2337
"http://www.vim.org/scripts/script.php?script_id=1590
"https://github.com/kana/vim-scratch
"https://github.com/mootoh/refe2-vim
"mattn/webapi-vim
