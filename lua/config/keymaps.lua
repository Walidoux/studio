-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Some keys are cannot be overriden and should be provided under plugins/telescope.lua

local map = vim.keymap

map.set('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle NeoTree' })
