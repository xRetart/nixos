return {
	'stevearc/oil.nvim',
	keys = {
		{ '<leader>po', '<cmd>Oil<cr>', desc = 'Manipulate directory contents' },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function() require('oil').setup() end,
}
