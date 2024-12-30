return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap = require('dap')
		dap.adapters.lldb = {
			type = 'executable',
			command = '/run/current-system/sw/bin/lldb-dap',
			name = 'lldb'
		}
		dap.configurations.c = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
			},
		}

		local dapui = require("dapui")
		local dap_before = dap.listeners.before
		dap_before.attach.dapui_config = function() dapui.open() end
		dap_before.launch.dapui_config = function() dapui.open() end
		dap_before.event_terminated.dapui_config = function() dapui.close() end
		dap_before.event_exited.dapui_config = function() dapui.close() end
	end
}
