Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
if has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'Shougo/neco-vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim'
set shortmess+=c

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"

imap <c-space> <Plug>(asyncomplete_force_refresh)

augroup acc
  au!
  au VimEnter * call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ 'config': {
        \    'max_buffer_size': 5000000,
        \  },
        \ }))

  au VimEnter * call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
        \ 'name': 'emoji', 
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#emoji#completor'),
        \ }))

  au VimEnter * call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
        \ 'name': 'tags',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#tags#completor'),
        \ 'config': {
        \    'max_file_size': 50000000,
        \  },
        \ }))

  au VimEnter * call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
        \ 'name': 'necovim',
        \ 'whitelist': ['vim'],
        \ 'completor': function('asyncomplete#sources#necovim#completor'),
        \ }))
augroup end


if has('python3')
  let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
  let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  inoremap <expr> <C-y> pumvisible() && UltiSnips#SnippetsInCurrentScope() ? asyncomplete#close_popup() && "\<Plug>(ultisnips_expand)" :
        \ pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
  au VimEnter * call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif
