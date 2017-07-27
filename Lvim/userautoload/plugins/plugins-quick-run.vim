nnoremap <silent> <F5> :QuickRun -mode n<CR>
vnoremap <silent> <F5> :QuickRun -mode v<CR>
let g:quickrun_config = {}
let g:quickrun_config['cpp/clang++1z'] = {
            \ 'cmdopt': '--std=c++1z --stdlib=libc++',
            \ 'type': 'cpp/clang++'
            \ }
let g:quickrun_config['cpp'] = {'type': 'cpp/clang++1z'}
