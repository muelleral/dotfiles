return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    opts = {
      welcome_message = WELCOME_MESSAGE,
      loading_text = "loading",
      question_sign = "", -- you can use emoji if you want e.g. 🙂
      answer_sign = "ﮧ", -- 🤖
      max_line_length = 120,
      yank_register = "+",
      chat_layout = {
        relative = "editor",
        position = "50%",
        size = {
          height = "80%",
          width = "80%",
        },
      },
      settings_window = {
        border = {
          style = "rounded",
          text = {
            top = " Settings ",
          },
        },
      },
      chat_window = {
        filetype = "chatgpt",
        border = {
          highlight = "FloatBorder",
          style = "rounded",
          text = {
            top = " ChatGPT ",
          },
        },
      },
      chat_input = {
        prompt = "  ",
        border = {
          highlight = "FloatBorder",
          style = "rounded",
          text = {
            top_align = "center",
            top = " Prompt ",
          },
        },
      },
      openai_params = {
        model = "gpt-3.5-turbo",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        model = "code-davinci-edit-001",
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      keymaps = {
        close = { "<C-c>" },
        submit = "<C-m>",
        yank_last = "<C-y>",
        yank_last_code = "<C-k>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        toggle_settings = "<C-o>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
        -- in the Sessions pane
        select_session = "<Space>",
        rename_session = "r",
        delete_session = "d",
      },
    },
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
    keys = {
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>" },
    },
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        mode = { "n", "v" },
        ["<leader>r"] = { name = "+replace" },
      })
    end,
  },
  {
    "windwp/nvim-spectre",
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
        "c",
        "cmake",
        "cpp",
        "dockerfile",
        "help",
        "json",
        "lua",
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
        "clangd",
        "cmake-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "yaml-language-server",

        -- DAP
        "cpptools",
        "debugpy",

        -- Linters and Formatter
        "black",
        "clang-format",
        "flake8",
        "isort",
        "pylint",
        "stylua",
      },
    },
  },
}
