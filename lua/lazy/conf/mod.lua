require('lualine').setup()
require('Comment').setup()
require('fidget').setup()
require('lazy.conf.treesitter')
require('lazy.conf.mason-null-ls')
require('lazy.conf.gitsigns')

local nvim_tree_attach = require('keymaps.nvim-tree')
require('nvim-tree').setup({
  on_attach = nvim_tree_attach
})
