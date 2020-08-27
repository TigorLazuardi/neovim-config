if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let $CONFIG = '$HOME/.config/nvim'

autocmd VimEnter * map , <nop>
let mapleader = ","

if exists('g:vscode')
 " VS code vim
  call plug#begin()
  Plug 'tpope/vim-surround'
  " Text Objects
  Plug 'kana/vim-textobj-user'
  Plug 'gcmt/wildfire.vim' " Enter key
  Plug 'wellle/targets.vim' " enhance default motions
  Plug 'kana/vim-textobj-entire' " buffer select. e motion key
  Plug 'sgur/vim-textobj-parameter' " argument select. a motion key
  Plug 'whatyouhide/vim-textobj-xmlattr' " xml/html property select. x motion key
  Plug 'Julian/vim-textobj-variable-segment' " camelcase & snakecase select. v motion key
  Plug 'kana/vim-textobj-line' " select line. l motion key

  " Finds now search multi-lines and not just current line
  Plug 'dahu/vim-fanfingtastic'

  " Text multi-line auto spacing.
  Plug 'godlygeek/tabular'

  " Expands find and replace to something magical
  Plug 'tpope/vim-abolish'
  " source $CONFIG/clip.vim

  " Repeat some plugin commands with '.'
  Plug 'tpope/vim-repeat'

  " Clipboard Management
  Plug 'svermeulen/vim-subversive'
  Plug 'svermeulen/vim-yoink'
  Plug 'svermeulen/vim-cutlass'

  call plug#end()

  set clipboard=unnamedplus
  set autoread "Auto reload file if there's outside edit"
  set backspace=indent,eol,start "you may backspace over indentation, endofline, startofline"
  set ignorecase "When searching, make the search case insensitive
  set hlsearch "When searching, the text is highlighted
  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)
  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  nmap S <plug>(SubversiveSubstituteToEndOfLine)
  "
  nnoremap <A-k> :<C-u>m .-2<CR>==
  nnoremap <A-j> :<C-u>m .+1<CR>==
  vnoremap <A-j> :<C-u>'<,'>m '>+1<CR>gv=gv
  vnoremap <A-k> :<C-u>'<,'>m '<-2<CR>gv=gv

  nnoremap x d
  xnoremap x d

  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  nnoremap xx dd
  nnoremap X D
  nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  nnoremap <silent> gn :<C-u>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
  nnoremap <silent> gp :<C-u>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
  nnoremap <silent> gr :<C-u>call VSCodeNotify('goToNextReference')<CR>
  nnoremap <silent> gR :<C-u>call VSCodeNotify('goToPreviousReference')<CR>
  nnoremap <silent> gl :<C-u>call VSCodeNotify('editor.action.openLink')<CR>
  nnoremap <silent> gh :<C-u>call VSCodeNotify('closeMarkersNavigation')<CR>
  nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>

else
    " Ordinary NVIM
    call plug#begin()
    " Snippets
    source $CONFIG/ultisnips.vim

    source $CONFIG/theme.vim

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

    source $CONFIG/surround.vim

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

    " For some coding respect with other devs
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

    source $CONFIG/floaterm.vim

    source $CONFIG/ale.vim

    call plug#end()

    source $CONFIG/base.vim

endif

