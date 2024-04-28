return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		{ "nushell/tree-sitter-nu" },
	},

	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = { 'c', 'cpp', 'haskell', 'json', 'python', 'toml', 'lua', 'rust', 'vim', 'vimdoc', 'query', 'nu' },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
			},
		}
	end
}
