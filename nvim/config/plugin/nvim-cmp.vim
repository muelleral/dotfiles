call minpac#add('hrsh7th/nvim-cmp')

call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-path')
    
call minpac#add('L3MON4D3/LuaSnip')
call minpac#add('saadparwaiz1/cmp_luasnip')
call minpac#add('rafamadriz/friendly-snippets')

lua <<EOF
  local cmp = require'cmp'
  cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
    snippet = {
      expand = function(args)
        equire("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-w>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
            }
    },
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lsp'}
    }
  })
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- The following example advertise capabilities to `clangd`.
  require'lspconfig'.clangd.setup {
      capabilities = capabilities,
      }
  require'lspconfig'.pyright.setup {
      capabilities = capabilities,
      }

  require'lspconfig'.jsonls.setup {
      capabilities = capabilities,
      }

  -- ================================
  -- luasnip config
  -- ================================
  require("luasnip.loaders.from_vscode").lazy_load({
      paths = { "~/.config/nvim/pack/minpac/start/friendly-snippets"},
      include = nil,  -- Load all languages
      exclude = {}
  })

  local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
      return nil
  end
  
  local luasnip = prequire('luasnip')
  
  local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  
  local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
  else
      return false
  end
  end
  
  _G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
  elseif luasnip and luasnip.expand_or_jumpable() then
      return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
      return t "<Tab>"
  else
      return vim.fn['compe#complete']()
  end
  end
  _G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
  elseif luasnip and luasnip.jumpable(-1) then
      return t "<Plug>luasnip-jump-prev"
  else
      return t "<S-Tab>"
  end
  end
  
  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
  vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

EOF
