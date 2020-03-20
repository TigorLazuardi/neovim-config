Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', '.yaml', 'package.json', 'cargo.toml', 'go.mod']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
