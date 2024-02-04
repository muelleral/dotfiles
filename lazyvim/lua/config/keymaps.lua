-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-A-p>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-A-P>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-A-B>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-A-M>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-A-L>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
vim.keymap.set("n", "<C-A-T>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<C-A-N>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<C-A-T>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<C-A-N>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<C-A-T>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<C-A-N>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
vim.keymap.set("n", "<C-A-D>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<C-A-R>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Must be last lines in this file
if pcall(require, "private.keymaps") then
  require("private.keymaps")
end
