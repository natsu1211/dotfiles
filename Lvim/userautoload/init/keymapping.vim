" Fast edit the .vimrc file using ,rc
nnoremap <Leader>rc :edit "$HOME/.vim/userautoload/init/keymapping.vim"<CR>
nnoremap <Leader>src :source $MYVIMRC<CR>
" Keep search matches in the middle of the window
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv
" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" nh to close highlight
nnoremap <silent> nh :noh<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Modify all the indents
nnoremap \= gg=G

" Quick ESC
imap <C-j> <ESC>
nmap <C-j> <ESC>
xmap <C-j> <ESC>

" Next buffer
nnoremap <Leader><Leader>N :<C-u>bn<CR>
" Previous buffer
nnoremap <Leader><Leader>P :<C-u>bp<CR>
" New tab
nnoremap <Leader><Leader>t :<C-u>tabnew<CR>
" Split horizontally
nnoremap <Leader><Leader>s :<C-u>sp<CR>
" Split vertically
nnoremap <Leader><Leader>v :<C-u>vs<CR>
" Close window
nnoremap <Leader><Leader>q :<C-u>q<CR>
" Close buffer
nnoremap <Leader><Leader>d :<C-u>bd<CR>

" Stupid shift key fixes
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
