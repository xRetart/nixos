return {
	'chrisgrieser/nvim-spider',
	lazy = true,
	keys = {
		{ '<leader>w', function() require('spider').motion('w') end, mode = { 'n', 'o', 'x' } },
		{ '<leader>k', function() require('spider').motion('k') end, mode = { 'n', 'o', 'x' } },
		{ '<leader>b', function() require('spider').motion('b') end, mode = { 'n', 'o', 'x' } },
	}
}
