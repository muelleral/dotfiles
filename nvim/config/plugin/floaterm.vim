call minpac#add('voldikss/vim-floaterm')

let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_opener = "edit" "edit will reuse buffer. Default is split

nmap <F7> :FloatermToggle<CR>
tnoremap <F7> <c-\><c-n>:FloatermToggle<CR>
