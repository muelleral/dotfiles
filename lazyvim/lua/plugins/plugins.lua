return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
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
        ["*"] = { "codespell", "cspell" },
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
    "folke/snacks.nvim",
    opts = function(_, opts)
      table.insert(opts.dashboard.preset.keys, 3, {
        icon = "󱓩 ",
        key = "o",
        desc = "Obsidian Notes",
        action = ":ObsidianQuickSwitch",
      })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = false,
    opts = {
      ui = { enable = false },
      notes_subdir = "0_inbox",
      picker = {
        name = "snacks.pick",
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
      end,
    },
    keys = {
      { "<leader>o", "", desc = "+obsidian", mode = { "n", "v" } },
      {
        "<leader>on",
        "<cmd>Obsidian new<cr>",
        desc = "New Obsidian File",
      },
      {
        "<leader>fo",
        "<cmd>Obsidian open<cr>",
        desc = "Obsidian Open",
      },
      {
        "<leader>of",
        "<cmd>Obsidian open<cr>",
        desc = "Obsidian Open",
      },
      {
        "<leader>os",
        "<cmd>Obsidian search<cr>",
        desc = "Obsidian Search",
      },
      {
        "<leader>ot",
        "<cmd>Obsidian template<cr>",
        desc = "Obsidian Template",
      },
      {
        "<leader>od",
        "<cmd>Obsidian today<cr>",
        desc = "Obsidian Today",
      },
      {
        "<leader>oy",
        "<cmd>Obsidian yesterday<cr>",
        desc = "Obsidian Yesterday",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "cpptools", "cspell", "codespell" })
      end
    end,
  },
  { "alfaix/neotest-gtest" },
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-gtest").setup({
          mappings = { configure = nil },
        })
      )
    end,
  },
}
