
local g = vim.g -- global vim variables
local cmd = vim.cmd
local keymap = vim.keymap.set

--leader/local leader
g.mapleader = [[,]]
g.maplocalleader = [[,]]

-- Terminal Mode
----------------
keymap('t', '<A-a>', [[<C-\><C-n>]])  -- leave terminal mode

-- window navigation
keymap('t', '<A-h>', [[<C-\><C-n><C-w>h]])
keymap('t', '<A-j>', [[<C-\><C-n><C-w>j]])
keymap('t', '<A-k>', [[<C-\><C-n><C-w>k]])
keymap('t', '<A-l>', [[<C-\><C-n><C-w>l]])

-- Insert Mode
--------------
keymap('i', 'jk', '<Esc>')
keymap('i', 'kj', '<Esc>')

-- Normal Mode
--------------
-- window navigation
keymap('n', '<A-h>', '<C-w>h')
keymap('n', '<A-j>', '<C-w>j')
keymap('n', '<A-k>', '<C-w>k')
keymap('n', '<A-l>', '<C-w>l')

-- buffer navigation
keymap('n', '<S-l>', '<cmd>bnext<CR>')
keymap('n', '<S-h>', '<cmd>bprevious<CR>')
keymap('n', '<leader>,', '<C-^>')

-- buffer commands
keymap('n', '<C-s>', '<cmd>write<CR>')
keymap('n', '<C-x>', [[<cmd>bp | bd #<CR>]])

-- splits
keymap('n', [[<leader>-]], '<cmd>sp<CR>')
keymap('n', [[<leader>|]], '<cmd>vsp<CR>')

-- substitution
keymap('n', '<leader>s', [["ayiw :%s/<C-r>a/]])
keymap('n', '<leader>S', [["ayiW :%s/<C-r>a/]])
keymap('v', '<leader>s', [["ay :%s/<C-r>a/]])

-- yank
keymap('n', 'Y', 'y$')
keymap('n', '<leader>yp', [[:let @+ = expand('%:p:h')<CR>]])
keymap('n', '<leader>yf', [[:let @+ = expand('%:t')<CR>]])

-- Visual Mode 
--------------
-- window navigation
keymap('v', '<A-h>', '<Esc><C-w>h')
keymap('v', '<A-j>', '<Esc><C-w>j')
keymap('v', '<A-k>', '<Esc><C-w>k')
keymap('v', '<A-l>', '<Esc><C-w>l')
