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
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      { "<leader>a", "", desc = "+search all", mode = { "n", "v" } },
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
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      local projects = {
        action = "ObsidianQuickSwitch",
        desc = " Obsidian-Notes",
        icon = "󱓩 ",
        key = "o",
      }

      projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
      projects.key_format = "  %s"

      table.insert(opts.config.center, 3, projects)
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      notes_subdir = "0_inbox",
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
      end,
    },
    keys = {
      -- add a keymap to browse plugin files
      { "<leader>o", "", desc = "+obsidian", mode = { "n", "v" } },
      {
        "<leader>on",
        "<cmd>ObsidianNew<cr>",
        desc = "New Obsidian File",
      },
      {
        "<leader>fo",
        "<cmd>ObsidianQuickSwitch<cr>",
        desc = "ObsidianQuickSwitch",
      },
      {
        "<leader>of",
        "<cmd>ObsidianQuickSwitch<cr>",
        desc = "ObsidianQuickSwitch",
      },
      {
        "<leader>os",
        "<cmd>ObsidianSearch<cr>",
        desc = "ObsidianSearch",
      },
      {
        "<leader>ot",
        "<cmd>ObsidianTemplate<cr>",
        desc = "ObsidianTemplate",
      },
      {
        "<leader>od",
        "<cmd>ObsidianToday<cr>",
        desc = "ObsidianToday",
      },
      {
        "<leader>oy",
        "<cmd>ObsidianYesterday<cr>",
        desc = "ObsidianYesterday",
      },
    },
  },
  {
    "williamboman/mason.nvim",
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
