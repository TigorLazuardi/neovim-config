if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/base.vim

nnoremap <Space> <nop>
let mapleader = " "

call plug#begin()
source $HOME/.config/nvim/easymotion.vim
source $HOME/.config/nvim/sayonara.vim
source $HOME/.config/nvim/ultisnips.vim
" source $HOME/.config/nvim/deoplete.vim
source $HOME/.config/nvim/delimitMate.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/gruvbox.vim
" source $HOME/.config/nvim/languageclient.vim
" source $HOME/.config/nvim/echodoc.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/ale.vim
source $HOME/.config/nvim/vimgo.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/rust.vim
source $HOME/.config/nvim/clip.vim
source $HOME/.config/nvim/tagbar.vim
" source $HOME/.config/nvim/defx.vim
source $HOME/.config/nvim/fern.vim
source $HOME/.config/nvim/prose.vim
source $HOME/.config/nvim/gutentags.vim
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'anned20/vimsence'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
" source $HOME/.config/nvim/ncm2.vim
Plug 'editorconfig/editorconfig-vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'

" Text Objects
Plug 'gcmt/wildfire.vim' " Enter key
Plug 'wellle/targets.vim' " enhance default motions
Plug 'kana/vim-textobj-entire' " buffer select. e motion key
Plug 'sgur/vim-textobj-parameter' " argument select. a motion key
Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html property select. x motion key
Plug 'Julian/vim-textobj-variable-segment' " camelcase & snakecase select. v motion key
Plug 'kana/vim-textobj-line' " select line. l motion key
call plug#end()

" Change leader key to space key
nnoremap <Space> <nop>
let mapleader = " "


" Press F12 to reload config
nmap <silent><F12> :source $HOME/.config/nvim/init.vim<CR>:echo "Config reloaded"<CR>
nmap <silent><F11> :e /home/tigor/.config/nvim/

" Adds Semicolon to end of line
nmap <leader>; mAA;<esc>`A

nnoremap <expr><silent><F5> &filetype == "rust" ? ":make run<CR>" :
      \ &filetype == "javascript" ? ":! node %<CR>" : "\<nop>" 
nnoremap <expr><silent><S-F5> &filetype == "rust" ? ":make test<CR>" : "\<nop>"
au VimEnter * inoremap <c-l> <right>
au VimEnter * inoremap <c-h> <left>
" au VimEnter * inoremap <c-j> <down>
" au VimEnter * inoremap <c-k> <up>

au VimEnter * hi Normal guibg=NONE ctermbg=NONE
au BufEnter * hi Normal guibg=NONE ctermbg=NONE

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
