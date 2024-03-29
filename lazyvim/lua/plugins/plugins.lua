return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
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
        ["<leader>a"] = { name = "+search all" },
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
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").load({
        paths = {
          vim.fn.stdpath("config") .. "/snippets",
          vim.fn.stdpath("config") .. "/private_snippets",
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = { "pylint", "flake8" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "isort", "black" },
      },
      formatters = {
        black = {
          args = { "--line-length", "80" },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>af",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find all Files",
      },
      {
        "<leader>ag",
        function()
          require("telescope.builtin").live_grep({ additional_args = { "--hidden", "--no-ignore" } })
        end,
        desc = "Live Grep all Files",
      },
      {
        "<leader>aw",
        function()
          require("telescope.builtin").grep_string({ additional_args = { "--hidden", "--no-ignore" } })
        end,
        desc = "String Grep all Files",
      },
    },
  },
}
