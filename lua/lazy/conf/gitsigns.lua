require('gitsigns').setup({
  current_line_blame_opts = {
    delay = 0,
  },
  on_attach = require('keymaps.gitsigns_attach')
})
