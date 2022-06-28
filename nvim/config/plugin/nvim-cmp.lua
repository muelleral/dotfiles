-- completion engine
vim.api.nvim_exec([[call minpac#add('hrsh7th/nvim-cmp')]], false)
vim.api.nvim_exec([[call minpac#add('onsails/lspkind-nvim')]], false)

-- completion sources
vim.api.nvim_exec([[call minpac#add('hrsh7th/cmp-buffer')]], false)
vim.api.nvim_exec([[call minpac#add('hrsh7th/cmp-nvim-lua')]], false)
vim.api.nvim_exec([[call minpac#add('hrsh7th/cmp-nvim-lsp')]], false)
vim.api.nvim_exec([[call minpac#add('hrsh7th/cmp-path')]], false)

-- snippet engine
vim.api.nvim_exec([[call minpac#add('L3MON4D3/LuaSnip')]], false)
vim.api.nvim_exec([[call minpac#add('saadparwaiz1/cmp_luasnip')]], false)
vim.api.nvim_exec([[call minpac#add('rafamadriz/friendly-snippets')]], false)

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    -- remove duplacte entries from suggestions
    -- https://github.com/hrsh7th/nvim-cmp/issues/511#issuecomment-1063014008
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        vim_item.menu = ({
                buffer = "[buf]",
                nvim_lua = "[API]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]"
            }
        }
        })[entry.source.name]
        vim_item.dup = ({
            buffer = 0,
            nvim_lua = 0,
            nvim_lsp = 0,
            path = 0,
            luasnip = 0
        })[entry.source.name] or 0
        return vim_item
      end
    },

    experimental = {
        native_menu = false,
        ghost_text = true
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },
    -- order sets priority for listed results
    sources = {
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'nvim_lua'},
        { name = 'nvim_lsp'},
        { name = 'buffer', keyword_length = 5 } -- completion starts only after 5th char
    }
})

-- ================================
-- luasnip config
-- ================================
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "~/.config/nvim/pack/minpac/start/friendly-snippets"},
    include = nil,  -- Load all languages
    exclude = {}
})
