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
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup END

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codelens-action)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <F2> <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> K :call CocActionAsync('doHover')<CR>
" nmap <silent> <leader>e :CocCommand explorer
"       \ --toggle
"       \<CR>
      " \ --sources=buffer-,file+
      " \ --file-columns=git:selection:clip:diagnosticError:indent:icon:filename;fullpath;size;modified;readonly

" Use `:Format` to format current buffer
command! -nargs=0 Fmt :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fd :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent> <leader>cy  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>cs  :<C-u>CocCommand snippets.editSnippets<cr>
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


" Enables doHover at startup
augroup HoverSymbol
  au!
  autocmd CursorHold * silent call CocActionAsync('doHover')
augroup END


function! ToggleSymbolHover()
    " Switch the toggle variable
    let g:ToggleSymbolHover = !get(g:, 'ToggleSymbolHover', 1)

    " Reset group
    augroup HoverSymbol
        autocmd!
    augroup END
    if !g:ToggleSymbolHover
      echo "[Message] Coc hover disabled"
    endif
    " Enable if toggled on
    if g:ToggleSymbolHover
        augroup HoverSymbol
          autocmd CursorHold * silent call CocActionAsync('doHover')
        augroup END
        echo "[Message] Coc hover enabled"
    endif
endfunction

nnoremap <F4> :call ToggleSymbolHover()<CR>

imap <c-m> <Plug>(coc-snippets-expand-jump)
vmap <c-m> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


inoremap <silent><expr> <c-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<c-w><c-l>" :
      \ coc#refresh()

let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-word', 
      \ 'coc-vimlsp', 
      \ 'coc-ultisnips',
      \ 'coc-tag',
      \ 'coc-json',
      \ 'coc-emoji',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-go',
      \ 'coc-emoji',
      \ 'coc-emmet',
      \ 'coc-dictionary',
      \ 'coc-diagnostics',
      \ 'coc-yaml',
      \ 'coc-pairs'
      \ ]

autocmd FileType markdown let b:coc_pairs_disabled = ['`']
inoremap <silent> <cr> <C-g>u<CR><c-r>=coc#on_enter()<CR>
