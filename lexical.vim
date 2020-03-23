Plug 'reedes/vim-lexical'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us','id_ID',]
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/words.txt']
let g:lexical#dictionary = ['/usr/share/dict/words',]
