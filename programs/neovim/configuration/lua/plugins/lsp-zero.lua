return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		'neovim/nvim-lspconfig',
		{
			'williamboman/mason.nvim',
			build = function() pcall(vim.cmd, 'MasonUpdate') end
		},
		'williamboman/mason-lspconfig.nvim',

		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		vim.lsp.inlay_hint.enable(true)
		local lsp = require('lsp-zero').preset {}

		lsp.on_attach(function(client, buffer_number)
			lsp.default_keymaps({ buffer = buffer_number })

			local fzf = require('fzf-lua')
			vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
			vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
			vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
			vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
			vim.keymap.set('n', '<leader>lc', fzf.lsp_references)
			vim.keymap.set('n', '<leader>li', fzf.lsp_implementations)
			vim.keymap.set('n', '<leader>ld', fzf.lsp_definitions)
			vim.keymap.set('n', '<leader>ly', fzf.lsp_workspace_symbols)
		end)


		local config = require('lspconfig')
		config.lua_ls.setup(lsp.nvim_lua_ls())
		config.bashls.setup {}
		config.pyright.setup {}
		config.ruff.setup {}
		config.glslls.setup {}
		config.nushell.setup {}
		config.clangd.setup {}

		lsp.setup()
	end
}
