Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set shortmess+=F "Surpress editing file info message"

" Removes all those pesky redundant infos on bottom of the screen
set noshowmode 
set noshowcmd
set nomodeline

autocmd VimEnter * :AirlineTheme gruvbox
