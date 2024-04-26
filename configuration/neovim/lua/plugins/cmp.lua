return {
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'andersevenrud/cmp-tmux',
			'onsails/lspkind.nvim',
			'nvim-web-devicons',
		},
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				sources = {
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'tmux' },
					{ name = 'nvim_lsp' },
					{ name = 'crates' },
				},
				formatting = {
					format = function(entry, vim_item)
						if vim.tbl_contains({ 'path' }, entry.source.name) then
							local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item()
								.label)
							if icon then
								vim_item.kind = icon
								vim_item.kind_hl_group = hl_group
								return vim_item
							end
						end
						return require('lspkind').cmp_format { with_text = false } (entry, vim_item)
					end
				}
			})
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				},
				view = {
					entries = { name = 'wildmenu' }
				},

			})
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{
						name = 'cmdline',
						option = {
							ignore_cmds = { 'Man', '!' }
						}
					}
				})
			})
		end
	}
