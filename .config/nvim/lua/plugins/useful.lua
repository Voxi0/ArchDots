return {
	-- Catppuccin Colorscheme/Theme
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = function()
			-- Configure and Set Catppuccin Colorscheme/Theme
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},

	-- Lualine.nvim - Blazingly Fast and Easy to Configure Statusline Plugin Written in Pure Lua
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		config = function()
			-- Setup Lualine
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
				},
			})
		end,
	},

	-- NvimTree - File Tree Explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		config = function()
			-- Setup NvimTree
			require("nvim-tree").setup()

			-- Keybinds
			vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", {})
		end,
	},

	-- NvimAutopairs - Autocompletes Characters Like '()'
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Comment.nvim - Smart and Powerful Comment Plugin
	{
		"numToStr/Comment.nvim",
		config = function()
			-- Setup/Enable Comment.nvim
			require("Comment").setup()
		end,
	},

	-- Bufferline.nvim - A Snazzy Bufferline Plugin
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		config = function()
			-- Setup/Enable Bufferline.nvim
			require("bufferline").setup({
				options = {
					always_show_bufferline = true,

					-- Sort Tabs
					sort_by = "insert_after_current",
					persistent_buffer_sort = false,

					-- Icons
					show_buffer_icons = true,

					-- Seperator
					seperator_style = "slope",

					-- Diagnostics
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},

	-- Toggleterm.nvim - A Nice Terminal Plugin
	{
		"akinsho/toggleterm.nvim",
		config = function()
			-- Setup/Enable Toggleterm.nvim
			require("toggleterm").setup()

			-- Keybinds
			vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm direction=horizontal<CR>", {})
		end,
	},
}
