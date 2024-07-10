-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Reference from official docs: https://www.lazyvim.org/keymaps
-- Other reference: https://github.com/nikolovlazar/dotfiles/blob/main/.config/nvim/lua/config/keymaps.lua
-- Notes: some keys are cannot be overriden and should be provided under plugins/telescope.lua

local map = vim.keymap

map.set('n', '<C-n>', '<cmd>Neotree toggle<cr>', { desc = 'Toggle NeoTree' })
