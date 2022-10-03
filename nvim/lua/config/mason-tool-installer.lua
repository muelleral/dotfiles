local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status_ok then
  return
end

mason_tool_installer.setup {
  ensure_installed = {
    -- LSP
    'bash-language-server',
    'clangd',
    'cmake-language-server',
    'dockerfile-language-server',
    'json-lsp',
    'lua-language-server',
    'pyright',
    'yaml-language-server',

    -- DAP
    'cpptools',
    'debugpy',

    -- Linters and Formatter
    'black',
    'clang-format',
    'flake8',
    'isort',
    'pylint',
    'stylua',
  },
  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
}

