vim.g.floaterm_height = 0.95
vim.g.floaterm_width = 0.95
vim.g.floaterm_opener = "edit" --edit will reuse buffer. Default is split

local keymap = vim.keymap.set
keymap('n', '<F5>', [[:FloatermNew lazygit --use-config-file=${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml,${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/lg_nvim_config.yml<CR>]])
keymap('n', '<F6>', [[:FloatermNew ranger<CR>]])
keymap('n', '<F7>', [[:FloatermToggle<CR>]])
keymap('t', '<F7>', [[<c-\><c-n>:FloatermToggle<CR>]])

keymap('n', '<leader>tt', [[:FloatermToggle<CR>]])
keymap('t', '<leader>tt', [[<c-\><c-n>:FloatermToggle<CR>]])

keymap('n', '<leader>tn', [[:FloatermNext<CR>]])
keymap('t', '<leader>tn', [[<c-\><c-n>:FloatermNext<CR>]])

keymap('n', '<leader>tp', [[:FloatermPrev<CR>]])
keymap('t', '<leader>tp', [[<c-\><c-n>:FloatermPrev<CR>]])

keymap('n', '<leader>tc', [[:FloatermNew<CR>]])
keymap('t', '<leader>tc', [[<c-\><c-n>:FloatermNew<CR>]])

keymap('n', '<leader>tk', [[:FloatermKill<CR>]])
keymap('t', '<leader>tk', [[<c-\><c-n>:FloatermKill<CR>]])
