Plug 'ludovicchabant/vim-gutentags'

let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
            \ }
let g:gutentags_ctags_tagfile = '.tags'

