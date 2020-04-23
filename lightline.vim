Plug 'itchyny/lightline.vim'
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'none',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
