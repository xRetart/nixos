return {
	'mrcjkb/rustaceanvim',
	opts = {
		server = {
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
