Plug 'reedes/vim-pencil'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType textile      call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'
