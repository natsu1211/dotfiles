"------------------------------------------------
" UI
"------------------------------------------------
syntax on
set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)
color onedark
set termguicolors

set laststatus=2
set showtabline=2                              " Always show tab line
set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]
set tabline=%!MyTabLine()
set guitabtooltip=%F                           " Set up tab tooltips with each buffer name
set number                                     " Show line numbers
set shortmess=atI                              " Avoids hit enter
set formatoptions+=rnlmM                       " Optimize format options
set nowrap                                     " Set nowrap
set backspace=indent,eol,start                 " Make backspaces delete sensibly
set scrolloff=3                                " Minimum lines to keep above and below cursor
set sidescroll=1                               " Minimal number of columns to scroll horizontally
set sidescrolloff=10                           " Minimal number of screen columns to keep away from cursor
set tabpagemax=15                              " Only show 15 tabs
set showmode                                   " Display the current mode
set cursorline                                 " Highlight current line
set backspace=indent,eol,start                 " Backspace for dummies
set linespace=0                                " No extra spaces between rows
set number                                     " Line numbers on
set showmatch                                  " Show matching brackets/parenthesis
set wildmenu                                   " Show list instead of just completing
set wildmode=list:longest,full                 " Command <Tab> completion, list matches, then longest common part, then all.
" set foldenable                               " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                                 " Indent at the same level of the previous line
set expandtab                                  " Tabs are spaces, not tabs
set smarttab                                   " Smarttab
set shiftwidth=4                               " Use indents of 4 spaces
set tabstop=4                                  " An indentation every four columns
set softtabstop=4                              " Let backspace delete indent
set nojoinspaces                               " Prevents inserting two spaces after punctuation on a join (J)
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
