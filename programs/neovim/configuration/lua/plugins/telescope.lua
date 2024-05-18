return {
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.2',
		dependencies = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },
		keys = {
			{ '<leader>pf', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
			{ '<leader>ps', function() require('telescope.builtin').live_grep() end,  desc = 'Live grep' },
		},
		opts = {
			pickers = {
				find_files = {
					mappings = {
						i = {
							['<C-e>'] = 'move_selection_previous',
							-- ['<C-h>'] = 'move_to_top',
							-- ['<C-m>'] = 'move_to_middle',
							-- ['<C-l>'] = 'move_to_bottom',
						},
						n = {
							['n'] = 'move_selection_next',
							['e'] = 'move_selection_previous',
						},
					},
				},
			},
		}
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
		config = function() require('telescope').load_extension('ui-select') end,
	},
}
