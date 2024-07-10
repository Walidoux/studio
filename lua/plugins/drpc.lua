-- Further Cord config: https://github.com/vyfor/cord.nvim
return {
	'vyfor/cord.nvim',
	build = './build',
	event = 'VeryLazy',
	opts = {
		log_event = 'trace',
		editor = {
			image = 'https://i.postimg.cc/jjTZ1tmt/128x128-2x.png',
			client = '1258851506958893178',
			tooltip = '⚗️  Brewing code',
		},
		display = {
			show_repository = false,
			show_cursor_position = false,
			swap_icons = true,
		},
		idle = {
			timeout = 900000, -- ~15min
			text = '💤 Sleeping...',
		},
		text = {
			viewing = '👀 Checking {}',
			editing = '📝 Editing {}',
			file_browser = '🌎 Browsing files',
			plugin_browser = '🧩 Managing plugins in {}',
			lsp_manager = '⚙️  Configuring LSP in {}',
			vcs = '💾 Committing changes in {}',
			workspace = '  ',
		},
	},
}
