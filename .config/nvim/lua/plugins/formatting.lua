return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Setup/Enable Conform.nvim
		require("conform").setup({
			-- Set The Name of The Formatter to Use For Each and Every Language
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
		})

		-- Keybinds
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			require("conform").format()
		end)
	end,
}
