local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local keymap = vim.keymap.set
keymap('n', '<Leader>c', dap.continue())
keymap('n', '<Leader>b', dap.toggle_breakpoint())

-- vim.api.nvim_exec([[nnoremap <silent> <Leader>c <Cmd>lua require'dap'.continue()<CR>]], false)

-- vim.api.nvim_exec([[nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>]], false)
-- nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- vim.api.nvim_exec([[noremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>]], false)
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>  

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/alex/.local/bin/cpptools/bla2/extension/debugAdapters/bin/OpenDebugAD7',
}
local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  -- {
  --   name = 'Attach to gdbserver :1234',
  --   type = 'cppdbg',
  --   request = 'launch',
  --   MIMode = 'gdb',
  --   miDebuggerServerAddress = 'localhost:1234',
  --   miDebuggerPath = '/usr/bin/gdb',
  --   cwd = '${workspaceFolder}',
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  -- },
}


