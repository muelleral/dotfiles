return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_height = 0.99
      vim.g.floaterm_width = 0.99
      vim.g.floaterm_opener = "edit"
    end,
    keys = {
      { "<F6>", "<cmd>FloatermNew ranger<cr>" },
      { "<F7>", "<cmd>FloatermToggle<cr>" },
      { "<F7>", [[<c-\><c-n>:FloatermToggle<cr>]], mode = "t" },
      {
        "<F5>",
        [[:FloatermNew lazygit --use-config-file=${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml,${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/lg_nvim_config.yml<CR>]],
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--path-mappings=/code=/code/out",
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        mode = { "n", "v" },
        ["<leader>r"] = { name = "+replace" },
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>rr",
        '<cmd>lua require("spectre").open()<CR>',
        desc = "Search/Replace",
      },
      {
        "<leader>rw",
        '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
        desc = "Search current word",
      },
      {
        "<leader>rw",
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        desc = "Search visual selection",
        mode = "v",
      },
      {
        "<leader>rW",
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
        desc = "Search current word on current file",
      },
      {
        "<leader>rW",
        '<cmd>lua require("spectre").open_file_search()<CR>',
        desc = "Search visual selection in file",
        mode = "v",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        -- "help",
        "json",
        -- "lua",
        "make",
        "markdown",
        "python",
        "toml",
        "vim",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "bash-language-server",
        "cmake-language-server",
        "json-lsp",
        -- "lua-language-server",
        "pyright",
        "yaml-language-server",

        -- DAP
        "debugpy",

        -- Linters and Formatter
        "black",
        "flake8",
        "isort",
        "pylint",
        -- "stylua",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- python
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.pylint,
        nls.builtins.formatting.black.with({
          extra_args = { "--line-length", "80" },
        }),
        nls.builtins.formatting.isort,
      })
    end,
  },
}
