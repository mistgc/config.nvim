local function config()
  local lspconfig = require("lspconfig")
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local blink_cmp = require("blink.cmp").get_lsp_capabilities()
  local utils = require("utils")
  mason.setup({
    ui = {
      keymaps = {
        install_package = "l",
      },
    },
  })
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = utils.lsp_on_attach,
        capabilities = blink_cmp,
      })
    end,
  })

  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
    },
  })
end

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        opts = {
          lightbulb = {
            enable = false,
          },
        },
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons",
        },
      },
      {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        version = "v0.*",
        opts = {
          keymap = { preset = "super-tab" },
          appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
          },
          sources = {
            default = {
              "lsp",
              "path",
              "snippets",
              "buffer",
            },
          },
        },
        opts_extend = { "sources.completion.enabled_providers" },
      },
    },
    config = config,
  },
}
