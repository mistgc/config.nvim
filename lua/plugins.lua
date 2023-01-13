vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Lsp config
    use {
        'williamboman/mason.nvim',
        config = function()
            require('conf.mason-conf')
        end
    }
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'rafamadriz/friendly-snippets' -- Snippets (vscode-like) collection for different languages
    use {
        'L3MON4D3/LuaSnip', -- Snippets plugin
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'

    -- Rust
    use {
        'simrat39/rust-tools.nvim',
        config = function()
            require('conf.rust-tools-conf')
        end
    }

    -- Markdown Preview
    use 'iamcco/markdown-preview.nvim'

    -- lspsaga beautify the windows of lsp
    use {
        'tami5/lspsaga.nvim',
        config = function()
            require('conf.lspsaga-conf')
        end
    }

    -- Dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- Debuger
    use "ravenxrz/DAPInstall.nvim"
    use "ravenxrz/nvim-dap"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "nvim-telescope/telescope-dap.nvim"

    -- Comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {}
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

    -- Code highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('conf.treesitter-conf')
        end
    }

    use { 'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup {}
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
            require('conf.nvimtree-conf')
        end
    }

    use {
        'folke/tokyonight.nvim',
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd" -- 文件查找
        },
        config = function()
            require('conf.telescope-conf')
        end
    }
end)
