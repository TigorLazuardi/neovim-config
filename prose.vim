" Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-textobj-sentence' " Motion Key 's'
Plug 'jdelkins/vim-correction'

function! Prose()

  call lexical#init()
  call litecorrect#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  " map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  " map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  " noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  " xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  " inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

  " let g:pencil#wrapModeDefault = 'soft'
  let g:lexical#spell = 1
  let g:lexical#spelllang = ['en_us','id_ID',]
  let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/words.txt']
  let g:lexical#dictionary = ['/usr/share/dict/words',]
  " let g:textobj#quote#doubleMotion = 'q'
  " let g:textobj#quote#singleMotion = 'Q'
  set spell

endfunction

" automatically initialize buffer by file type
autocmd FileType text,textile call Prose()

