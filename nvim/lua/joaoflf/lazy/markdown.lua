return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {
		render_modes = true, -- Render in ALL modes
		sign = {
			enabled = false, -- Turn off in the status column
		},
	},
	ft = { "markdown", "codecompanion" },
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
}
