return {
	"williamboman/mason.nvim",
	dependencies = {
		-- LSP Config
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- LSP Info
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		local on_attach = function(_, bufferNr)
			-- Helper Function to Setup LSP Keybinds
			local map = function(keys, func)
				vim.keymap.set("n", keys, func, { buffer = bufferNr })
			end

			-- Keybinds
			map("<leader>ca", vim.lsp.buf.code_action)
			map("K", vim.lsp.buf.hover)
			map("<leader>rn", vim.lsp.buf.rename)
		end

		-- Setup LSP
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			-- Ensure That These LSP's Are Installed
			ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake" },

			-- Enable/Disable Auto Install
			automatic_installation = false,
		})
		require("mason-lspconfig").setup_handlers({
			function(serverName)
				require("lspconfig")[serverName].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})

		-- Setup Snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Setup Autocompletion
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			-- Snippets
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- Keybinds
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- Autocompletion Sources
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},
		})
	end,
}
