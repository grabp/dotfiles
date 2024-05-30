-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	use({
		"akinsho/nvim-bufferline.lua",
		after = "catppuccin",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("nvim-treesitter/playground")
	use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("alexghergh/nvim-tmux-navigation")

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	use("github/copilot.vim")

	use("airblade/vim-gitgutter")

	use({
		"folke/trouble.nvim",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	use("stevearc/dressing.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				ts_config = {
					lua = { "string" }, -- it will not add pair on that treesitter node
					javascript = { "template_string" },
					java = false, -- don't check treesitter on java
				},
			})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		requires = "JoosepAlviste/nvim-ts-context-commentstring",
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use({
		"stevearc/conform.nvim",
	})

	use("WhoIsSethDaniel/mason-tool-installer")
	use("mfussenegger/nvim-lint")
	use("AckslD/swenv.nvim")
	use("marene/nvm.vim")
	use("smolck/command-completion.nvim")

	use({
		"coffebar/neovim-project",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			{ "Shatur/neovim-session-manager" },
		},
	})
end)
