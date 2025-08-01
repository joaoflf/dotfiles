return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	dependencies = { "fang2hou/blink-copilot" },
	opts = {
		keymap = {
			preset = "super-tab",
			["<Tab>"] = {
				function(cmp)
					if vim.b[vim.api.nvim_get_current_buf()].nes_state then
						cmp.hide()
						return (
							require("copilot-lsp.nes").apply_pending_nes()
							and require("copilot-lsp.nes").walk_cursor_end_edit()
						)
					end
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},
		sources = {
			default = { "copilot", "snippets", "buffer", "path", "lsp" }, -- added more default sources and lsp completions
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
	},
}
