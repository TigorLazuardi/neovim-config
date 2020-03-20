let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround
set autoindent
set smartindent
set smarttab
set number
set wildmode=longest,list
set textwidth=100
set clipboard=unnamedplus
set encoding=utf8
set guifont=FuraCode\ Nerd\ Font
set cursorline
filetype plugin indent on
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
set completeopt-=preview
set termguicolors
set timeoutlen=2000
set updatetime=500
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=0
" set sidescrolloff=5
" set foldmethod=indent
set autoread
set backspace=indent,eol,start
set dir=$HOME/.cache/vim
set backupdir=$HOME/.cache/vim
set formatoptions+=j
set noswapfile
set nomodeline
set nrformats-=octal
" set spell
set undodir=$HOME/vim/undodir
set cmdheight=1
set background=dark
syntax on

command! -nargs=0 StructToGQL %s/\s\+\w\+\s\+\(.\)\(.\+\)\s\+`json:"\(.\+\)"`/  \3: \U\1\e\2

" Alt+J and Alt+K to swap lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> :m .-2<CR>==gi
inoremap <A-j> :m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nmap <kEnter> o<Esc>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w! !sudo tee > /dev/null %

let mapleader = "-"

call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'stephpy/vim-yaml'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'alvan/vim-closetag'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'majutsushi/tagbar'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'gosukiwi/vim-atom-dark'
Plug 'pangloss/vim-javascript'
Plug 'chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Plug 'posva/vim-vue'
" Plug 'w0rp/ale'
" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh',
"       \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'anned20/vimsence'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
" Plug 'shougo/echodoc'
call plug#end()
" colo afterglow
" colo molokai
colo gruvbox
noremap <F3> :Autoformat<CR>
nmap <F4> <Plug>(ale_fix)
" ====================================
" Airline Config
" ====================================

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:afterglow_italic_comments=1
let g:airline_solarized_bg='dark'
let g:go_fmt_command = "goimports"
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
nmap <F8> :TagbarToggle<CR>

" Airline Configs


let g:airline_section_z="%l:%c"
let g:airline_skip_empty_sections = 1

let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }
"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" ===============================
" CtrlP
" ===============================


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', '.yaml', 'package.json', 'cargo.toml', 'go.mod']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ===============================
" VimGo
" ===============================

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

let g:go_metalinter_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1

let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1

let g:go_highlight_space_tab_error = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1


let g:go_auto_type_info = 0
nnoremap <silent> <leader>a :cclose<CR>:lclose<CR>

" =================
" Deoplete and Language Server
" =================
" Deoplete Configs
" deoplete + neosnippet + autopairs changes
" let g:deoplete#enable_at_startup = 1
" let g:AutoPairsMapCR=0
" let g:deoplete#auto_complete_start_length = 2
" let g:deoplete#enable_smart_case = 1
" imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
" imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" imap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" inoremap <silent><expr> <C-Space> deoplete#manual_complete()

" Pass a dictionary to set multiple options
" call deoplete#custom_options({
" \ 'auto_complete_delay': 100,
" \ 'smart_case': v:true,
" \ })

" LanguageClient
" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_serverCommands = {
" \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
" \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
" \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
" \ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
" \ 'typescript.tsx': ['tcp://127.0.0.1:2089'],
" \ 'python': ['/usr/local/bin/pyls'],
" \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
" \ 'vue': ['vls', '--stdio'],
" \ 'json': ['json-languageserver'],
" \ 'go': ['gopls', 'serve'],
" \ 'vim': ['vim-language-server', '--stdio'],
" \ 'yaml': ['yaml-language-server', '--stdio'],
" \ 'sh': ['bash-language-server', 'start'],
" \ 'zsh': ['bash-language-server', 'start'],
" \ 'dockerfile': ['docker-langserver', '--stdio'],
" \ }

" let g:LanguageClient_autoStart = 1

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gi :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" autocmd CursorHold * call LanguageClient#textDocument_hover()

" let g:LanguageClient_useFloatingHover = 0
" =======================================
" ALe VIM
" =======================================
"

" let g:ale_fixers = {
"       \ "*": ['remove_trailing_lines', 'trim_whitespace'],
"       \ 'javascript': ['prettier','eslint'],
"       \ 'typescript': ['prettier','tslint'],
"       \}

" -----------------------------------------
"  vim-rust
"  -----------------------------------------
"
let g:rustfmt_autosave = 1

" ----
"  ECHODOC
"

" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'
" highlight link EchoDocFloat Pmenu
"
" --------------------------------------
"  COC NVIM
"  ------------------------------
"

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u<Plug>delimitMateCR"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codelens-action)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * call CocAction('doHover')
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call <SID>show_documentation()
" autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" ------------------------------
" VIM Javascript
" ---------------------------------

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"
"
" ------------------------------
"  DelimitMate
"  ---------------
"

let delimitMate_autoclose = 0
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" ---------------------------------
"  NERD TREE
" ---------------------------------

let NERDTreeShowHidden = 1
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" --------------------
" UltiSnips
" --------------------

let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsEditSplit="vertical"

" --------------------
"  Syntastic
" --------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
