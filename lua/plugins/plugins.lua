return {
	-- override nvim-cmp and add cmp-emoji
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-emoji' },
		event = 'InsertEnter',
		opts = function(_, opts)
			table.insert(opts.sources, { name = 'emoji' })
		end,
	},

	-- add pyright to lspconfig
	{
		'neovim/nvim-lspconfig',
		---@class PluginLspOpts
		opts = {
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {},
			},
		},
	},

	-- add tsserver and setup with typescript.nvim instead of lspconfig
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'jose-elias-alvarez/typescript.nvim',
			init = function()
				require('lazyvim.util').lsp.on_attach(function(_, buffer)
					vim.keymap.set('n', '<leader>co', 'TypescriptOrganizeImports', { buffer = buffer, desc = 'Organize Imports' })
					vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
				end)
			end,
		},
		---@class PluginLspOpts
		opts = {
			servers = {
				-- tsserver will be automatically installed with mason and loaded with lspconfig
				tsserver = {},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				tsserver = function(_, opts)
					require('typescript').setup({ server = opts })
					return true
				end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
	},

	-- add more treesitter parsers
	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			ensure_installed = {
				'bash',
				'html',
				'javascript',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'regex',
				'tsx',
				'typescript',
				'vim',
				'yaml',
			},
		},
	},

	-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
	-- would overwrite `ensure_installed` with the new value.
	-- If you'd rather extend the default config, use the code below instead:
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				'tsx',
				'typescript',
			})
		end,
	},

	-- the opts function can also be used to change the default opts:
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, '😄')
		end,
	},

	-- or you can return new options to override all the defaults
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = function()
			return {
				--[[add your custom lualine config here]]
			}
		end,
	},

	-- use mini.starter instead of alpha
	{ import = 'lazyvim.plugins.extras.ui.mini-starter' },

	-- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
	{ import = 'lazyvim.plugins.extras.lang.json' },

	-- add any tools you want to have installed below
	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = {
				'stylua',
				'eslint-lsp',
				'shellcheck',
				'prettierd',
				'shfmt',
				'flake8',
			},
		},
	},

	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				['javascript'] = { 'prettierd' },
				['typescript'] = { 'prettierd' },
				['vue'] = { 'prettierd' },
				['markdown'] = { 'prettierd' },
			},
		},
	},
}
