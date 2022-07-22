require('lint').linters_by_ft = {
    lua = {'luacheck',},
    python = {'pylint',}
}

vim.api.nvim_exec([[au InsertLeave,BufWritePost <buffer> lua require('lint').try_lint()]], false)
