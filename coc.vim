Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

set hidden
set nobackup
set nowritebackup

" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : "\<TAB>" 

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup coc_autos
  au!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

function! Check_floating_window_and_doHover()
  if coc#util#has_float()
    return
  else
    call CocActionAsync('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codelens-action)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <F2> <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> K :call CocActionAsync('doHover')<CR>

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent> <leader>cy  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>


let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
vmap <C-j> <Plug>(coc-snippets-select)
set completeopt=noinsert,menuone,noselect
set shortmess+=c

imap <c-m> <Plug>(coc-snippets-expand-jump)
vmap <c-m> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<c-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y>"


inoremap <expr><c-d> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(1) : "\<c-d>"
inoremap <expr><c-u> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(0) : "\<c-u>"
nnoremap <expr><c-d> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(1) : "\<c-d>"
nnoremap <expr><c-u> coc#util#has_float() && coc#util#float_scrollable() ? coc#util#float_scroll(0) : "\<c-u>"


let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-word', 
      \ 'coc-vimlsp', 
      \ 'coc-tag',
      \ 'coc-json',
      \ 'coc-emoji',
      \ 'coc-prettier',
      \ 'coc-emoji',
      \ 'coc-emmet',
      \ 'coc-dictionary',
      \ 'coc-diagnostic',
      \ 'coc-yaml',
      \ 'coc-pairs',
      \ 'coc-rust-analyzer',
      \ ]

if executable('flutter') || executable('flutter.exe')
    let g:coc_global_extensions += ['coc-flutter']
endif

autocmd FileType markdown,vimwiki,wiki,md let b:coc_pairs_disabled = ['`']
inoremap <silent> <cr> <C-g>u<CR><c-r>=coc#on_enter()<CR>
