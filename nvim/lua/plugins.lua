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
  -- use {
  --   {
  --     'hrsh7th/nvim-cmp',
  --     requires = {
  --       'onsails/lspkind-nvim',
  --       'L3MON4D3/LuaSnip',
  --       'hrsh7th/cmp-buffer',
  --       'hrsh7th/cmp-nvim-lua',
  --       'hrsh7th/cmp-nvim-lsp',
  --       'hrsh7th/cmp-path',
  --       'saadparwaiz1/cmp_luasnip',
  --       'rafamadriz/friendly-snippets'
  --     },
  --     config = [[require('config.cmp')]]
  --   },
    -- {
    --   'L3MON4D3/LuaSnip',
    --   config = [[require('config.luasnip')]]
    -- }
  -- }

  -- indentation
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = [[require('config.indent-blankline')]]
  }

  -- treesitter
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   requires = {"p00f/nvim-ts-rainbow"},
  --   config = [[require('config.treesitter')]],
  --   run = ':TSUpdate'
  -- }

  -- git
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = [[require('config.gitsigns')]]
  -- }

  -- movement
  use {
    'justinmk/vim-sneak',
    config = [[require('config.sneak')]]
  }

  -- Package Manager
  -- use {'williamboman/mason.nvim'}
  -- use {
  --   'WhoIsSethDaniel/mason-tool-installer.nvim',
  --   config = [[require('config.mason-tool-installer')]],
  --   requires = {'williamboman/mason.nvim'}
  -- }
  
  -- LSP
  -- use {'williamboman/mason-lspconfig.nvim'}
  -- use {'neovim/nvim-lspconfig'}
  -- use {'jose-elias-alvarez/null-ls.nvim'}
  -- use {
  --   'folke/trouble.nvim',
  --   config = function()
  --     require("trouble").setup {}
  --     vim.api.nvim_exec([[nmap <F12> :TroubleToggle document_diagnostics<CR>]], false)
  --   end
  -- }

  -- others
  use {'machakann/vim-highlightedyank'}
  use {'nelstrom/vim-visual-star-search'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  -- use({
  --   "iamcco/markdown-preview.nvim",
  --   run = function() vim.fn["mkdp#util#install"]() end,
  -- })
  use {
    'kyazdani42/nvim-web-devicons',
    conifg = function()
      require'nvim-web-devicons'.setup {}
    end
  }

  -- private plugins
  -- private plugins needs to be available in private.plugins.lua.
  -- It must contain a get_plugins fuction which returns a valid packer config as table.
  local private_config_available, private_config = pcall(require, "private.plugins")
  if private_config_available then
    local private_plugins = private_config.get_plugins()
    for _, plugin in ipairs(private_plugins) do
      use(plugin)
    end
  end

end,
-- config packer to use floating window
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

