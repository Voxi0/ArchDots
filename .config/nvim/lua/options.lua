-- Disable Netrw - Neovim's Default File Explorer
vim.g.loadedNetrw = 1
vim.g.loaded_netrwPlugins = 1

-- Set Leader Key
vim.g.mapleader = " "

-- Line Numbering
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable/Disable True Colors
vim.opt.termguicolors = true

-- Indentation
vim.opt.smartindent = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false

-- Code Folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
