let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
call deoplete#custom#option({
      \ 'sources': [],
      \ 'auto_complete_delay': 10,
      \ 'smart_case': v:true,
      \ })

" deoplete.nvim recommend
set completeopt+=noselect
" Skip the check of neovim module
let g:python3_host_skip_check = 1
" deoplete-go settings
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" multiple-cursors workaround
function g:Multiple_cursors_before()
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
  call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction

" disable when editing c famliy files (using YCM)
autocmd FileType c,cpp,objc,objcpp call deoplete#custom#buffer_option('auto_complete', v:false)

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
