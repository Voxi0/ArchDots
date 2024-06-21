return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Setup Treesitter
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "c", "cpp", "rust" },
			sync_install = false,
			auto_install = true,
			highlight = {enable = true},
			indent = {enable = true},
		})
	end,
}
