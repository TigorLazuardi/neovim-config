Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'svermeulen/ncm2-yoink'
Plug 'ncm2/float-preview.nvim'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-github'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'yuki-ycino/ncm2-dictionary'
" Plug 'ncm2/ncm2-match-highlight'
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
augroup ncm2autoload
  au! 
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " autocmd BufEnter * call ncm2#override_source('ultisnips', {'priority': 1})
augroup end

set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>

augroup ultisnips_config
  au!
  au TextChangedI * call ncm2#auto_trigger()
augroup END


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

imap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<Plug>delimitMateCR" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<Plug>delimitMateCR" ))
