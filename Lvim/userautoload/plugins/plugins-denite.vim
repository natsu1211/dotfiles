" use ag
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'default_opts',
      \ ['--nocolor', '--nogroup'])

nmap <silent> <leader>dt :<C-u>Denite filetype<cr>
nmap <silent> <leader>df :<C-u>Denite file_rec<CR>
nmap <silent> <leader>db :<C-u>Denite buffer<CR>
nmap <silent> <leader>dl :<C-u>Denite line<CR>
nmap <silent> <leader>dg :<C-u>Denite grep<CR>
nmap <silent> <leader>dc :<C-u>DeniteCursorWord grep<CR>
nmap <silent> <leader>dm :<C-u>Denite file_mru<CR>
nmap <silent> <leader>dy :<C-u>Denite neoyank<CR>
nmap <silent> <leader>dr :<C-u>Denite -resume<CR>
nmap <silent> <leader>dd :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/github/dotfiles']}])<CR>
