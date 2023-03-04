
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--leader/local leader
vim.g.mapleader = [[,]]
vim.g.maplocalleader = [[,]]

require('lazy').setup({
   "lewis6991/impatient.nvim", -- speeds up nvim start

  -- colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nordfox]])
    end,
  },


  -- Search
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' },
			config = function ()
			 require('config.telescope')
			end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },


		{
		 	'AckslD/nvim-neoclip.lua',
      dependencies = {'nvim-telescope/telescope.nvim'},
		 	config = function()
		 		-- yank to plus register to see yank history. 
		 		-- Is required ca i  plus as nvim default register for yank/put
		 		require("neoclip").setup({default_register={'+'}})
		 	end
		 },
     
  -- statusline
   {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end
  },

  -- terminal
   {
    'voldikss/vim-floaterm',
    config = function()
      require('config.floaterm')
    end
  },

  -- -- completion
   -- {
   --  {
   --    'hrsh7th/nvim-cmp',
   --    requires = {
   --      'onsails/lspkind-nvim',
   --      'L3MON4D3/LuaSnip',
   --      'hrsh7th/cmp-buffer',
   --      'hrsh7th/cmp-nvim-lua',
   --      'hrsh7th/cmp-nvim-lsp',
   --      'hrsh7th/cmp-path',
   --      'saadparwaiz1/cmp_luasnip',
   --      'rafamadriz/friendly-snippets'
   --    },
   --    config = [[require('config.cmp')]]
   --  },
   --  {
   --    'L3MON4D3/LuaSnip',
   --    config = [[require('config.luasnip')]]
   --  }
  -- }

  -- indentation
   {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require('config.indent-blankline') end
  },

  -- treesitter
   {
    'nvim-treesitter/nvim-treesitter',
    requires = {"p00f/nvim-ts-rainbow"},
    config = [[require('config.treesitter')]],
    run = ':TSUpdate'
  }

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- git
   {
    'lewis6991/gitsigns.nvim',
    config = function() require('config.gitsigns') end
  },

  -- movement
   {
    'justinmk/vim-sneak',
    config = function() require('config.sneak') end
  }

  -- -- Package Manager
   -- {'williamboman/mason.nvim'}
   -- {
   --  'WhoIsSethDaniel/mason-tool-installer.nvim',
   --  config = [[require('config.mason-tool-installer')]],
   --  requires = {'williamboman/mason.nvim'}
  -- }
  
  -- -- LSP
   -- {'williamboman/mason-lspconfig.nvim'}
   -- {'neovim/nvim-lspconfig'}
   -- {'jose-elias-alvarez/null-ls.nvim'}
   -- {
   --  'folke/trouble.nvim',
   --  config = function()
   --    require("trouble").setup {}
   --    vim.api.nvim_exec([[nmap <F12> :TroubleToggle document_diagnostics<CR>]], false)
   --  end
  -- }

   -- others
    'machakann/vim-highlightedyank',
    'nelstrom/vim-visual-star-search',
    'tpope/vim-commentary',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
  -- ({
   --  "iamcco/markdown-preview.nvim",
   --  run = function() vim.fn["mkdp#util#install"]() end,
  -- })
   -- {
   --  'kyazdani42/nvim-web-devicons',
   --  conifg = function()
   --    require'nvim-web-devicons'.setup {}
   --  end
  -- }

  -- private plugins
  -- private plugins needs to be available in private.plugins.lua.
  -- It must contain a get_plugins fuction which returns a valid packer config as table.
  -- local private_config_available, private_config = pcall(require, "private.plugins")
  -- if private_config_available then
  --   local private_plugins = private_config.get_plugins()
  --   for _, plugin in ipairs(private_plugins) do
  --     use(plugin)
  --   end
  -- end

})

