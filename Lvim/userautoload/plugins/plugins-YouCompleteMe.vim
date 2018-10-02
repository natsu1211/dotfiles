let g:acp_enableAtStartup = 0
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_python_interpreter_path = '/Users/long/.anyenv/envs/pyenv/shims/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
      \  'g:ycm_python_interpreter_path',
      \  'g:ycm_python_sys_path',
      \]
let g:ycm_confirm_extra_conf = 0
" rust support
let g:ycm_rust_src_path = "~/github/rust/src"
" key mapping
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
