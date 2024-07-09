-- https://github.com/ziontee113/icon-picker.nvim
return {
	'ziontee113/icon-picker.nvim',
	config = function()
		require('icon-picker').setup({ disable_legacy_commands = true })
		local opts = { noremap = true, silent = true }
		vim.keymap.set('n', '<C-i-e>', '<cmd>IconPickerYank emoji<cr>', opts)
		vim.keymap.set('n', '<C-i-s>', '<cmd><IconPickerYank symbols<cr>', opts)
		vim.keymap.set('n', '<C-i-f-a>', '<cmd>IconPickerYank alt_font<cr>', opts)
		vim.keymap.set('n', '<C-i-f-n>', '<cmd>IconPickerYank nerd_font<cr>', opts)
	end,
}
