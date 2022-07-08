return require("packer").startup({function(use)
  use 'wbthomason/packer.nvim'
  use "lewis6991/impatient.nvim" -- speeds up nvim start

  -- colorscheme
  use {"EdenEast/nightfox.nvim", config = function() vim.cmd [[colorscheme nordfox]] end}

  -- Search
  use {
		{
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-lua/popup.nvim',
				'telescope-fzf-native.nvim'
			},
			config =[[require('config.telescope')]]
		},
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		},
		{
			'AckslD/nvim-neoclip.lua',
			config = function()
				-- yank to plus register to see yank history. 
				-- Is required cause i use plus as nvim default register for yank/put
				require("neoclip").setup({default_register={'+'}})
			end
		}
}

end,
-- config packer to use floating window
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

