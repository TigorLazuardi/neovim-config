if !executable('fzf')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
endif
Plug 'junegunn/fzf.vim'

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

nmap <silent> ; :Buffers<CR>
nmap <silent><F3> :Rg <c-r><c-w><CR>
" Search tags
nmap ]t :Tags<CR>
" Search Tags under the cursor
nmap [t :Tags <c-r><c-w><CR> 
nmap gm :Marks<CR>

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

command! -bang -nargs=? -complete=dir HFiles
      \ call fzf#vim#files(<q-args>, {'source': 'rg --files --hidden'}, <bang>0)

" Add your path here.
let plugins_dir='~/.config/nvim/plugged' 
let preview_file = plugins_dir . "/fzf.vim/bin/preview.sh"

nnoremap <silent><leader>o :HFiles<CR>

nnoremap [f :Rg <c-r><c-w><cr>
nnoremap ]f :Rg 
" Open files in horizontal split
nnoremap <silent> ]F :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical split
nnoremap <silent> [F :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
