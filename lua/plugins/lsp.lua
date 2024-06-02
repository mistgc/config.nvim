local function lsp_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)
  vim.keymap.set("n", "go", "<cmd>Telescope diagnostics<cr>", bufopts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", bufopts)
  vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<cr>", bufopts)
  vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<cr>", bufopts)
  vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  vim.keymap.set("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  vim.keymap.set("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
  vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)
end

local function config()
  local lspconfig = require("lspconfig")
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local luasnip = require("luasnip")
  local snippet_loader = require("luasnip.loaders.from_vscode")
  local cmp = require("cmp")
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
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end,
  })

  snippet_loader.lazy_load()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
      { name = "nvim_lua" },
      { name = "luasnip" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
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
        "tami5/lspsaga.nvim",
        event = "LspAttach",
        config = function()
          require("lspsaga").setup()
        end,
      },
    },
    config = config,
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
}
