" Theme loader
Plug 'reedes/vim-thematic'

" Airline
Plug 'vim-airline/vim-airline'

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set shortmess+=F "Surpress editing file info message"

" Removes all those pesky redundant infos on bottom of the screen
set noshowmode 
set noshowcmd
set nomodeline

" Theme Config
let g:gruvbox_italic=1
" let g:molokai_original = 1

" Theme Registry
let g:thematic#themes = {
      \ 'gruvbox'     :{'colorscheme': 'gruvbox',
      \                 'background': 'dark',
      \                 'airline-theme': 'gruvbox',
      \                 'transparency': 100,
      \                 'sign-column-color-fix': 1,
      \                },
      \ 'molokai'     :{'colorscheme': 'molokai',
      \                 'background': 'dark',
      \                 'airline-theme': 'molokai',
      \                },
      \ 'base16'      :{'colorscheme': 'base16-default-dark',
      \                 'background': 'dark',
      \                 'airline-theme': 'base16',
      \                },
      \ 'jellybeans'  :{'colorscheme': 'jellybeans',
      \                 'background': 'dark',
      \                 'airline-theme': 'jellybeans',
      \                },
      \ 'lucius'      :{'colorscheme': 'lucius',
      \                 'background': 'dark',
      \                 'airline-theme': 'lucius',
      \                },
      \ 'oceanicnext' :{'colorscheme': 'OceanicNext',
      \                 'background': 'dark',
      \                 'airline-theme': 'oceanicnext',
      \                },
      \ 'solarized'   :{'colorscheme': 'base16-solarized-dark',
      \                 'background': 'dark',
      \                 'airline-theme': 'base16_solarized',
      \                },
      \ 'iceberg'     :{'colorscheme': 'iceberg',
      \                 'background': 'dark',
      \                 'airline-theme': 'iceberg',
      \                },
      \ 'dracula'     :{'colorscheme': 'dracula',
      \                 'background': 'dark',
      \                 'airline-theme': 'dracula',
      \                },
      \ }


autocmd VimEnter * :ThematicRandom

