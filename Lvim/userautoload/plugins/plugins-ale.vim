let g:ale_linters_explicit = 0
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'python': ['pylint'],
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'python': ['autopep8'],
\   'ruby': ['rubocop'],
\   'go': ['gofmt'],
\   'rust': ['rustfmt'],
\   'haskell': ['hlint'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'sh': ['shfmt'],
\}

let g:ale_fix_on_save = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
