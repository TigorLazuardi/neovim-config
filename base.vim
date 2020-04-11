set nocompatible "Remove compability with older versions.
set ignorecase "When searching, make the search case insensitive
set hlsearch "When searching, the text is highlighted
set tabstop=2 "2 spaces when pressing tab.
set softtabstop=2 "Same as above"
set expandtab "Same as above
set shiftwidth=2 "If there's a matching bracket, vim will put it properly"
set shiftround "An extension of above"
set autoindent "When you press enter on a tabbed line, Next line is idented properly"
set smartindent "Indent enhancement"
set smarttab "tab enhancement"
set textwidth=100 "The text width before vim wraps the line"
set clipboard=unnamedplus "Make vim able to copy and paste from outside vim"
set encoding=utf8 "Enforces utf-8"
set guifont=DejavuSansMono\ Nerd\ Font\ Mono "You may want to delete this if you don't have the font"
set cursorline "Highlight where your current line is"
set termguicolors
set timeoutlen=1000 "Set delay between input commands before trigger"
set updatetime=500 "Time before vim is refreshed. Default 4000, the stronger your pc, the lower you may set it."
set display+=lastline "Never shortens messages"
set linebreak "Prevent vim from wrap in the middle of a word"
set scrolloff=5 "Make sure there's at least few lines visible between cursor and edge of window. Setting to 999 will make the cursor always on middle of screen"
set autoread "Auto reload file if there's outside edit"
set backspace=indent,eol,start "you may backspace over indentation, endofline, startofline"
set backupdir=~/.vim/backup "set backup dir cache"
set formatoptions+=j "When editing a comment, and in insert mode you press enter, there's a leading comment added"
set noswapfile "Disable swap file. Makes my life easier to be honest, but make sure to save frequently"
set nrformats-=octal
set undodir=$HOME/vim/undodir "Make undo persistent between sessions"
set splitbelow "Horizontal split appears on bottom"
set splitright "Vertical split appears on right
set incsearch "Start searching before pressing enter"
" set nobackup
" set noundofile
" set nowritebackup
set directory=~/.vim/tmp
" Prevent auto enter
set formatoptions-=tc
set path+=**
set number relativenumber
set wildmenu
set wildignore+=**/node_modules/** 
set wildmode=longest:full,list:full
" Enable syntax highlighting
syntax on 

" Alt+J and Alt+K to swap lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> :m .-2<CR>==gi
inoremap <A-j> :m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Moving between vim splits without pressing Ctrl+w first. 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pressing enter in normal mode enters new line
" nnoremap <CR> o<Esc>

inoremap <c-o> <esc>A<CR> 

nnoremap <silent> <A-n> :bnext!<cr>
nnoremap <silent> <A-p> :bprev!<cr>

inoremap <silent> <A-n> <esc>:bnext!<cr>
inoremap <silent> <A-p> <esc>:bprev!<cr>

inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap kk <esc>
cnoremap jj <c-c><esc>
cnoremap jk <c-c><esc>
cnoremap kj <c-c><esc>
cnoremap kk <c-c><esc>
xnoremap <tab> <esc>
inoremap <c-[> <esc>
cnoremap <c-[> <c-c><esc>
vnoremap <c-[> <esc>

nnoremap [w :setlocal nowrap<cr>
nnoremap ]w :setlocal wrap<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap fs w! !sudo tee > /dev/null %

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Press F12 to reload config
nmap <silent><F12> :source $HOME/.config/nvim/init.vim<CR>:echo "Config reloaded"<CR>
nmap <silent><F11> :e $HOME/.config/nvim/

" Change leader key to space key
nnoremap <Space> <nop>
let mapleader = " "


" Adds Semicolon to end of line
nmap <leader>; mAA;<esc>`A

au VimEnter * inoremap <c-l> <right>
au VimEnter * inoremap <c-h> <left>

au VimEnter * hi Normal guibg=NONE ctermbg=NONE
au BufEnter * hi Normal guibg=NONE ctermbg=NONE

nmap <leader>n :e %:h/
command! -nargs=1 -complete=help H :vert help <args>
