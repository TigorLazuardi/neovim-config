Plug 'dense-analysis/ale'

let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

nmap <silent> gp <Plug>(ale_previous_wrap)
nmap <silent> gn <Plug>(ale_next_wrap)
