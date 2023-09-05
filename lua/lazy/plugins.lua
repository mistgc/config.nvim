return {
  {
    -- Theme
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    init = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "jay-babu/mason-null-ls.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
    },
  },
  { "numToStr/Comment.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "romgrk/barbar.nvim" },
  {
    "tami5/lspsaga.nvim",
    event = "LspAttach",
    init = function()
      require("lspsaga").setup()
    end,
  },
  { "voldikss/vim-floaterm" },
  { "iamcco/markdown-preview.nvim", ft = { "markdown" }, event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "lewis6991/gitsigns.nvim" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  { "zaiic/pinmd.nvim" },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,

    config = function()
      require("gx").setup({
        open_browser_app = "xdg-open",
        handlers = {
          plugin = true,
          github = true,
          brewfile = true,
          package_json = true,
          search = true,
        },
        handler_options = {
          search_engine = "bing",
        },
      })
    end,
  },
  { "simrat39/rust-tools.nvim" }
}
