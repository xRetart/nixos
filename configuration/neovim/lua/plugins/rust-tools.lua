return {
	'simrat39/rust-tools.nvim',
	opts = {
		server = {
			on_attach = function(_, _buffer)
				vim.keymap.set('n', '<leader>le', require('rust-tools').runnables.runnables)
			end,
			settings = {
				['rust-analyzer'] = {
					checkOnSave = {
						command = 'clippy',
					},
					imports = {
						granularity = {
							group = "crate",
							enforce = true,
						}
					}
				},
			},
		},
	}
}
