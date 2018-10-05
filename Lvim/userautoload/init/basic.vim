"------------------------------------------------
" basic
"------------------------------------------------
set nocompatible                                " Goodbye vi
set autochdir
set mouse=a                                     " Automatically enable mouse usage
set mousehide                                   " Hide the mouse cursor while typing
set encoding=utf-8
set termencoding=utf-8
set autoread                                    " Set autoread when a file is changed outside
set ttyfast
set lazyredraw
set history=100                                 " Increase the lines of history
set encoding=utf-8                              " Set utf-8 encoding
set completeopt+=longest                        " Optimize auto complete
set completeopt-=preview                        " Optimize auto complete
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set nobackup                                    " Set backup
set undofile                                    " Set undo
set noswapfile
set hidden                                      " Allow buffer switching without saving
set iskeyword+=_,$,@,%,#,-
set noerrorbells                                " No sound on errors
set novisualbell
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set nohlsearch " Not highlight search terms
set incsearch " Find as you type search
set foldmethod=syntax
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set tags=./.tags;,.tags
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

" remap leader
let mapleader=','                               " Change the mapleader
let maplocalleader='\'                          " Change the maplocalleader
