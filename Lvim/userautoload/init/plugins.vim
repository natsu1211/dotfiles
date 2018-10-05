"--------------------------------------------------
" Plugins
"--------------------------------------------------

call plug#begin(expand($HOME . '/.vim/bundle/'))

" Use vim-plug to manager plugins

    Plug 'joshdick/onedark.vim'                " Onedark theme
    Plug 'bling/vim-airline'                   " airline status bar and tag bar

    Plug 'Yggdroot/indentLine'                 " Visible indent
    Plug 'vim-scripts/restore_view.vim'        " Restore cursor position and fold
    Plug 'vim-scripts/a.vim'

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
    Plug 'jistr/vim-nerdtree-tabs'             " Sharing nerd tree window between tabs-

    Plug 'Valloric/YouCompleteMe', {
          \  'do': './install.py --clang-completer --java-completer',
          \ 'for': ['cpp', 'c', 'objc', 'objcpp'],
          \ }
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
    endif
    Plug 'autozimu/LanguageClient-neovim', {
          \ 'branch': 'next',
          \ 'do': 'bash install.sh',
          \ }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'zchee/deoplete-go'                " deoplete go source
    Plug 'zchee/deoplete-asm'               " deoplete asm source
    Plug 'Shougo/neoinclude.vim'            " deoplete include source
    Plug 'Shougo/neco-vim'                  " deoplete vim source
    Plug 'sirver/ultisnips'                 " Snippet engine
    Plug 'honza/vim-snippets'               " Snipptes
    Plug 'thinca/vim-template'              " Template helper
    Plug 'tenfyzhong/CompleteParameter.vim' " parameter hint

    Plug 'w0rp/ale'                            " Async lint
    Plug 'thinca/vim-quickrun'                 " Quick compile
    Plug 'skywind3000/asyncrun.vim'            " Async run
    Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Async util

    Plug 'airblade/vim-gitgutter'              " Show git status in editor view
    Plug 'tpope/vim-fugitive'                  " Git wrapper
    Plug 'Xuyuanp/nerdtree-git-plugin'         " Show git status in nerd tree view

    Plug 'plasticboy/vim-markdown', {'for': 'Markdown'} " Markdown preview
    Plug 'tyru/open-browser.vim'                       " open browser
    Plug 'kannokanno/previm'                           " preview for markdown
    Plug 'tpope/vim-rails', {'for': 'Ruby'}             " Rails
    Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': 'Latex'}   " LaTex

call plug#end()

filetype plugin indent on " Required!
