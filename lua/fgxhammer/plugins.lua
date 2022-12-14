-- TODO pin versions
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Plugins go here
return packer.startup(function(use)
	-- UI
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovkyazdani42/nvim-tree.luaim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-treesitter/nvim-treesitter")
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use("p00f/nvim-ts-rainbow")

	-- Editing
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("tpope/vim-surround")
	use("windwp/nvim-ts-autotag")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("nvim-telescope/telescope-dap.nvim")

	-- Cmp plugins
	use("hrsh7th/nvim-cmp") -- the completion plugin
	use("hrsh7th/cmp-buffer") -- buffer competions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp cmp
	use("hrsh7th/cmp-nvim-lua") -- lsp lua

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- snippet pack

	-- LSP
	use("neovim/nvim-lspconfig") -- neovim LSP
	use("williamboman/nvim-lsp-installer") -- LSP installer
	use("jose-elias-alvarez/null-ls.nvim") -- For lint on save

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Colorschemes
	use("morhetz/gruvbox")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("Mofiqul/vscode.nvim")
	use("folke/tokyonight.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
