Plug 'dense-analysis/ale'

let g:ale_disable_lsp = 1
" let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet']}
let g:ale_go_gofmt_options = "-s"
let g:ale_go_golangci_lint_package = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

nmap <silent> gp <Plug>(ale_previous_wrap)
nmap <silent> gn <Plug>(ale_next_wrap)
