Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
Plug 'Shougo/echodoc.vim'

let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1
" inoremap <silent> <C-Space> <esc>:call deoplete#auto_complete()<CR>a
" imap <expr><CR> pumvisible() ? deoplete#manual_complete() : "\<C-g>u<Plug>delimitMateCR"
"
set shortmess+=c
set completeopt+=noinsert
set completeopt-=preview
set noshowmode

" autocmd VimEnter * call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:echodoc#type = "floating"

autocmd VimEnter * imap <expr><CR> pumvisible() && IsExpandable() ? UltiSnips#ExpandSnippet() : (pumvisible() ? "\<c-y>" : "\<c-g>u<Plug>delimitMateCR") 

" function UltiSnips#IsExpandable()
"   return !(
"     \ col('.') <= 1
"     \ || !empty(matchstr(getline('.'), '\%' . (col('.') - 1) . 'c\s'))
"     \ || empty(UltiSnips#SnippetsInCurrentScope())
"     \ )
" endfunction
"
  function IsExpandable()
    return !empty(UltiSnips#SnippetsInCurrentScope())
  endfunction
