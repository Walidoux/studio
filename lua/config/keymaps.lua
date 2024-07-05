-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Overriden keys should be provided in plugins/telescope.lua

local map = vim.keymap.set

map('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle NeoTree' })
