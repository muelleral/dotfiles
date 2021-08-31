" Install nvim-cmp
call minpac#add('hrsh7th/nvim-cmp')
call minpac#add('hrsh7th/vim-vsnip')
call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-path')
  
lua <<EOF
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp'}
    }
  })
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.pyright.setup {
  capabilities = capabilities,
}
EOF

