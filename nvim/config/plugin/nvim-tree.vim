call minpac#add('kyazdani42/nvim-tree.lua')
lua require("nvim-tree").setup{}

map <C-n> :NvimTreeToggle<CR>
map <A-n> :NvimTreeFindFile<CR>
