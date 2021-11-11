call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('nvim-telescope/telescope.nvim')

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>ft <cmd>Telescope<cr>
nnoremap <leader>fp <cmd>Telescope project<cr>
" call neoclip with plus argument to copy selection to plus register which 
" is the shared register on WSL https://github.com/AckslD/nvim-neoclip.lua#usage
nnoremap <space>p <cmd>Telescope neoclip plus<cr>

" ================== Extensions ==================
call minpac#add('nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'})
lua require('telescope').load_extension('fzf')

call minpac#add('AckslD/nvim-neoclip.lua')
lua require('telescope').load_extension('neoclip')
" yank to plus register to see yank history. 
" Is required cause i use plus as nvim default register for yank/put
lua require('neoclip').setup({default_register={'+'}})

call minpac#add('nvim-telescope/telescope-project.nvim')
lua require('telescope').load_extension('project')

