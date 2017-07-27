nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
" set undo file location
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
