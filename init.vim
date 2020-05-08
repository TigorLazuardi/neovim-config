" Auto Install vim-plug Windows. curl required
if has('win32') || has('win64')
  if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
    silent !curl -fLo "~/AppData/Local/nvim/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  let $CONFIG = '~/AppData/Local/nvim'
endif

" Auto Install vim-plug Unix. curl required
if has('unix')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  let $CONFIG = '$HOME/.config/nvim'
endif

" Auto install missing plugins
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

nnoremap <Space> <nop>
let mapleader = " "

call plug#begin()
" Snippets
source $CONFIG/ultisnips.vim

" Theme
source $CONFIG/gruvbox.vim

" Airline
source $CONFIG/airline.vim

" Auto-completion
source $CONFIG/coc.vim

" Go support. Run :PlugInstall manually after having go sdk installed and added to $PATH
source $CONFIG/vimgo.vim

" FZF support. May not work properly on Windows Subsytem for Linux
source $CONFIG/fzf.vim

" Rust support. Need cargo installed first then run :PlugInstall
source $CONFIG/rust.vim

" Clipboard management. Delete no longer adds to clipboard and clipboard syncs with CLIPBOARD and no
" longer with PRIMARY
source $CONFIG/clip.vim

" File Explorer. Key: <leader>e
source $CONFIG/fern.vim

" Tags generator
source $CONFIG/gutentags.vim

" Txt support
source $CONFIG/prose.vim

" Unix shell commands sugars. Check ':h eunuch'
Plug 'tpope/vim-eunuch'

" Surrounds text objexts.
Plug 'tpope/vim-surround'

" Syntax coloring
Plug 'sheerun/vim-polyglot'

" Git integration
Plug 'tpope/vim-fugitive'

" Easy commenting
Plug 'tpope/vim-commentary'

" Git signs next to line numbers
Plug 'airblade/vim-gitgutter'

" Repeat some plugin commands with '.'
Plug 'tpope/vim-repeat'

" Vim dev icons
Plug 'ryanoasis/vim-devicons'

" For some respect with other devs
source $CONFIG/editorconfig.vim

" Finds now search multi-lines and not just current line
Plug 'dahu/vim-fanfingtastic'

" Text multi-line auto spacing.
Plug 'godlygeek/tabular'

" Expands find and replace to something magical
Plug 'tpope/vim-abolish'

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
source $CONFIG/wiki.vim
call plug#end()

source $CONFIG/base.vim

