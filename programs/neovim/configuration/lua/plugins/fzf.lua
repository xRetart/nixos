return {
	'ibhagwan/fzf-lua',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ '<leader>pf', function() require('fzf-lua').files() end,     desc = 'Find files' },
		{ '<leader>ps', function() require('fzf-lua').live_grep() end, desc = 'Live grep' },
	},
}
