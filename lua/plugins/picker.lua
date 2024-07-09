-- https://github.com/ziontee113/icon-picker.nvim
return {
	'ziontee113/icon-picker.nvim',
	config = function()
		require('icon-picker').setup({ disable_legacy_commands = true })
		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<C-ie>', '<cmd>IconPickerYank emoji<cr>', opts)
		vim.keymap.set('n', '<C-is>', '<cmd><IconPickerYank symbols<cr>', opts)
		vim.keymap.set('n', '<C-ifa>', '<cmd>IconPickerYank alt_font<cr>', opts)
		vim.keymap.set('n', '<C-ifn>', '<cmd>IconPickerYank nerd_font<cr>', opts)
	end,
}
