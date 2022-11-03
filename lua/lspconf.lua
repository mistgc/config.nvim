require("nvim-lsp-installer").setup{
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}

local function attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

   -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", bufopts)
    -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", bufopts)
    -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    vim.keymap.set("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", bufopts)
    -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    vim.keymap.set("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", bufopts)
    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", bufopts)
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts) 
    -- 悬浮窗口上翻页，由 Lspsaga 提供
    vim.keymap.set("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
    -- 悬浮窗口下翻页，由 Lspsaga 提供
    vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'volar', 'pyright', 'html', 'gopls', 'taplo', 'tsserver', 'rust_analyzer', 'jdtls', 'clangd', 'cssls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    on_attach = attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
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
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
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
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
	{ name = 'buffer' },
	{ name = 'path'},
	{ name = 'nvim_lua'},
  },
}
vim.diagnostic.config({
	virtual_text = {
		prefix = '●',
	},
})


