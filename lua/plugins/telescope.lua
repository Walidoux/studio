return {
	'nvim-telescope/telescope.nvim',
	opts = {
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = { prompt_position = 'top' },
			sorting_strategy = 'ascending',
			winblend = 0,
		},
	},
	keys = {
		{ '<leader>/', '<cmd>normal gcc<cr>', { desc = 'Comment current line' } },
		{ '<leader>?', 'nnoremap <leader>fg <cmd>Telescope live_grep<cr>' },
		{ '<leader>x', LazyVim.ui.bufremove },
	},
}
