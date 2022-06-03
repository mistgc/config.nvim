vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Lsp config
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('conf.nvim-lsp-installer-conf')
		end
	}
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lua'
    -- Markdown Preview
	use 'iamcco/markdown-preview.nvim'

    -- lspsaga beautify the windows of lsp
	use {
        'tami5/lspsaga.nvim',
        config = function()
            -- require('conf.lspsaga-conf')
            require('lspsaga').setup{}
        end
    } 

	-- Dashboard
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
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

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd" -- 文件查找
        },
        config = function()
            require('telescope').setup{}
        end
    }
end)
