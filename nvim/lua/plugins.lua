return require("packer").startup({function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins here
  use "lewis6991/impatient.nvim"
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

