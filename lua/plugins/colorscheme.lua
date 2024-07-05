return {
	'projekt0n/github-nvim-theme',
	lazy = false,
	priortiy = 1000,
	config = function()
		require('github-theme').setup()
	end,
}
