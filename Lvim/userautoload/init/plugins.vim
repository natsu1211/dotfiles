"--------------------------------------------------
" Plugins
"--------------------------------------------------

call plug#begin(expand($HOME . '/.vim/bundle/'))

" Use vim-plug to manager plugins

    Plug 'joshdick/onedark.vim'                " Onedark theme
    "Plug 'itchyny/lightline.vim'               " lightline for status bar and tag bar
    Plug 'bling/vim-airline'                   " airline status bar and tag bar

    Plug 'Yggdroot/indentLine'                 " Visible indent
    Plug 'vim-scripts/restore_view.vim'        " Restore cursor position and fold
    Plug 'vim-scripts/a.vim'

    Plug 'shougo/denite.nvim'                  " Better fuzzy search
    Plug 'shougo/neomru.vim'                   " denite component
    Plug 'shougo/neoyank.vim'                  " denite component
    Plug 'raimondi/delimitmate'                " Closing of quotes
    Plug 'scrooloose/nerdcommenter'            " Nerd commenter
    Plug 'tpope/vim-surround'                  " Substitute a pair of quotes
    Plug 'tpope/vim-repeat'                    " Repeat for surround
    Plug 'kristijanhusak/vim-multiple-cursors' " Multiple cursors
    Plug 'mbbill/undotree'                     " Undo tree
    Plug 'junegunn/vim-easy-align'             " Alignment
    Plug 'keithbsmiley/investigate.vim'        " Show document of current
    Plug 'kshenoy/vim-signature'               " Show marks
    Plug 'vim-scripts/bufkill.vim'             " Close buffer without closing window
    Plug 'tpope/vim-endwise'                   " Auto close for ruby and some other languages
    Plug 'sickill/vim-pasta'                   " Better paste
    Plug 'rking/ag.vim'                        " Ag search
    Plug 'kana/vim-textobj-user'               " Textobj library
    Plug 'kana/vim-textobj-line'               " Line textobj
    Plug 'kana/vim-textobj-function'           " Function textobj
    Plug 'kana/vim-textobj-indent'             " Same indent textobj
    Plug 'glts/vim-textobj-comment'            " Comment textobj
    Plug 'kana/vim-textobj-entire'             " Entrie buffer textobj

    Plug 'ludovicchabant/vim-gutentags'        " Auto tags management
    Plug 'Lokaltog/vim-easymotion'             " Easy motion
    Plug 'Yggdroot/LeaderF'                    " fuzzy search
    Plug 'skywind3000/vim-preview'             " tag preview

    Plug 'scrooloose/nerdtree',                " Nerd tree view
    Plug 'jistr/vim-nerdtree-tabs'             " Sharing nerd tree window between tabs

    Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'} " auto complete engine
    Plug 'sirver/ultisnips'                    " Snippet engine
    Plug 'honza/vim-snippets'                   " Snipptes
    Plug 'thinca/vim-template'                 " Template helper

    Plug 'w0rp/ale'                            " Async lint
    Plug 'thinca/vim-quickrun'                 " Quick compile
    Plug 'skywind3000/asyncrun.vim'            " Async run
    Plug 'Shougo/vimproc.vim', {'do' : 'make'} 

    Plug 'airblade/vim-gitgutter'              " Show git status in editor view
    Plug 'tpope/vim-fugitive'                  " Git wrapper
    Plug 'Xuyuanp/nerdtree-git-plugin'         " Show git status in nerd tree view

    Plug 'plasticboy/vim-markdown', {'on': 'Markdown'}             " Markdown preview
    Plug 'tyru/open-browser.vim'
    Plug 'kannokanno/previm'
    Plug 'fatih/vim-go', {'on': 'Go'}          " Golang
    Plug 'vim-ruby/vim-ruby', {'on': 'Ruby'}   " Ruby
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.Vim/plugged/gocode/vim/symlink.sh' }
    Plug 'tpope/vim-rails', {'on': 'Ruby'}                     " Rails
    Plug 'LaTeX-Box-Team/LaTeX-Box', {'on': 'Latex'}             " LaTex
    Plug 'eagletmt/ghcmod-vim', {'on': 'Haskell'}                 " Haskell

call plug#end()

filetype plugin indent on " Required!
