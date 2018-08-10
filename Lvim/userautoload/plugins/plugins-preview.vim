noremap <C-8> :PreviewScroll -1<cr>
noremap <C-9> :PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader><C-s> :PreviewSignature!<cr> 
noremap <Leader><C-t> :PreviewTag<cr>
