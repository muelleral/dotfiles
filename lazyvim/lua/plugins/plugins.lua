return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordfox",
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
