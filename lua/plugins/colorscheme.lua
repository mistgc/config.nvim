return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  init = function()
    vim.cmd([[colorscheme rose-pine]])
  end,
}
