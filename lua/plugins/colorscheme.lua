-- https://github.com/projekt0n/github-nvim-theme#customize-palettes-and-groups
return {
	'projekt0n/github-nvim-theme',
	lazy = false,
	priortiy = 1000,
	config = function()
		require('github-theme').setup({
			palettes = {
				github_dark_default = {},
			},
			specs = {
				github_dark_default = {},
			},
			groups = {
				github_dark_default = {},
			},
			options = {
				styles = {
					comments = 'italic',
					functions = 'NONE',
					keywords = 'NONE',
					variables = 'NONE',
					conditionals = 'NONE',
					constants = 'NONE',
					numbers = 'NONE',
					operators = 'NONE',
					strings = 'NONE',
					types = 'NONE',
				},
			},
		})
	end,
}
