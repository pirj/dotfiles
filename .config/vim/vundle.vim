" ----------------------------------------
" Vundle
" ----------------------------------------

filetype off     " required!

set rtp+=~/.config/vim/bundle/Vundle.vim
call vundle#begin('~/.config/vim/bundle')

" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'
" Shougo/neobundle.vim

" NAVIGATION
" ----------
" Bundle 'tpope/vim-vinegar'
" Bundle 'justinmk/vim-dirvish'
Bundle 'ctrlpvim/ctrlp.vim'

Bundle 'tpope/vim-projectionist'

"Bundle 'ZoomWin'
" This fork is required due to remapping ; to :
"Bundle 'christoomey/vim-space'
"Bundle 'supasorn/vim-easymotion'
"Bundle 'Lokaltog/vim-easymotion'
" christoomey/vim-tmux-navigator

" Fuzzy search
" Bundle 'kien/ctrlp.vim'
" Bundle 'Shougo/unite.vim'

" No char-wise navigation, please
" Bundle 'wikitopian/hardmode'
" Bundle 'takac/vim-hardtime'

" Allows you to visually select increasingly larger regions of text using the same key combination
" Bundle 'terryma/vim-expand-region'

" Open files at a given line number/column when provided (README:3:12)
Bundle 'kopischke/vim-fetch'

" COLLABORATION
" -------------
" Bundle 'emgram769/vim-multiuser'

" UI ADDITIONS
" ------------
Bundle 'nathanaelkane/vim-indent-guides'

"Bundle 'jszakmeister/vim-togglecursor'

" Neat replacement for powerline
" Bundle 'bling/vim-airline'
Bundle 'itchyny/lightline.vim'

" Colorschemes
Bundle 'nanotech/jellybeans.vim'
" Bundle 'flazz/vim-colorschemes'
" Bundle 'xolox/vim-colorscheme-switcher'
" Bundle 'vim-misc'
Bundle 'junegunn/seoul256.vim'

" Automatically resizes splits on switch
" Bundle 'justincampbell/vim-eighties'
" Bundle 'zhaocai/GoldenView.Vim'
" Bundle 'roman/golden-ratio'

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
" Bundle 'tpope/vim-endwise'

" Indentation text-objects to give your old Vim some new bytes
" Bundle 'qstrahl/vim-dentures'

Bundle 'kana/vim-textobj-user'
runtime macros/matchit.vim

" Adds ruby block text object
Bundle 'tek/vim-textobj-ruby'

" COMMANDS
" --------

"Bundle 'godlygeek/tabular'

"Bundle 'rking/ag.vim'

"Bundle 'milkypostman/vim-togglelist'
"Bundle 'AndrewRadev/sideways.vim'
"Bundle 'keepcase.vim'
"Bundle 'scratch.vim'
"Bundle 'mutewinter/GIFL'
"Bundle 'swaroopch/vim-markdown-preview'
" Bundle 'dagwieers/asciidoc-vim'
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

"Bundle 'w0rp/ale'

" VERSION CONTROL
" ---------------
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
" Bundle 'junegunn/gv.vim'
Bundle 'whiteinge/diffconflicts'

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

Bundle 'joker1007/vim-ruby-heredoc-syntax'

" Bundle 'sunaku/vim-ruby-minitest'
Bundle 'thoughtbot/vim-rspec'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-rake'

" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'
" Bundle 'honza/vim-snippets'

" CSS color previews
Bundle 'ap/vim-css-color'

" Other
" Bundle 'perl-support.vim'
" Bundle 'pangloss/vim-javascript'
" Bundle 'brandonbloom/vim-factor'

" LiveScript
" Bundle 'ninegrid/vim-livescript'

" JavaScript
" Bundle 'Shutnik/jshint2.vim'

" Markdown

" Bundle 'gabrielelana/vim-markdown'

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

" ASYNC
" -----
" Bundle 'skywind3000/asyncrun.vim'

" OTHER
" -----

" tmux support
Bundle 'jgdavey/tslime.vim'

" Live editing of HTML, CSS, JS
"jaxbot/brolink
"kshenoy/vim-signature display and navigate marks

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

" Better terminal integration
Bundle 'wincent/terminus'

" Writing support
" Bundle 'reedes/vim-pencil'

" All of your Plugins must be added before the following line
call vundle#end()            " required
