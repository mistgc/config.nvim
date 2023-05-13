require('mason').setup()
require('mason-lspconfig').setup()

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
local lsp_attach = require('keymaps.lsp_attach')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

local luasnip = require('luasnip')
local cmp  = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  mapping = cmp.mapping.preset.insert({
   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
   ['<C-f>'] = cmp.mapping.scroll_docs(4),
   ['<C-Space>'] = cmp.mapping.complete(),
   ['<CR>'] = cmp.mapping.confirm {
     behavior = cmp.ConfirmBehavior.Replace,
     select = true,
   },
   ['<Tab>'] = cmp.mapping(function(fallback)
     if cmp.visible() then
         cmp.select_next_item()
     else
         fallback()
     end
   end, { 'i', 's' }),
   ['<S-Tab>'] = cmp.mapping(function(fallback)
     if cmp.visible() then
         cmp.select_prev_item()
     else
         fallback()
     end
   end, { 'i', 's' }),
 })
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  }
})
