-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Nice keymaps from https://www.youtube.com/watch?v=CuWfgiwI73Q&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=3
vim.keymap.set("n", "<leader>mx", ":.lua<CR>") -- run current line in vim
vim.keymap.set("v", "<leader>mx", ":lua<CR>") -- run highlighted lines in vim
vim.keymap.set("v", "<leader>ms", ":source %<CR>")

-- NOLINT helper: extracts clang-tidy check names from LSP diagnostics on given lines
local function get_clang_tidy_checks(bufnr, start_line, end_line)
  local checks = {}
  local seen = {}

  local function add_check(check)
    if check and type(check) == "string" and check:match("%-") and not seen[check] then
      seen[check] = true
      table.insert(checks, check)
    end
  end

  for line = start_line, end_line do
    local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
    for _, diag in ipairs(diagnostics) do
      -- Extract from diag.code (primary source)
      add_check(diag.code)
      -- Also extract check names from message, e.g. [hicpp-vararg]
      if diag.message then
        for match in diag.message:gmatch("%[([%w%-%.]+)%]") do
          add_check(match)
        end
      end
    end
  end

  table.sort(checks)
  return checks
end

local function build_nolint_comment(prefix, checks)
  if #checks > 0 then
    return "// " .. prefix .. "(" .. table.concat(checks, ", ") .. ")"
  end
  return "// " .. prefix
end

-- Normal mode: add NOLINTNEXTLINE above current line with diagnostics from that line
vim.keymap.set("n", "<leader>cn", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local indent = vim.api.nvim_get_current_line():match("^(%s*)")
  local checks = get_clang_tidy_checks(bufnr, row, row)
  local comment = indent .. build_nolint_comment("NOLINTNEXTLINE", checks)
  vim.api.nvim_buf_set_lines(bufnr, row, row, false, { comment })
end, { desc = "NOLINTNEXTLINE with diagnostics" })

-- Visual mode: wrap selection with NOLINTBEGIN/END collecting all diagnostics
vim.keymap.set("v", "<leader>cn", function()
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  vim.schedule(function()
    local bufnr = vim.api.nvim_get_current_buf()
    local start_line = vim.api.nvim_buf_get_mark(bufnr, "<")[1] - 1
    local end_line = vim.api.nvim_buf_get_mark(bufnr, ">")[1] - 1
    local start_text = vim.api.nvim_buf_get_lines(bufnr, start_line, start_line + 1, false)[1]
    local indent = start_text:match("^(%s*)")
    local checks = get_clang_tidy_checks(bufnr, start_line, end_line)
    local check_suffix = #checks > 0 and ("(" .. table.concat(checks, ", ") .. ")") or ""

    vim.api.nvim_buf_set_lines(bufnr, end_line + 1, end_line + 1, false, {
      indent .. "// NOLINTEND" .. check_suffix,
    })
    vim.api.nvim_buf_set_lines(bufnr, start_line, start_line, false, {
      indent .. "// NOLINTBEGIN" .. check_suffix,
    })
  end)
end, { desc = "Wrap selection with NOLINTBEGIN/END" })

-- Must be last lines in this file
if pcall(require, "private.keymaps") then
  require("private.keymaps")
end
