" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'ruby': ['solarGraph', 'stdio'],
    \ 'lua': ['lua-lsp'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'haskell': ['hie-wrapper'],
    \ 'sh' : ['bash-language-server', 'start']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
