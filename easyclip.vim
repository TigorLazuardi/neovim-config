Plug 'svermeulen/vim-easyclip'
nnoremap gm m
" Default mapped to 's' key
let g:EasyClipShareYanks = 1
let g:EasyClipAutoFormat = 1 
let g:EasyClipUsePasteToggleDefaults = 1
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
let g:EasyClipUseCutDefaults = 1
let g:EasyClipUseSubstituteDefaults = 1
