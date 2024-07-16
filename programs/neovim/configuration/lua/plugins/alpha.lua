return {
	'goolord/alpha-nvim',
	dependencies = { { 'nvim-tree/nvim-web-devicons' } },
	config = function()
		require 'alpha'.setup(require('alpha.themes.dashboard').config)
		local dashboard = require('alpha.themes.dashboard')

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
			dashboard.button('f', '󰈞  Files', function() require('fzf-lua').files() end),
			dashboard.button('r', '  Recent Files', function() require('fzf-lua').oldfiles() end),
			dashboard.button('o', '  Manage Files', function() require('oil').open() end),
			dashboard.button('n', '  New file', '<cmd>ene <bar> startinsert <cr>'),
			dashboard.button('t', '  Find Text', function() require('fzf-lua').live_grep() end),
			dashboard.button('q', '󰗼  Quit Neovim', '<cmd>qa<cr>'),
		}
		vim.keymap.set('n', '<leader>m', '<cmd>Alpha<cr>', { silent = true })
	end
}
