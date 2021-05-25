" ----------------------------------------
" Vundle
" ----------------------------------------

filetype off     " required!

set rtp+=~/.config/vim/bundle/Vundle.vim
call vundle#begin('~/.config/vim/bundle')

" Show key bindings in a popup after a short delay
" Bundle 'leoatchina/vim-which-key'

" Easier key binding definitions
" Bundle 'AlexVKO/vim-mapping-manager'

" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

" leader-f fuzzy file finder
Bundle 'Yggdroot/LeaderF'

" navigate between alternative files
Bundle 'tpope/vim-projectionist'
Bundle 'uptech/vim-open-alternate'

" open files at a given line number/column when provided (README:3:12)
Bundle 'kopischke/vim-fetch'

" display indent levels
Bundle 'nathanaelkane/vim-indent-guides'

" status line
Bundle 'itchyny/lightline.vim'

" colorschemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'junegunn/seoul256.vim'

" quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" support libs for custom textobjs
Bundle 'kana/vim-textobj-user'
runtime macros/matchit.vim

" ruby block text object
Bundle 'tek/vim-textobj-ruby'

" comment and uncomment
Bundle "tpope/vim-commentary"

" complete on Tab
Bundle 'ervandew/supertab'

" ai code completion
" Bundle 'zxqfl/tabnine-vim'

" git conflicts
Bundle 'whiteinge/diffconflicts'

" mostly for blame
Bundle 'tpope/vim-fugitive'

" show git changes
Bundle 'airblade/vim-gitgutter'

" Ruby syntax
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'slim-template/vim-slim'
Bundle 'joker1007/vim-ruby-heredoc-syntax'
Bundle 'thoughtbot/vim-rspec'

" CSS color previews
Bundle 'ap/vim-css-color'

" better repeat
Bundle 'tpope/vim-repeat'

" tmux support
Bundle 'jgdavey/tslime.vim'

" better terminal integration
Bundle 'wincent/terminus'

" Writing
Bundle 'junegunn/goyo.vim'

" FireFox integration
Bundle 'glacambre/firenvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
