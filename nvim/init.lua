require('options')
require('keymap')
require('plugins')

local private_config_available, private_config = pcall(require, "private")
if private_config_available then
  require('private')
end
