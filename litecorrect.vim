Plug 'reedes/vim-litecorrect'

let user_dict = {
  \ 'maybe': ['mabye'],
  \ 'medieval': ['medival', 'mediaeval', 'medevil'],
  \ 'then': ['hten'],
  \ }


augroup litecorrect
  autocmd!
  autocmd FileType markdown call litecorrect#init(user_dict)
  autocmd FileType textile call litecorrect#init(user_dict)
  autocmd FileType text call litecorrect#init(user_dict)
augroup END

