return {
	'goolord/alpha-nvim',
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },
	config = function()
		require 'alpha'.setup(require('alpha.themes.dashboard').config)
		local dashboard = require 'alpha.themes.dashboard'

		dashboard.section.header.val = {
			'                                                     ',
			'                                                     ',
			'  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
			'  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
			'  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
			'  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
			'  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
			'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
		}

		dashboard.section.buttons.val = {
			dashboard.button('f', '󰈞  Find File', function() require('telescope.builtin').find_files() end),
			dashboard.button('n', '  New file', '<cmd>ene <bar> startinsert <cr>'),
			dashboard.button('r', '  Recent Files', function() require('telescope.builtin').oldfiles() end),
			dashboard.button('t', '  Find Text', function() require('telescope.builtin').live_grep() end),
			dashboard.button('c', '  Configuration', '<cmd>e $MYVIMRC <bar> cd %:p:h<cr>'),
			dashboard.button('p', '  Manage Plugins', '<cmd>Lazy<cr>'),
			dashboard.button('q', '󰗼  Quit Neovim', '<cmd>qa<cr>'),
		}
		vim.keymap.set('n', '<leader>m', '<cmd>Alpha<cr>', { silent = true })
	end
}
