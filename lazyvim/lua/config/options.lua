-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local keymap = vim.keymap.set
keymap("n", "<leader>yp", [[:let @+ = expand('%:p:h')<CR>]])
keymap("n", "<leader>yf", [[:let @+ = expand('%:t')<CR>]])

-- if vim.fn.has("wsl") == 1 then
if vim.fn.executable("wl-copy") == 0 then
  print("wl-clipboard not found, clipboard integration won't work")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    -- Pasting from system clipboard useng osc52 is not supported by wezterm as it could be risky.
    -- https://github.com/neovim/neovim/issues/27706
    -- https://github.com/wez/wezterm/issues/2050
    -- paste = {
    --   ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    --   ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  }
else
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    -- Pasting from system clipboard useng osc52 is not supported by wezterm as it could be risky.
    -- https://github.com/neovim/neovim/issues/27706
    -- https://github.com/wez/wezterm/issues/2050
    -- paste = {
    --   ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    --   ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    paste = {
      ["+"] = function()
        return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
      end,
      ["*"] = function()
        return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
      end,
      --   cache_enabled = true,
    },
  }
end

-- vim.g.clipboard = {
--   name = "wl-clipboard (wsl)",
--   copy = {
--     ["+"] = "wl-copy --foreground --type text/plain",
--     ["*"] = "wl-copy --foreground --primary --type text/plain",
--   },
--   paste = {
--     ["+"] = function()
--       return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
--     end,
--     ["*"] = function()
--       return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
--     end,
--   },
--   cache_enabled = true,
-- }
-- end
-- end

vim.opt.conceallevel = 1

-- Must be last lines in this file
if pcall(require, "private.options") then
  require("private.options")
end
