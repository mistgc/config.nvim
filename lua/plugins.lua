vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Lsp config
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- Comment plugin
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup{}
		end
  	}

	use 'xiyaowong/nvim-cursorword'

	use({
		"NTBBloodbath/galaxyline.nvim",
		-- your statusline
		config = function()
			require("galaxyline.themes.eviline")
		end,
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	})

	-- using packer.nvim
	use {'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('bufferline').setup{}
		end
	}

  	-- Dirctory Tree
	use {
    	'kyazdani42/nvim-tree.lua',
    	requires = {
      		'kyazdani42/nvim-web-devicons', -- optional, for file icon
    	},
    	tag = 'nightly', -- optional, updated every week. (see issue #1193)
		config = function()
			require('nvim-tree').setup{}
		end
	}

	use({
		'NTBBloodbath/doom-one.nvim',
		config = function()
			require('doom-one').setup({
				cursor_coloring = false,
				terminal_colors = false,
				italic_comments = false,
				enable_treesitter = true,
				transparent_background = false,
				pumblend = {
					enable = true,
					transparency_amount = 20,
				},
				plugins_integrations = {
					neorg = true,
					barbar = true,
					bufferline = false,
					gitgutter = false,
					gitsigns = true,
					telescope = false,
					neogit = true,
					nvim_tree = true,
					dashboard = true,
					startify = true,
					whichkey = true,
					indent_blankline = true,
					vim_illuminate = true,
					lspsaga = false,
				},
			})
		end,
	})
end)
