Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'svermeulen/ncm2-yoink'
Plug 'ncm2/float-preview.nvim'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-github'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'yuki-ycino/ncm2-dictionary'

if has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'ncm2/ncm2-ultisnips'
endif

augroup ncm2autoload
  au! 
  autocmd BufEnter * call ncm2#enable_for_buffer()
augroup end

set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>

" augroup ultisnips_config
"   au!
"   au TextChangedI * call ncm2#auto_trigger()
" augroup END


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:float_preview#docked = 1
let g:ncm2#popup_limit = 10
let g:ncm2#total_popup_limit = 20

augroup config_of_ncm2
  au!
  au VimEnter * let g:ncm2_github#emoji_source = extend(
			\ get(g:, 'ncm2_github#emoji_source', {}), {
            \ 'name': 'github-emoji',
            \ 'scope': ['markdown'],
            \ 'priority': 8,
            \ 'mark': 'gh',
            \ 'on_complete': 'ncm2_github#on_complete_emoji',
            \ 'word_pattern': ':[\w+-]*:?',
            \ 'complete_length': 2,
            \ }, 'keep')
augroup end
if has('python3')
  let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
  let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  imap <silent> <expr> <C-y> pumvisible() ? ncm2_ultisnips#expand_or("\<C-y>", 'n') : "\<C-y>"
endif
