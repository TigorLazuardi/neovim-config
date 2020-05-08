if executable('cargo') || executable('cargo.exe')
    Plug 'rust-lang/rust.vim'

    nnoremap <expr><silent><F5> &filetype == "rust" ? ":make run<CR>" :
        \ &filetype == "javascript" ? ":! node %<CR>" : "\<nop>" 
    nnoremap <expr><silent><S-F5> &filetype == "rust" ? ":make test<CR>" : "\<nop>"
endif
