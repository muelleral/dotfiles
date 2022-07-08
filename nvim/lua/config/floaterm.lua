vim.g.floaterm_height = 0.9
vim.g.floaterm_width = 0.9
vim.g.floaterm_opener = "edit" --edit will reuse buffer. Default is split

local keymap = vim.keymap.set
keymap('n', '<F5>', [[:FloatermNew lazygit --use-config-file=${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml,${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/lg_nvim_config.yml<CR>]])
keymap('n', '<F6>', [[:FloatermNew ranger<CR>]])
keymap('n', '<F7>', [[:FloatermToggle<CR>]])
keymap('t', '<F7>', [[<c-\><c-n>:FloatermToggle<CR>]])
