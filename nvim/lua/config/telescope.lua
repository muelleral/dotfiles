local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- telescope.load_extension('fzf')
-- telescope.load_extension('neoclip')

vim.keymap.set("n", "<leader>ff", '<Cmd>Telescope find_files<CR>', {silent = true})
vim.keymap.set("n", "<leader>fa", '<Cmd>Telescope find_files hidden=true no_ignore=true<CR>', {silent = true})
vim.keymap.set("n", "<leader>fg", '<Cmd>Telescope grep_string<CR>', {silent = true})
vim.keymap.set("v", "<leader>fg", '"zy:Telescope grep_string default_text=<C-r>z<CR>', {silent = true})
vim.keymap.set("n", "<leader>flg", '<Cmd>Telescope live_grep<CR>', {silent = true})
vim.keymap.set("n", "<leader>fb", '<Cmd>Telescope buffers<CR>', {silent = true})
vim.keymap.set("n", "<leader>fs", '<Cmd>Telescope spell_suggest<CR>', {silent = true})
vim.keymap.set("n", "<leader>ft", '<Cmd>Telescope<CR>', {silent = true})

-- call neoclip with plus argument to copy selection to plus register which
-- is the shared register on WSL https://github.com/AckslD/nvim-neoclip.lua#usage
-- vim.keymap.set("n", "<space>p", '<Cmd>Telescope neoclip<CR>', {silent = true})
