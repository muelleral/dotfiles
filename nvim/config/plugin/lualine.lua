vim.api.nvim_exec([[call minpac#add('nvim-lualine/lualine.nvim')]], false)

require('lualine').setup {
    options = {
        theme = 'nord'
    },
    sections = {
        lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}}
    }
}
