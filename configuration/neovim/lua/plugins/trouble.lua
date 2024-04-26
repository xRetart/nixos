return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = { { '<leader>pa', function() require('trouble').toggle() end } },
}
