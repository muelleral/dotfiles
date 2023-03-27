return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
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
