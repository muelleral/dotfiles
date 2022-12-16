require('options')
require('keymap')
require('commands')
require('plugins')
-- require('mason').setup() -- make sure mason setup is called before lspconfig
-- require('config.lsp')

local private_config_available, private_config = pcall(require, "private")
if private_config_available then
  require('private')
end
