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
			-- Keep UI open on error
			dap.listeners.after.event_stopped["dapui_config"] = function()
				dapui.open()
			end

			dapui.setup({
				layouts = {
					{
						elements = {
							{
								id = "stacks",
								size = 0.20,
							},
							{
								id = "watches",
								size = 0.10,
							},
							{
								id = "breakpoints",
								size = 0.15,
							},
							{
								id = "scopes",
								size = 0.55,
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
			local dap = require("dap")
			local path = ".venv/bin/python"
			dap_python.setup(path)
			-- table.insert(dap.configurations.python, {
			-- 	type = "python",
			-- 	request = "launch",
			-- 	name = "Python: Current File",
			-- 	program = "${file}",
			-- 	pythonPath = function()
			-- 		return path
			-- 	end,
			-- 	stopOnEntry = false,
			-- 	console = "integratedTerminal",
			-- 	exceptionBreakpointFilters = { "raised", "uncaught" },
			-- })
		end,
	},
}
