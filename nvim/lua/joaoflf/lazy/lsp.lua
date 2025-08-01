return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"j-hui/fidget.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = {
							python = {
								analysis = {
									reportLineLength = "warning",
									reportLineLengthSettings = {
										maxLineLength = 120,
									},
								},
							},
						},
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			virtual_text = {
				enable = true,
			},
		})
	end,
}
