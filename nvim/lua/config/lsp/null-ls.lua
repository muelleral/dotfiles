local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    -- cpp
    formatting.clang_format,
    -- lua
    -- python
    diagnostics.flake8,
    diagnostics.pylint,
    formatting.black,
    formatting.isort,
  },
}
