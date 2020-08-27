Plug 'fatih/vim-go'

let g:go_doc_popup_window = 1
let g:go_snippet_engine = ''
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_code_completion_enabled = 0
let g:go_fmt_autosave = 1

let g:go_def_mapping_enabled = 0

" gopls config
let g:go_gopls_enabled = 0
let g:go_gopls_use_placeholders = 1 
let g:go_gopls_complete_unimported = 1
let g:go_gopls_deep_completion = 1
let g:go_gopls_fuzzy_matching = 1
let g:go_gopls_staticcheck = 1
let g:go_diagnostics_enabled = 1

" Highlight Config
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_echo_go_info = 0

let g:go_def_mapping_enabled = 0

let g:go_doc_keywordprg_enabled = 0

augroup goconfig
  au!
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
augroup end

nnoremap <expr><F7> &filetype == "go" ? "\:GoFillStruct<CR>" : "\<nop>"
inoremap <expr><F7> &filetype == "go" ? "\<esc>:GoFillStruct<CR>i" : "\<nop>"
