return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			dapui.setup({
				layouts = {
					{
						elements = {
							{
								id = "stacks",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.15,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "scopes",
								size = 0.35,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "console",
								size = 0.5,
							},
							{
								id = "repl",
								size = 0.5,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
			vim.keymap.set("n", "<leader>ds", ":DapStepInto<CR>")
			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<leader>dh", function()
				require("dap.ui.widgets").hover()
			end)
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap_python = require("dap-python")
			local path = ".venv/bin/python"
			dap_python.setup(path)
		end,
	},
}
