Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

nmap <silent> ; :Files<CR>
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

" Select Color Scheme
nnoremap <silent> [T :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

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

" command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
"       \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))
