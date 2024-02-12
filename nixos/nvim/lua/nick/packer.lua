-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd.packadd('packer.nvim')

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--  use({ 'rose-pine/neovim', as = 'rose-pine' })
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/playground")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-buffer" },
            { "hrsh7th/vim-vsnip"},
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
            { 'hrsh7th/cmp-cmdline' },
            { 'dcampos/nvim-snippy' },
            {'dcampos/cmp-snippy'}, 
            { "hrsh7th/cmp-nvim-lsp-document-symbol" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "windwp/nvim-autopairs", },

		},
	})

    use({"hrsh7th/nvim-compe"})
	use({ "nyoom-engineering/oxocarbon.nvim" })

	-- Unless you are still migrating, remove the deprecated commands from v1.x
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	-- use("hrsh7th/cmp-nvim-lsp")

	use("folke/tokyonight.nvim")
	--
	-- use({
	-- 	"folke/which-key.nvim",
	-- 	config = function()
	-- 		vim.o.timeout = true
	-- 		vim.o.timeoutlen = 300
	-- 		require("which-key").setup({})
	-- 	end,
	-- })
	use("norcalli/nvim-colorizer.lua")

	use("cocopon/colorswatch.vim")
	use("cocopon/pgmnt.vim")
	use("cocopon/inspecthi.vim")
	use("terrortylor/nvim-comment")

	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup({ autoresize = { width = 200 } })
			require("focus").setup({ autoresize = { height = 100 } })
		end,
	})
	use({
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({})
		end,
	})

	use("simrat39/rust-tools.nvim")
    use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    }
    use({
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
})

    use({"Yggdroot/indentLine"})
    use({"sbdchd/neoformat"})
    
        
end)
