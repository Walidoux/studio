local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Default LazyConf: https://lazy.folke.io/configuration
require('lazy').setup({
	spec = {
		{ 'LazyVim/LazyVim', import = 'lazyvim.plugins', opts = { colorscheme = 'github_dark_default' } },

		-- Rust/Cargo workflow
		{ import = 'lazyvim.plugins.extras.lang.rust' },
		{ import = 'lazyvim.plugins.extras.lang.markdown' },

		-- Web development
		-- { import = "lazyvim.plugins.extras.lang.prisma" },
		-- { import = "lazyvim.plugins.extras.lang.vue" }
		-- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
		-- treesitter, mason and typescript.nvim. So instead of the above, you can use:
		{ import = 'lazyvim.plugins.extras.lang.typescript' },

		-- Miscellaneous
		{ import = 'lazyvim.plugins.extras.ui.mini-starter' }, -- use mini.starter instead of alpha
		{ import = 'lazyvim.plugins.extras.lang.json' }, -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc

		{ import = 'plugins' },
	},
	defaults = { lazy = false, version = false },
	install = { missing = true, colorscheme = { 'github_dark_default' } },
	checker = { enabled = true, frequency = 86400 }, -- check for updates once a day
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tutor",
				'tarPlugin',
				'tohtml',
				'zipPlugin',
			},
		},
	},
})
