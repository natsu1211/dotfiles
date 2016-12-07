""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------
" vim Setting
"------------------------------------------------
let g:vim_user='natsu1211' " User name
let g:vim_email='longyutao1211@gmail.com'
let g:vim_fancy_font=1 " Enable using fancy font

" vim ui setting
let g:vim_show_number=1 " Enable showing number
" vim autocomplete setting (YCM or NEO)
let g:vim_autocomplete='YCM'
" vim plugin setting
let g:vim_bundle_groups=['ui', 'enhance', 'move', 'navigate',
            \'complete', 'compile', 'git', 'language']
" ack & ag search engine
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------
" General
"------------------------------------------------

set nocompatible        " goodbye vi
    " Windows Compatible
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME

set autochdir
filetype plugin indent on " Enable filetype
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
" if has('clipboard')
    " if has('unnamedplus')  " When possible use + register for copy-paste
        " set clipboard=unnamed,unnamedplus
    " else         " On mac and Windows, use * register for copy-paste
        " set clipboard=unnamed
    " endif
" endif

let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader

" Source the vimrc file after saving it
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"autocmd BufWritePost $MYVIMRC NeoBundleClean
" Fast edit the .vimrc file using ,rc
nnoremap <Leader>rc :edit $MYVIMRC<CR>
nnoremap <Leader>src :source $MYVIMRC<CR>

set autoread " Set autoread when a file is changed outside
"set autowrite " Write on make/shell commands
set ttyfast
set lazyredraw
set history=100 " Increase the lines of history
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set nobackup " Set backup
set undofile " Set undo
set noswapfile
set foldlevelstart=10 "donot fold anything
"set spell "spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword+=_,$,@,%,#,-
set write
:
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set background=dark         " Assume a dark background

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------
" UI
"------------------------------------------------
syntax on
color molokai
set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)

" Set tabline
set showtabline=2 " Always show tab line
" Set up tab labels
set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
        let buflist=tabpagebuflist(i)
        let winnr=tabpagewinnr(i)
        let s.=(i==t ? '%#TabLineSel#' : '%#TabLine#')
        let s.='%'.i.'T'
        let s.=' '
        let bufnr=buflist[winnr-1]
        let file=bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        let m=''
        if getbufvar(bufnr, '&modified')
            let m='[+]'
        endif
        if buftype=='nofile'
            if file=~'\/.'
                let file=substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file=fnamemodify(file, ':p:t')
        endif
        if file==''
            let file='[No Name]'
        endif
        let s.=i.':'
        let s.=file
        let s.='['.winnr.']'
        let s.=' '
        let i=i+1
    endwhile
    let s.='%T%#TabLineFill#%='
    let s.=(tabpagenr('$')>1 ? '%999XX' : 'X')
    return s
endfunction
" Set up tab tooltips with each buffer name
set guitabtooltip=%F

" Set status line
if count(g:vim_bundle_groups, 'ui')
    set laststatus=2 " Show the statusline
    set noshowmode " Hide the default mode text
    " Set status line colorscheme
    set ttimeoutlen=50
    let g:bufferline_echo=0
    let g:bufferline_modified='[+]'
    if g:vim_fancy_font
        let g:airline_powerline_fonts=1
    else
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    endif
endif


if g:vim_show_number
    set number " Show line numbers
endif


" Set gVim UI setting
if has('gui_running')
    set guioptions-=m "hide toolbar"
    set guioptions-=T "hide menu"
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12          "set font
endif
if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    " Selected characters/lines in visual mode
endif
" Only have cursorline in current window and in normal window
"autocmd WinLeave * set nocursorline
"autocmd WinEnter * set cursorline
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline
set shortmess=atI " Avoids hit enter
set formatoptions+=rnlmM " Optimize format options
set nowrap " Set nowrap
set backspace=indent,eol,start " Make backspaces delete sensibly
"set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

"set matchtime=2 " Decrease the time to blink
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line
"set cursorcolumn                " Highlight current column
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
"set winminheight=0              " Windows can be 0 line high
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
"set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set smarttab                    ""
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
"set splitright                  " Puts new vsplit windows to the right of the current
"set splitbelow                  " Puts new split windows to the bottom of the current
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Bundles
"--------------------------------------------------

call plug#begin(expand($HOME . '/.vim/bundle/'))

" Use vim-plug to manager plugins

if count(g:vim_bundle_groups, 'ui') " UI setting
    Plug 'bling/vim-airline' " Fancy Status line
    Plug 'altercation/vim-colors-solarized' "solarized theme
    Plug 'tomasr/molokai'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'bling/vim-bufferline' "Show Buffer line
    Plug 'powerline/fonts'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-scripts/restore_view.vim' "restore cursor position and fold
endif

if count(g:vim_bundle_groups, 'enhance') " Vim enhancement
    Plug 'Raimondi/delimitMate' " Closing of quotes
    Plug 'scrooloose/nerdcommenter' " NERD commenter
    Plug 'tpope/vim-abolish' " Substitute, find
    Plug 'tpope/vim-repeat' " Repeat
    Plug 'kristijanhusak/vim-multiple-cursors' " Multiple cursors
    Plug 'mbbill/undotree' " Undo tree
    Plug 'tpope/vim-surround' " Substitute a pair of quotes
    Plug 'godlygeek/tabular' " Alignment
    Plug 'Keithbsmiley/investigate.vim' " Helper
    Plug 'wellle/targets.vim' " Text objects
    Plug 'chrisbra/vim-diff-enhanced' " Create better diffs
    Plug 'kana/vim-submode'
    Plug 'kshenoy/vim-signature' "Show marks
    Plug 'vim-scripts/bufkill.vim'
    Plug 'tpope/vim-endwise' "auto close for ruby and some other languages
    Plug 'mileszs/ack.vim' "Ack search engine
    Plug 'sickill/vim-pasta' "better paste
endif

if count(g:vim_bundle_groups, 'move') " Moving
    Plug 'Lokaltog/vim-easymotion' " Easy motion
    Plug 'majutsushi/tagbar' " Tag bar
    Plug 'edsono/vim-matchit' " Match it
    Plug 'Shougo/unite.vim' " Search engine
    Plug 'Shougo/unite-outline' " Unite outline
    Plug 'Shougo/vimproc', {'do': 'make'}
endif

if count(g:vim_bundle_groups, 'navigate') " Navigation
    Plug 'scrooloose/nerdtree' " NERD tree
    Plug 'jistr/vim-nerdtree-tabs' " NERD tree tabs
endif

if count(g:vim_bundle_groups, 'complete') " Completion
    if g:vim_autocomplete=='NEO'
        Plug 'Shougo/neocomplete.vim' " Auto completion framework
        let g:vim_completion_engine='neocomplete'
        Plug 'Shougo/neosnippet.vim' " Snippet engine
        Plug 'Shougo/neosnippet-snippets' " Snippets
    else
        Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}
        let g:vim_completion_engine='YouCompleteMe'
        Plug 'sirver/ultisnips' " Snippet engine
    endif
    Plug 'honza/vim-snippets' " Snippets
endif

if count(g:vim_bundle_groups, 'compile') " Compiling
    Plug 'scrooloose/syntastic' " Syntax checking
    Plug 'thinca/vim-quickrun' "quick compile
endif

if count(g:vim_bundle_groups, 'git') " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive' " Git wrapper
    Plug 'Xuyuanp/nerdtree-git-plugin'
endif

if count(g:vim_bundle_groups, 'language') " Language Specificity
    "Plug 'matthias-guenther/hammer.vim' " Markup
    Plug 'plasticboy/vim-markdown'
    Plug 'tyru/open-browser.vim'
    Plug 'kannokanno/previm'
    Plug 'fatih/vim-go' " Golang
    Plug 'vim-ruby/vim-ruby' "ruby
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    Plug 'tpope/vim-rails' " Rails
    Plug 'LaTeX-Box-Team/LaTeX-Box' " LaTex
    Plug 'sheerun/vim-polyglot' " Language Support
    "haskell
    Plug 'eagletmt/ghcmod-vim'
    Plug 'ujihisa/unite-haskellimport'
endif


call plug#end()

filetype plugin indent on " Required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Search Related
"-------------------------------------------------

set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set hlsearch " Highlight search terms
set incsearch " Find as you type search

" Keep search matches in the middle of the window
"nnoremap n nzzzv
"nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv


"nh to close highlight
nnoremap <silent> nh :noh<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------------------------------
" => Conveience Key Mappings
"------------------------------------------------
" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" Fast tab and windows operations
nnoremap <Leader><Leader>j <C-w>j
nnoremap <Leader><Leader>k <C-w>k
nnoremap <Leader><Leader>l <C-w>l
nnoremap <Leader><Leader>h <C-w>h
nnoremap <Leader><Leader>J <C-w>J
nnoremap <Leader><Leader>K <C-w>K
nnoremap <Leader><Leader>L <C-w>L
nnoremap <Leader><Leader>H <C-w>H
"next tab
nnoremap <Leader><Leader>n gt
"previous tab
nnoremap <Leader><Leader>m gT
nnoremap <Leader><Leader>r <C-w>r
nnoremap <Leader><Leader>= <C-w>=
nnoremap <Leader><Leader>w <C-w>w
nnoremap <Leader><Leader>o <C-w>_<C-w>|
"next buffer
nnoremap <Leader><Leader>N :<C-u>bn<CR>
"previous buffer
nnoremap <Leader><Leader>P :<C-u>bp<CR>
nnoremap <Leader><Leader>t :<C-u>tabnew<CR>
"nnoremap <Leader><Leader>T :<C-u>Unite tab<CR>
nnoremap <Leader><Leader>s :<C-u>sp<CR>
nnoremap <Leader><Leader>v :<C-u>vs<CR>
nnoremap <Leader><Leader>q :<C-u>q<CR>
nnoremap <Leader><Leader>d :<C-u>bd<CR>
nnoremap <Leader><Leader>b :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap <Leader><Leader>B :<C-u>Unite buffer -buffer-name=file<CR>
"require submode bundle, could input s<<< to instead s<s<s<, and s< to instead <C-w><
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" Stupid shift key fixes
if !exists('g:vim_no_keyfixes')
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif

    cmap Tabe tabe
endif
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select entire buffer
nnoremap <Leader>bb  ggvGg_

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Modify all the indents
nnoremap \= gg=G
" quick ESC
imap <D-j> <ESC>
vmap <D-j> <ESC>
xmap <D-j> <ESC>
" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 1d_
            \ | diffthis | wincmd p | diffthis

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Bundles Setting
"--------------------------------------------------
" Setting for UI plugins
if count(g:vim_bundle_groups, 'ui')
    " ->IndentLine
    let g:indentLine_char = '┊'
    let g:airline_theme= 'molokai'
    let g:airline#extensions#tabline#enabled = 1

endif
" Setting for enhancement plugins
if count(g:vim_bundle_groups, 'enhance')
    " -> Markdown
    nnoremap <Leader>md :PrevimOpen<CR>
    xnoremap <Leader>md :PrevimOpen<CR>
    " -> text-obj
    augroup textobj_sentence
        autocmd!
        autocmd FileType markdown call textobj#sentence#init()
        autocmd FileType textile call textobj#sentence#init()
        autocmd FileType vim call textobj#sentence#init()
    augroup END
    " -> delimitMate
    let delimitMate_expand_cr=1
    let delimitMate_expand_space=1
    let delimitMate_balance_matchpairs=1

    " -> NERD Commenter
    let NERDCommentWholeLinesInVMode=2
    " let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1

    function! IsWhiteLine()
        if (getline('.')=~'^$')
            let oldlinenumber=line('.')
            call NERDComment('n', 'sexy')
            if (line('.')==oldlinenumber)
                call NERDComment('n', 'append')
                normal! x
            else
                normal! k
                startinsert!
            endif
        else
            normal! A
            call NERDComment('n', 'append')
            normal! x
        endif
    endfunction
    nnoremap <silent> <Leader>cc :call IsWhiteLine()<CR>
    " Use defalut key mappings for other commneter functions
    " [count]<leader>cn |NERDComNestedComment|
" Same as <leader>cc but forces nesting.

" [count]<leader>c<space> |NERDComToggleComment|
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

" [count]<leader>cm |NERDComMinimalComment|
" Comments the given lines using only one set of multipart delimiters.

" [count]<leader>ci |NERDComInvertComment|
" Toggles the comment state of the selected line(s) individually.

" [count]<leader>cs |NERDComSexyComment|
" Comments out the selected lines ``sexily''

" [count]<leader>cy |NERDComYankComment|
" Same as <leader>cc except that the commented line(s) are yanked first.

" <leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.

" <leader>cA |NERDComAppendComment|
" Adds comment delimiters to the end of line and goes into insert mode between them.

" |NERDComInsertComment|
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

" <leader>ca |NERDComAltDelim|
" Switches to the alternative set of delimiters.

" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
" Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

" [count]<leader>cu |NERDComUncommentLine|
" Uncomments the selected line(s).
    " -> Undo tree
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1

    " -> investigate.vim
    nnoremap <leader>L :call investigate#Investigate('n')<CR>
    vnoremap <leader>L :call investigate#Investigate('v')<CR>
    let g:investigate_use_dash=1

    " -> EnhancedDiff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

    " -> vim-surround
    " cs[{, ysiw], ds{ds)

    " -> easymotion
    "<leader><leader>w,b
    "<leader><leader>j,k
    " Do not rely on default bindings.
    let g:EasyMotion_do_mapping = 0
    " Just use one leader as prefix
    map <Leader> <Plug>(easymotion-prefix)
    " Jump to anywhere you want by just `4` or `3` key strokes without thinking!
    " `s{char}{char}{target}`
    nmap s <Plug>(easymotion-s2)
    xmap s <Plug>(easymotion-s2)
    omap z <Plug>(easymotion-s2)
    " use f and t for bidirectional line move
    " map f <Plug>(easymotion-bd-fl)
    " map t <Plug>(easymotion-bd-tl)
    " map F <Plug>(easymotion-bd-f)
    " Turn on case sensitive feature
    let g:EasyMotion_smartcase = 1
    " Jump to first match with enter & space
    let g:EasyMotion_enter_jump_first = 1
    let g:EasyMotion_space_jump_first = 1
    " Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
    " `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
    " :h easymotion-command-line
    nmap g/ <Plug>(easymotion-sn)
    xmap g/ <Plug>(easymotion-sn)
    omap g/ <Plug>(easymotion-tn)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    " keep cursor column with `JK` motions
    let g:EasyMotion_startofline = 0
    " using w and e in all modes
    map <Leader>w <Plug>(easymotion-bd-w)
    map <Leader>e <Plug>(easymotion-bd-e)
    set nohlsearch
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)

endif
" setting for moving plugins
if count(g:vim_bundle_groups, 'move')

    " -> Tag bar
    nnoremap <Leader>t :TagbarToggle<CR>
    let g:tagbar_autofocus=1
    let g:tagbar_expand=1
    let g:tagbar_foldlevel=2
    let g:tagbar_autoshowtag=1


    " -> Unite
    let g:unite_data_directory=$HOME . '/.vim/cache/unite'
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=100
    if g:vim_fancy_font
        let g:unite_prompt='» '
    endif
    if executable('ag')
        " Use ag in unite grep source.
        let g:unite_source_grep_command='ag'
        let g:unite_source_grep_default_opts='--line-numbers --nocolor --nogroup --hidden'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack-grep')
        " Use ack-grep in unite grep source.
        let g:unite_source_grep_command='ack-grep'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        " Use ack in unite grep source.
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt=''
    endif
    function! s:unite_settings() " Use ESC to exit, and use S-J and S-K to move
        nmap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <S-j> <Plug>(unite_select_next_line)
        imap <buffer> <S-k> <Plug>(unite_select_previous_line)
    endfunction
    autocmd filetype unite call s:unite_settings()
    nnoremap <silent> <Space>f :<C-u>Unite -start-insert -auto-resize -buffer-name=files file_rec/async<CR><C-U>
    nnoremap <silent> <Space>y :<C-u>Unite -start-insert -buffer-name=yanks history/yank<CR>
    nnoremap <silent> <Space>l :<C-u>Unite -start-insert -auto-resize -buffer-name=line line<CR>
    nnoremap <silent> <Space>o :<C-u>Unite -auto-resize -buffer-name=outline outline<CR>
    nnoremap <silent> <Space>b :<C-u>Unite -quick-match buffer<CR>
    nnoremap <silent> <Space>t :<C-u>Unite -quick-match tab<CR>
    nnoremap <silent> <Space>/ :<C-u>Unite -auto-resize -buffer-name=search grep:.<CR>

endif
" Setting for navigation plugins
if count(g:vim_bundle_groups, 'navigate')

    " -> NERD Tree
    nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
    nnoremap <Leader>nf :NERDTreeFind<CR>
    let NERDTreeChDirMode=2
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeDirArrows=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'


endif
" Setting for completion plugins
if count(g:vim_bundle_groups, 'complete')

    if g:vim_autocomplete=='NEO'
        " -> Neocomplete & Neocomplcache
        " Use Tab and S-Tab to select candidate
        inoremap <expr><Tab>  pumvisible() ? "\<C-N>" : "\<Tab>"
        inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
        if g:vim_completion_engine=='neocomplete'
            let g:neocomplete#enable_at_startup=1
            let g:neocomplete#data_directory=$HOME . '/.vim/cache/neocomplete'
            let g:neocomplete#enable_auto_delimiter=1
        else
            let g:neocomplcache_enable_at_startup=1
            let g:neocomplcache_temporary_dir=$HOME . '/.vim/cache/neocomplcache'
            let g:neocomplcache_enable_auto_delimiter=1
            let g:neocomplcache_enable_fuzzy_completion=1
            " Use <C-E> to close popup
            inoremap <expr><C-E> neocomplcache#cancel_popup()
            inoremap <expr><CR> delimitMate#WithinEmptyPair() ?
                        \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
                        \ pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endif
        " -> Neosnippet
        " Set information for snippets
        let g:neosnippet#enable_snipmate_compatibility=1
        " Use <C-K> to expand or jump snippets in insert mode
        imap <C-K> <Plug>(neosnippet_expand_or_jump)
        " Use <C-K> to replace TARGET within snippets in visual mode
        xmap <C-K> <Plug>(neosnippet_start_unite_snippet_target)
        " For snippet_complete marker
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    else
        " ->YCM & UltiSnips
        let g:acp_enableAtStartup = 0

            " enable completion from tags
            let g:ycm_collect_identifiers_from_tags_files = 1
            let g:ycm_global_ycm_extra_conf = '~/Lvim'
            " remap Ultisnips for compatibility for YCM
            let g:UltiSnipsExpandTrigger = '<C-j>'
            let g:UltiSnipsJumpForwardTrigger = '<C-j>'
            let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
            " Enable omni completion.
       "     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
       "     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
       "     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
       "     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
       "     autocmd FileType xml set:local omnifunc=xmlcomplete#CompleteTags
       "     autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
       "     autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
       augroup PrevimSettings
           autocmd!
           autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
       augroup END
       "let g:previm_open_cmd = 'open -a Safari'

    endif

    " Setting info for snips
    let g:snips_author=g:vim_user
    let g:snips_email=g:vim_email
    "let g:snips_github=g:vim_github

endif

" Setting for compiling plugins
if count(g:vim_bundle_groups, 'compile')

    " -> Syntastic
    let g:syntastic_check_on_open=1
    let g:syntastic_aggregate_errors=1
    let g:syntastic_auto_jump=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
    if g:vim_fancy_font
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_style_error_symbol = '✠'
        let g:syntastic_warning_symbol = '∆'
        let g:syntastic_style_warning_symbol = '≈'
    endif

    " -> quickrun
    nnoremap <silent> <F5> :QuickRun -mode n<CR>
    vnoremap <silent> <F5> :QuickRun -mode v<CR>
    let g:quickrun_config = {}
    let g:quickrun_config['cpp/clang++11'] = {
                \ 'cmdopt': '--std=c++11 --stdlib=libc++',
                \ 'type': 'cpp/clang++'
                \ }
    let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
endif

" Setting for git plugins
if count(g:vim_bundle_groups, 'git')
    " ->Fugitive
    if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        "nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
endif

if count(g:vim_bundle_groups, 'language')
    "ghc-mod
    nnoremap <silent> \t :GhcModType<CR>
    nnoremap <silent> \c :GhcModTypeClear<CR>
endif
