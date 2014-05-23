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
" ----------

"Bundle 'ZoomWin'
" This fork is required due to remapping ; to :
"Bundle 'christoomey/vim-space'
"Bundle 'supasorn/vim-easymotion'
" christoomey/vim-tmux-navigator
Bundle 'rhysd/clever-f.vim'
" Fuzzy search
" Bundle 'kien/ctrlp.vim'
" Bundle 'Shougo/unite.vim'

" No char-wise navigation, please
" Bundle 'wikitopian/hardmode'
" Bundle 'takac/vim-hardtime'

" Allows you to visually select increasingly larger regions of text using the same key combination
Bundle 'terryma/vim-expand-region'

" COLLABORATION
" -------------

" Bundle 'emgram769/vim-multiuser'

" UI ADDITIONS
" ------------

" Neat replacement for powerline
" Bundle 'bling/vim-airline'
Bundle 'itchyny/lightline.vim'

" Colorschemes
" Bundle 'nanotech/jellybeans.vim'
Bundle 'flazz/vim-colorschemes'
" Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'vim-misc'

" Automatically resizes splits on switch
" Bundle 'justincampbell/vim-eighties'
Bundle 'zhaocai/GoldenView.Vim'

" Startup screen
"mhinz/vim-startify

" Undo tree
"mbbill/undotree

"Bundle 'Rykka/colorv.vim'
"Bundle 'mutewinter/vim-indent-guides'

" EDITING
" -------

" Quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Bundle 'tpope/vim-endwise'

" Indentation text-objects to give your old Vim some new bytes
Bundle 'qstrahl/vim-dentures'

" COMMANDS
" --------

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
" -----------------

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
Bundle 'tpope/vim-fugitive'
" Bundle 'mhinz/vim-signify'

" SYNTAX SUPPORT
" --------------

"scrooloose/syntastic

" This one is a collection of 50 autoloaded syntax files, may replace
" everything below
"sheerun/vim-polyglot

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'slim-template/vim-slim'

" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-rake'

" CSS color previews
Bundle 'ap/vim-css-color'

" Other
" Bundle 'perl-support.vim'
" Bundle 'pangloss/vim-javascript'

" LiveScript
Bundle 'ninegrid/vim-livescript'

" RUBY
" ----

" Documentation browser
" Bundle 'danchoi/ri.vim'

" In-place evaluation
"t9md/vim-ruby-xmpfilter
"https://github.com/t9md/vim-ruby_eval
"astashov/vim-ruby-debugger

" LIBRARIES
" ---------

Bundle 'L9'
Bundle 'tpope/vim-repeat'

" OTHER
" -----

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

" Handle focus lost inside tmux
"sjl/vitality.vim
