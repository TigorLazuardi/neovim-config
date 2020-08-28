Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

nnoremap <silent> <leader>e :Fern . -reveal=% -drawer -toggle<CR>
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#drawer_width = 40


function! s:init_fern() abort
  " Write custom code here
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> y <Plug>(fern-action-clipboard-copy)
  nmap <buffer> x <Plug>(fern-action-clipboard-move)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
  nmap <buffer> i <Plug>(fern-action-rename:bottom)
  nmap <buffer> e <Plug>(fern-action-open:select)
  nmap <buffer> <F3> <Plug>(fern-action-grep)
  nnoremap <buffer> <C-J> <C-W><C-J>
  nnoremap <buffer> <C-K> <C-W><C-K>
  nnoremap <buffer> <C-L> <C-W><C-L>
  nnoremap <buffer> <C-H> <C-W><C-H>
endfunction

augroup my-fern
  autocmd!
  au FileType fern setlocal nonumber
  au FileType fern call glyph_palette#apply()
  au FileType fern setlocal signcolumn=no
  au FileType fern call s:init_fern()
augroup END
