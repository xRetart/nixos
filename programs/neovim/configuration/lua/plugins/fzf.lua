return {
	'ibhagwan/fzf-lua',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ '<leader>pf', function() require('fzf-lua').files({ path_shorten = true, cmd = 'fd --type f' }) end, desc = 'Find files' },
		{ '<leader>pF', function() require('fzf-lua').files({ path_shorten = true }) end,                      desc = 'Find files' },
		{ '<leader>ph', function() require('fzf-lua').files({ path_shorten = true, cwd_only = true }) end,     desc = 'Find files' },
		{ '<leader>ps', function() require('fzf-lua').live_grep() end,                                         desc = 'Live grep' },
	},
	config = function()
		require('fzf-lua').register_ui_select()
	end
}
