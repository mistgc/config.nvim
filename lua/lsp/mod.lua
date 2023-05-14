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
local loader = require('luasnip.loaders.from_vscode')
local cmp  = require('cmp')
loader.lazy_load()
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
    { name = 'luasnip' }
  },
  mapping = cmp.mapping.preset.insert({
   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
   ['<C-f>'] = cmp.mapping.scroll_docs(4),
   ['<C-Space>'] = cmp.mapping.complete(),
   ['<CR>'] = cmp.mapping.confirm {
     behavior = cmp.ConfirmBehavior.Replace,
     select = true,
   },
   ['<Tab>'] = cmp.mapping(function(fallback)
     if cmp.visible() then
       cmp.select_next_item()
     elseif luasnip.expand_or_locally_jumpable(1) then
       luasnip.jump(1)
     else
       fallback()
     end
   end, { 'i', 's' }),
   ['<S-Tab>'] = cmp.mapping(function(fallback)
     if cmp.visible() then
       cmp.select_prev_item()
     elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
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
