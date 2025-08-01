return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"MeanderingProgrammer/render-markdown.nvim",
			{
				"echasnovski/mini.diff",
				config = function()
					local diff = require("mini.diff")
					diff.setup({
						-- Disabled by default
						source = diff.gen_source.none(),
					})
				end,
			},
			"j-hui/fidget.nvim", -- Display status
			"ravitemer/codecompanion-history.nvim", -- Save and load conversation history
			{
				"ravitemer/mcphub.nvim", -- Manage MCP servers
				cmd = "MCPHub",
				build = "npm install -g mcp-hub@latest",
				config = true,
			},

		},
	opts = {
		tools = {
			cmd = {
				enabled = true,
			},
			files = {
				enabled = true,
			},
			rag = {
				enabled = true,
			},
		},
		extensions = {
			history = {
				enabled = true,
				opts = {
					keymap = "gh",
					save_chat_keymap = "sc",
					auto_save = false,
					auto_generate_title = true,
					continue_last_chat = false,
					delete_on_clearing_chat = false,
					picker = "snacks",
					enable_logging = false,
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
				},
			},
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
	},		keys = {
			{
				"<Leader>ca",
				"<cmd>CodeCompanionActions<CR>",
				desc = "Open the action palette",
				mode = { "n", "v" },
			},
			{
				"<Leader>c",
				"<cmd>CodeCompanionChat Toggle<CR>",
				desc = "Toggle a chat buffer",
				mode = { "n", "v" },
			},
			{
				"<Leader>cc",
				function()
					vim.fn.feedkeys(":CodeCompanion ", "n")
				end,
				desc = "CodeCompanion with visual range in command line",
				mode = { "v" },
			},
		},
		strategies = {
			chat = {
				adapter = {
					name = "copilot",
					model = "claude-sonnet-4-20250514",
				},
			},
			cmd = {
				adapter = {
					name = "copilot",
					model = "claude-sonnet-4-20250514",
				},
			},
			inline = {
				adapter = {
					name = "copilot",
					model = "claude-sonnet-4-20250514",
				},
			},
		},
		init = function()
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}
