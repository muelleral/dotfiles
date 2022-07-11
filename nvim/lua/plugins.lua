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
    -- statusline
  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = [[require('config.lualine')]]
  }

  -- terminal
  use {
    'voldikss/vim-floaterm',
    config = [[require('config.floaterm')]]
  }

  -- completion
  use {
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'onsails/lspkind-nvim',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets'
      },
      config = [[require('config.cmp')]]
    },
    {
      'L3MON4D3/LuaSnip',
      config = [[require('config.luasnip')]]
    }
  }

  -- indentation
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require('config.indent-blankline')]]
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {"p00f/nvim-ts-rainbow"},
    config = [[require('config.treesitter')]],
    run = ':TSUpdate'
  }
end,
-- config packer to use floating window
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

