" ----------------------------------------
" Vundle
" ----------------------------------------

filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
"Bundle 'ZoomWin'
" This fork is required due to remapping ; to :
"Bundle 'christoomey/vim-space'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
" UI Additions
"Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Rykka/colorv.vim'
" Commands
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
"Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
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
" Automatic Helpers
"Bundle 'IndexedSearch'
"Bundle 'xolox/vim-session'
"Bundle 'Raimondi/delimitMate'
"Bundle 'scrooloose/syntastic'
"Bundle 'ervandew/supertab'
"Bundle 'gregsexton/MatchTag'
"Bundle 'Shougo/neocomplcache'
" Language Additions
"   Ruby
Bundle 'vim-ruby/vim-ruby'
"Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-rake'
" Libraries
"Bundle 'L9'
"Bundle 'tpope/vim-repeat'

Bundle 'teranex/tslime.vim'

