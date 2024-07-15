return {
	'mrcjkb/rustaceanvim',
	config = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					['rust-analyzer'] = {
						check = {
							command = 'clippy'
						}
					}
				}
			}
		}
	end
	-- opts = {
	-- 	server = {
	-- 		settings = {
	-- 			['rust-analyzer'] = {
	-- 				checkOnSave = {
	-- 					command = 'clippy',
	-- 				},
	-- 				imports = {
	-- 					granularity = {
	-- 						group = "crate",
	-- 						enforce = true,
	-- 					}
	-- 				}
	-- 			},
	-- 		},
	-- 	},
	-- }
}
