if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

nnoremap <Space> <nop>
let mapleader = " "

call plug#begin()
source $HOME/.config/nvim/ultisnips.vim
source $HOME/.config/nvim/gruvbox.vim
source $HOME/.config/nvim/airline.vim
" source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vimgo.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/rust.vim
source $HOME/.config/nvim/clip.vim
source $HOME/.config/nvim/fern.vim
source $HOME/.config/nvim/gutentags.vim
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'gcmt/wildfire.vim' " Enter key
Plug 'wellle/targets.vim' " enhance default motions
Plug 'kana/vim-textobj-entire' " buffer select. e motion key
Plug 'sgur/vim-textobj-parameter' " argument select. a motion key
Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html property select. x motion key
Plug 'Julian/vim-textobj-variable-segment' " camelcase & snakecase select. v motion key
Plug 'kana/vim-textobj-line' " select line. l motion key

" Statistics
Plug 'wakatime/vim-wakatime'

" Docs
source $HOME/.config/nvim/wiki.vim
call plug#end()

source $HOME/.config/nvim/base.vim


let g:EditorConfig_exclude_patterns = ['fugitive://.*']

