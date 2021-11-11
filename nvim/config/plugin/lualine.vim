call minpac#add('nvim-lualine/lualine.nvim')

lua << EOF
    require('lualine').setup {
        options = {
            theme = 'nord'
        },
        sections = {
            lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}}
        }
    }
EOF
