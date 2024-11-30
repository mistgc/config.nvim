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
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
          { "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
        },
        version = "v0.*",
        opts = {
          keymap = { preset = "super-tab" },
          snippets = {
            expand = function(snippet)
              require("luasnip").lsp_expand(snippet)
            end,
            active = function(filter)
              if filter and filter.direction then
                return require("luasnip").jumpable(filter.direction)
              end
              return require("luasnip").in_snippet()
            end,
            jump = function(direction)
              require("luasnip").jump(direction)
            end,
          },
          appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
          },
          sources = {
            completion = {
              enabled_providers = {
                "lsp",
                "path",
                "snippets",
                "buffer",
              },
            },
            providers = {
              luasnip = {
                name = "luasnip",
                module = "blink.compat.source",

                score_offset = -3,

                opts = {
                  use_show_condition = false,
                  show_autosnippets = true,
                },
              },
            },
          },
        },
        opts_extend = { "sources.completion.enabled_providers" },
      },
    },
    config = config,
  },
}
