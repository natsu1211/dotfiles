nnoremap <silent> <F5> :QuickRun -mode n -outputter quickfix<CR>
vnoremap <silent> <F5> :QuickRun -mode v -outputter quickfix<CR>
let g:quickrun_config = {}
let g:quickrun_config['cpp/clang++1z'] = {
            \ 'cmdopt': '--std=c++1z --stdlib=libc++',
            \ 'type': 'cpp/clang++'
            \ }
let g:quickrun_config['cpp'] = {'type': 'cpp/clang++1z'}
let g:quickrun_config['_'] = {
      \  'split' : '',
      \  'runner' : 'vimproc',
      \  'runner/vimproc/updatetime' : 60
      \}
