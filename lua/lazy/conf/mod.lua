require('lualine').setup()
require('Comment').setup()
require('fidget').setup()
require('lazy.conf.treesitter')

local nvim_tree_attach = require('keymaps.nvim-tree')
require('nvim-tree').setup({
  on_attach = nvim_tree_attach
})
