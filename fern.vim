Plug 'lambdalisue/fern.vim'

nnoremap <silent> <leader>e :Fern . -reveal=% -drawer -toggle<CR>
let g:fern#renderer = "devicons"
let g:fern#default_hidden = 1
let g:fern#drawer_width = 40
