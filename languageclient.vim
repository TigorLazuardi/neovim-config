Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


let g:LanguageClient_serverCommands = {
  \ 'rust': ['rls'],
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
  \ 'go': ['~/go/bin/gopls']
  \ }

set updatetime=500

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
  " autocmd User LanguageClientStarted :autocmd CursorHold * silent! call LanguageClient#textDocument_hover()
  " autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
  " autocmd User LanguageClientStarted :autocmd CursorHold * silent! call LanguageClient#textDocument_documentHighlight()
augroup end 

" au BufWritePre * silent! call LanguageClient#textDocument_formatting()
" au BufEnter * silent! call LanguageClient#textDocument_codeLens()
" au BufWritePost * silent! call LanguageClient#textDocument_codeLens()
set signcolumn=yes


function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <F1> :call LanguageClient_contextMenu()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    " " Or map each action separately
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> gi :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <silent> ga :call LanguageClient#handleCodeLensAction()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

let g:LanguageClient_hoverPreview = "Always"

let g:LanguageClient_completionPreferTextEdit = 1
" let g:LanguageClient_diagnosticsSignsMax = 0

" set completefunc=LanguageClient#complete

let g:LanguageClient_loadSettings = 1
let g:LanguaClient_settingsPath = "/home/tigor/.config/nvim/languageclient.json"
" let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_useVirtualText = "All"

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
