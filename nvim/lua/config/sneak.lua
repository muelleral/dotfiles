vim.cmd[[let g:sneak#label = 1]]

local keymap = vim.keymap.set
keymap('n', 'f', [[<Plug>Sneak_f]])
keymap('n', 'F', [[<Plug>Sneak_F]])
keymap('n', 't', [[<Plug>Sneak_t]])
keymap('n', 'T', [[<Plug>Sneak_T]])
