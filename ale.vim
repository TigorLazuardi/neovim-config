Plug 'dense-analysis/ale'

let g:ale_sign_highlight_linenrs = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '🔧 '
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚡'
let g:ale_sign_info = '🔧'

let g:ale_linters = {'rust': ['rls']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ 'rust': ['rustfmt'],
  \ 'go': ['gofmt']
  \}

" let g:ale_go_gofmt_options = "goimports"
nmap <silent> ge <Plug>(ale_next_wrap)
nmap <silent> gE <Plug>(ale_previous_wrap)
