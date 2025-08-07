-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Nice keymaps from https://www.youtube.com/watch?v=CuWfgiwI73Q&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=3
vim.keymap.set("n", "<leader>mx", ":.lua<CR>") -- run current line in vim
vim.keymap.set("v", "<leader>mx", ":lua<CR>") -- run highlighted lines in vim
vim.keymap.set("v", "<leader>ms", ":source %<CR>")

-- Must be last lines in this file
if pcall(require, "private.keymaps") then
  require("private.keymaps")
end
